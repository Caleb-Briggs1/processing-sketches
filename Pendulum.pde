class trail {
  float x,y;
  trail (float x_,float y_) {
    x = x_;
    y = y_;
  }
  void run() {
   noStroke();
    ellipse(x,y,15,15);
  }
}
class pendulum {
  float theta,thetaMax, l,g, t;
  float x, y;
  float[] rgb  = {random(250),random(250),random(250)};
   float[] rgb2  = {random(250),random(250),random(250)};
   ArrayList<trail> a = new ArrayList();
  pendulum(float x_, float y_) {
    x = x_;
    y = y_;
    theta = 0;
    thetaMax = radians(90);
    l = 50 + random(50);
    g = 90;
    t = random(4.);
    for (int i = 0; 10 > i; i++) {
      a.add(new trail(0,0));
    }
    
  }
  void run() {
    if (mousePressed) {
      g = 90;
    }
    else {
      g = 20;
    }
    theta = thetaMax * sin( radians(sqrt(l/g) * t) );
    stroke(rgb[0],rgb[1],rgb[2],100);
    
    line(x,y,x + (sin(theta) * l), y + (cos(theta) * l) );
    fill(rgb2[0],rgb2[1],rgb2[2],20);
     for (int i = 0; a.size() > i; i++) {
      a.get(i).run();
    }
    a.remove(0);
    a.add(new trail(x+ (sin(theta) * l),y+ (cos(theta) * l)));
    ellipse(x + (sin(theta) * l),y + (cos(theta) * l),15,15);
    t+= 1;
    
  }
}

ArrayList<pendulum> a = new ArrayList();
void setup() {
  
  size(800,800);
  float w = width/2;
  for (int i = 0; 50 > i; i++) {
    
    a.add(new pendulum(w,random(height-100)));
    
  }
}
float r = 1;
void draw() {
  background(0);
blendMode(ADD);
  
  for (int i = 0; a.size() > i; i++) {
  a.get(i).run();
  }
}
