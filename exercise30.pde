ArrayList  pos = new ArrayList();
boolean[] keys = {false,false,false,false,false};
void setup() {
  size(displayWidth,displayHeight,P3D);
  for (int i = 0; 2000 > i; i++) {
    float[] test = {};
     test = append(test,random(-1,i*7));
      test = append(test,random(0));
      test = append(test,random(-1,i*7));
      test = append(test,random(35));
      pos.add(test);
  }
}
float z = 30;
float zoom = 1;
boolean first = false;
ball Test = new ball(0,-11,0);
void draw() {

if (mousePressed) {
  first = !first;
  delay(100);
}
  background(255);
  fill(250,0,0);
  textSize(530);
  textMode(CENTER);
  text((str(dist(Test.x,Test.y,Test.z,0,0,0))),5000,Test.y,5000);
  lights();
 
    
    if (first) {
  camera(Test.x-90,Test.y-mouseY,Test.z-90,Test.x,Test.y,Test.z,0,1,0);
    }
    else {
      float a = 0;
      if (!Test.airBorn) {
        a = 0;
      }
      else {
        a = 1;
      }
      float offset  = 5;
       camera(Test.x-5,Test.y-offset,Test.z-offset,Test.x+(cos(radians(Test.dir)))-offset,Test.y+(mouseY/(height*.25))-offset,Test.z+sin(radians(Test.dir))-offset,0,1,0);
    }
    
  Test.update(pos);
 if (key == '-') {
   z++;
 }
 if (key == '+') {
   z--;
 }
  for (int i =0; pos.size() > i; i++) {
    pushMatrix();
    translate(((float[])pos.get(i))[0],((float[]) pos.get(i))[1],((float[]) pos.get(i))[2]);
    fill(((float[])pos.get(i))[0],((float[]) pos.get(i))[1],((float[]) pos.get(i))[2],50);
    box( ((float[])pos.get(i))[3]);
    popMatrix();
  }
  sphere(10);
  Test.key();
}

void keyPressed() {
  if (key == 'w') {
    keys[0] = true;
  }
  if (key == 's') {
    keys[1] = true;
  }
  if (key == 'a') {
    keys[2] = true;
  }
  if (key == 'd') {
    keys[3] = true;
  }
  if (key == ' ') {
    keys[4] = true;
  }
  
}
void keyReleased() {
 if (key == 'w') {
    keys[0] = false;
  }
  if (key == 's') {
    keys[1] = false;
  }
  if (key == 'a') {
    keys[2] = false;
  }
  if (key == 'd') {
    keys[3] = false;
  }
  if (key == ' ') {
    keys[4] = false;
  }
}
class ball {
  float x,y,z;
  float dir = 0;  //use dir and power instead
  float power = 0;
  float velX,velY,velZ;
  float size = 10;
  boolean airBorn =false;
  ball (float x_, float y_,float z_) {
    x = x_;
    y = y_;
    z = z_;
    velX = 0;
    velY = -1;
    velZ = 0;
  }
  void update(ArrayList pos) {
    //dir = mouseX;
     for (int i = 0; pos.size() > i; i++) {
       //((float[])pos.get(i))[3]/2
      if (dist(x+velX,y+velY,z+velZ,((float[])pos.get(i))[0],((float[])pos.get(i))[1],((float[])pos.get(i))[2]) < ((float[])pos.get(i))[3]/2 + size) {
        //velX *= -1;
        //velZ *= -1;
         airBorn = false;
        if (keys[4]) {
          
          velY = -1;
           airBorn = true;
        }
        else {
          velY *= 0;
        }
       
        
       
        if (dist(x+velX,y+velY,z+velZ,((float[])pos.get(i))[0],((float[])pos.get(i))[1],((float[])pos.get(i))[2]) < ((float[])pos.get(i))[3]/2 + size) {
       
        
          //y -= .1;
        }
        
      }
      if (y > 50) {
        y = 0;
         z = 0;
        x = 0;
        power = 0;
      }
    }
    velX = cos(radians(dir)) *power;
    velZ = sin(radians(dir)) * power;
    x += velX;
    //y is special for jumping
    z += velZ;
    y += velY;
    velY += .01;
    //power *= .9999; //NO FFRICTION
    pushMatrix();
    translate(x,y,z);
    
    sphere(size);
    
    popMatrix();
   
    
   
  }
  void key() {
    
    if (keys[2]) {
       dir -= 1;

    }
    if (keys[3]) {
       dir += 1;
    }
    if (keys[0]) {
      power += 0.002;
    }
    if (keys[1]) {
       power -= 0.002;
    }
  }
}
