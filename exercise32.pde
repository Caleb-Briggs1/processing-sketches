
int size = 105;
ArrayList grav = new ArrayList();
void setup() {
  blendMode(ADD);
  fullScreen();
  grav.add(new Particle(width/2,height/2));
  ((Particle)grav.get(0)).size2 = 12500;
  ((Particle)grav.get(0)).velX = 0;
   ((Particle)grav.get(0)).velY = 0;
  for(int i = 0; size > i; i++) {
    grav.add(new Particle(random(width),random(height)));
  } 
  background(0);
}
float[] points = {};
void draw() {
  if ((int)random(frameCount*2) == 1) {
    background(0);
  }
   float[] p = {mouseX,mouseY};
    points = p;
    
  
  //background(0);
  for (int i = 0; grav.size() > i; i++) {
     if(((Particle)grav.get(i)).update(grav)) {
       grav.remove(i);
       i++;
     }
  }
   for (int i = 0; grav.size() > i; i++) {
     ((Particle)grav.get(i)).move();
  }
}
class Particle {
  float x,y;
  float b = 10;
  float velX = random(-1,1)*b;
  float velY = random(-1,1)*b;
  float size2;
  float multi = 1;
  Particle(float x_, float y_) {
    
 
    size2 = random(5,500);
   
    x = x_;
    y = y_;
  }
  void move() {
     x += velX;
    y += velY;
  }
  boolean update(ArrayList points) {
    noFill();
    int i = 0;
      
      float[] xy = getXY(x,y,((Particle)points.get(i)).x,((Particle)points.get(i)).y);
      float a = dist(x,y,((Particle)points.get(i)).x,((Particle)points.get(i)).y);
if (a < 12500/100 && a!= 0) {
  return true;
}
 
   float constant = 1.95 ;
   float val = constant*((Particle)points.get(i)).size2/(a*a);
   //float val = points[i].size2*size2/(a*a) * constant;
  //calc
  
  
  
  if (size2 != 12500) {
    velX += xy[0] *val ;
    velY += (xy[1] * val);
  }
  
    
    
    
    
    //size2 += 0.01;
   
    //velX *= .999;
    //velY *= .999;
    
   
    
    float speed = (abs(velX) + abs(velY)) * 20;
    /*
    if (x > width || x < 0) {
      velX *= -.5;
    }
    if (y > height || y < 0) {
      velY *= -.5;
    }
    */
    
    stroke(velY*20,velX*20 + 50,size2);
   
   if (size2 == 12500) {
     //fill(frameCount%10,5,0);
  }
    ellipse(x,y,size2/50,size2/50);
   return false;

    
  }
}
float[] getXY(float x, float y, float x2, float y2) {
  PVector a = new PVector(x,y);
  PVector b = new PVector(x2,y2);
  PVector ts = b.sub(a).normalize();
  float[] temp = {ts.x,ts.y};
  return temp;
}
