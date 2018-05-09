class particle {
  float x,y;
  PVector draw = new PVector(0,0);
  float colo = random(250);
  float gens = 20;
  particle( float x_, float y_) {
    x = x_;
    y =y_;
  }
  void run() {
    stroke(colo,gens/5,gens/15,gens);
   gens +=1;
    point(x,y);
    x += draw.x/205.0;
    y += draw.y/205.0;
    
  }
  void draw() {
    fill(0,0,0,0);
    //ellipse(x,y,5,5);
    stroke(250);
    
    line(x,y,x+draw.x,y+draw.y);
    
  }
  
  
}
class charged {
  float x, y;
  float charge;
  int maxSize = 45;
  charged( float x_, float y_,float charge_) {
    x = x_;
    y =y_;
    charge = charge_;
  }
  void draw() {
    if (charge > 0) {
      fill(0);
    ellipse(x,y,charge/500.0,charge/500.0);
    }
    else {
      fill(255);
      ellipse(x,y,charge/500.0,charge/500.0);
    }
  }
  float calc(float x_, float y_) {
    float dist = pow(dist(x,y,x_,y_),2);
    if (charge/dist > 0) {
      return min(maxSize,charge/dist);
    }
   
      return max(-maxSize,charge/dist);
    
    
  }
  float dir (float x_ , float y_) {
    return atan2(y-y_,x-x_);
  }
}
particle[] run = new particle[300];
ArrayList<charged> b = new ArrayList();
void setup() {
  size(600,500);
  for (int i = 0; run.length > i; i++) {
    run[i] = new particle(i*30 % width, i*30 / width * 32);
  }
  b.add(new charged(mouseX,mouseY,1000));
}
float charge = random(1000,10000);
boolean isrun = false;
void draw() {
  
  
  
  if (key == 'r') {
    if (!isrun) {
      background(255);
    }
    isrun = true;
    for (int i = 0; run.length > i; i++) {
    run[i].run();
    }
    for (int i = 0; run.length > i; i++) {
     for (int j = 0; b.size() > j; j++) {
        b.get(j).draw();
  
      float dir = b.get(j).dir(run[i].x,run[i].y);
      float val = b.get(j).calc(run[i].x,run[i].y);
       
        run[i].draw.add( new PVector( cos(dir) * val, sin(dir) * val));
     }
     }
  }
  else {
    background(0);
    b.set(b.size()-1,new charged(mouseX,mouseY,charge));
  for (int i = 0; run.length > i; i++) {
    run[i].draw();
    run[i].draw = new PVector(0,0);
  }
  if (mousePressed) {
    b.add(new charged(mouseX,mouseY,charge));
    delay(500);
    charge = random(-20000,20000);
  }
  
  
  
  
    for (int i = 0; run.length > i; i++) {
     for (int j = 0; b.size() > j; j++) {
        b.get(j).draw();
  
      float dir = b.get(j).dir(run[i].x,run[i].y);
      float val = b.get(j).calc(run[i].x,run[i].y);
       
        run[i].draw.add( new PVector( cos(dir) * val, sin(dir) * val));
     }
     }
  }
  
}