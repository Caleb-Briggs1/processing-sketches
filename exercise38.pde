class particle {

  float x,y,sz,sz2,tmp;
  particle(float x_, float y_, float size1, float size2, float temparature) {
    x = x_;
    y = y_;
    sz = size1;
    sz2 = size2;
    tmp = temparature;
  }
  void update() {
   
    ellipse(x,y,sz,sz);
    x+= random(-tmp/sz,tmp/sz);
    //x += tmp;
    y += random(-tmp/sz,tmp/sz);
    //y += tmp;
    if(tmp == 0) {
      tmp += 1;
    }
  }
}


particle[] brownian = new particle[250];
void setup() {
  size(800,800);
  for (int i = 0; 250 > i; i++) {
    brownian[i] = new particle(random(width),random(height),random(10),random(10),random(5));
  }
}
void draw() {
  noStroke();
  background(0);
  for (int i = 0; 250 > i; i++) {
    brownian[i].update();
  }
  
}

