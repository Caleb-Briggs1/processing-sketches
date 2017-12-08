//import android.view.MotionEvent;

int size = 1235;
Particle[] grav = new Particle[size];
void setup() {
  
  fullScreen();
  for(int i = 0; size > i; i++) {
    grav[i] = new Particle(random(width),random(height));
  }
}
float[] points = {};
void draw() {
  
   float[] p = {mouseX,mouseY};
    points = p;
    
  
  background(0);
  for (int i = 0; size > i; i++) {
     grav[i].update(grav);
  }
}
class Particle {
  float x,y;
  float b = 0;
  float velX = random(-1,1)*b;
  float velY = random(-1,1)*b;
  float size2;
  
  Particle(float x_, float y_) {
    size2 = random(20,500);
    x = x_;
    y = y_;
  }
  void update(Particle[] points) {
    noFill();
    for (int i = 0; points.length > i; i++) {
      
      float[] xy = getXY(x,y,points[i].x,points[i].y);
      float a = dist(x,y,points[i].x,points[i].y);
    if (a < size2) {
      a = size2;
 }
   float constant = 5.95 ;
   float val = points[i].size2*size2/(a*a) * constant;

    velX += xy[0] *val* 1/(size2*size2);
    velY += (xy[1] * val* 1/(size2*size2));
    
    
    }
    
    //size2 += 0.01;
   
    //velX *= 1/size2;
   // velY *= 1/size2;
    
    x += velX;
    y += velY;
    float speed = (abs(velX) + abs(velY)) * 20;
    
    if (x > width || x < 0) {
      velX *= -.5;
    }
    if (y > height || y < 0) {
      velY *= -.5;
    }
    
    stroke(velY*20,velX*20,size2/2);
   // point(x,y);
    ellipse(x,y,size2/10,size2/10);
    
  }
}
float[] getXY(float x, float y, float x2, float y2) {
  PVector a = new PVector(x,y);
  PVector b = new PVector(x2,y2);
  PVector ts = b.sub(a).normalize();
  float[] temp = {ts.x,ts.y};
  return temp;
}