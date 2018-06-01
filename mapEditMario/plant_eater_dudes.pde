class back_in_NAM {
  float x,y;
  int time = 0;
  int dir = 0;
  int reset = 300;
  float[] pos = {0,(int)random(1,5) * 36}; //min, max
  float yPlus = 0;
  float speed = 1;
  PImage head;
  PImage body;
   back_in_NAM(float x_, float y_) {
    x = x_;
    y = y_;
    head = loadImage("head.png");
    body = loadImage("leaf.png");
  } 
  void run(float camX,float camY) {
    rectMode(CENTER);
    time += 1;
    time %= reset;
    if (time > reset/2) {
      if (yPlus <= pos[1]) {
      yPlus += speed;
      }
    }
    else {
      if (yPlus >= pos[0]) {
      yPlus -= speed;
      }
    }
    fill(0,240,250);
    //imageMode(CORNER);
    for (int i = 0; yPlus/15 > i; i++) {
      image(body,x+ camX + width/2,y+ camY + height/2 - i * 15,15,15);
    }
    image(head,x+ camX + width/2,y+ camY + height/2 -yPlus,15,15);
    
    //rect(x+ camX + width/2,y+ camY + height/2 - yPlus/2,15,15+yPlus);
    rectMode(CENTER);
    imageMode(CENTER);
  }
  boolean hit(float x2, float y2) {
    if ( abs(x2 -x) < 7.5 && abs(y2-(y-yPlus)) <(15) && yPlus > 0) {
      return true;
    }
    return false;
    
  }
  
}