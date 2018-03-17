class trail {
  float x,y,z;
  trail (float x_, float y_, float z_) {
    x = x_;
    y = y_;
    z = z_;
  }
  void show() {
    pushMatrix();
    translate(x,y,z);
    box(25);
    popMatrix();
  }
}

class brownMan { 
  ArrayList<trail> b = new ArrayList();
  float x,y,z;
  PVector vel;
  //PVector acel = new PVector(random(-2.,2.), random(-2.,2.), random(-2.,2.));
  float[] rgb = {random(250),random(250),random(250)};
  brownMan() {
    x = random(400);
    y = random(400);
    z = random(400);
    vel = new PVector(random(-2.,2.), random(-2.,2.), random(-2.,2.));
    for (int i = 0; 50 > i; i++) {
      b.add(new trail(x,y,z));
    }
  }
  void display() {
    if ((int)random(20) == 1 ) {
      vel = new PVector(random(-2.,2.), random(-2.,2.), random(-2.,2.));
    }
    for (int i = 0; b.size() > i; i++) {
      b.get(i).show();
    }
    b.remove(0);
    b.add(new trail(x,y,z));
        
    //vel = vel.mult(.9);
    pushMatrix();
    translate(x,y,z);
    
    x += vel.x * 3;
    y += vel.y* 3; 
    z += vel.z* 3;
    
    noStroke();
    fill(rgb[0],rgb[1],rgb[2]);
    box(25);
    popMatrix();
    
    if (x > width*3 || 0 > x) {
      vel.x *= -1;
      
    }
    if (y > width*3 || 0 > y) {
      vel.y *= -1;
      
    } 
    if (z > width*3 || 0 > z) {
      vel.z *= -1;
      
    }
  }
  
  
}
class brownian {
  ArrayList<brownMan> a = new ArrayList();
  void init() {
    for (int i = 0; 50 > i; i++) {
      a.add(new brownMan());
    }
  }
  void update() {
    
    for (int i = 0; a.size() > i; i++) {
      (a.get(i)).display();
    }
  }
  
}
view b = new view();
 brownian a= new brownian();
void setup() {
 size(600,600,P3D);
 a.init();
}
void draw() {
  background(255);
  b.run();
  a.update();
  
}


void keyPressed() {
  b.keyPres();
}
void keyReleased() {
  b.keyRel();
}
