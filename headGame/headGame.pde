guy test = new guy(0,0);

soccerBal a = new soccerBal(250,250);
void setup() {
  rectMode(CENTER);
  size(900,800);
}
void draw() {
 background(255);
  test.move();

  a.move(test);
  
}
class goal {
  float x, y;
  goal(float x_, float y_) {
    x = x_;
    y = y_;
    
  }
}
class guy {
  float x,y;
  float velX =0;
  float velY = 0;
  float low= 800-50;
  float size = 30;
  float dir = 0;
  guy(float x_, float y_) {
    x = x_;
    y = y_;
    
  }
 
  void run() {
    if (keyCode == LEFT) {
      dir = 1;
    }
    if (keyCode == RIGHT) {
      dir = 0;
    }
    if (keyCode == UP) {
      dir = 2;
    }
  }
  void move() {
    rect(x,y,size,size);
    if (keyPressed && dir == 0) {
      velX +=.5;
    }
     if (keyPressed && dir == 1) {
      velX -=.5;
    }
    if (keyPressed && dir == 2 && abs(y-low) < 2) {
      velY = -10;
    }
    velX *= .97;
    if ( x+velX > width || 0 > x+velX) {
      velX *= -1;
    }
    x += velX;
    y += velY;
    velY += .5;
    
    if (y >=  low) {
      y = low;
      velY = 0;
    }
    
    
    
  }
  
}
class soccerBal{
   float x,y;
  float velX =0;
  float velY = 0;
  float low = 800-50;
  
  soccerBal ( float x_, float y_) {
    x = x_;
    y = y_;
    
  }
  void move(guy b) {
    if ( abs((x-b.x)) < b.size && abs(y-b.y) < b.size) {
      if ( (b.velX > 0 && velX < 0) || ( b.velX < 0 && velX > 0) ) {
        velX *=-1;
        //b.velX += -velX/2;
        //b.velY 
      }
      else {
      velX += b.velX;
      velY += b.velY/2;
      b.velX *= .9;
      b.velY *= .9;
      }
    }
  rect(x,y,10,10);
    velY *= .99;
    velX *= .97;
    if ( x+velX > width || 0 > x+velX) {
      velX *= -1;
    }
    if ( 0 > y ) {
      velY *= -1;
    }
    x += velX;
    y += velY;
    velY += .25;
   
    
    if (y >=  low) {
      y = low;
      velY *= -.95;
    }
    
    
    
  }
}
void keyPressed() {
  test.run();

}
  