class character {
  float x,y;
  boolean[] keys = {false,false,false,false};
  PVector vel = new PVector(0,0);
 PImage toad;
  character (float x_, float y_) {
    x = x_;
    y = y_;
    toad = loadImage("toad.png");
  }
  void draw(float camX, float camY) {
    fill(0,250,0);
    stroke(0);
    imageMode(CENTER);
    if (abs(vel.x) > 0) {
     // rect(x+camX+width/2,round(y+camY + height/2 ) ,14,14);
    image(toad.get( ((frameCount/10)%8) * 30,0,31,28),x+camX+width/2,round(y+camY + height/2 ) ,14,14);
    
    }
    else {
      //rect(x+camX+width/2,round(y+camY + height/2 ) ,14,14);
      image(toad.get( ((0)%8) * 30,0,31,28),x+camX+width/2,round(y+camY + height/2 ) ,14,14);
    }
    //rect(x+camX+width/2,y+camY + height/2,7,7);
    vel.y += .1;
    y += vel.y;
    x += vel.x;
    vel.x *= .92;
    if (keys[0]) {
     
      if (vel.x < 1.0) {
        vel.x += .15;
      }
      if (vel.x < 0) {
        vel.x *= .6;
      }
     
      
        }
      if (keys[1]) {
        if (vel.x > -1.2) {
      vel.x -= .2;
        }
        if (vel.x > 0) {
        vel.x *= .6;
      }
        
        }
    
  }
  void hit() {
   
      vel.y = 0;
      //vel.x *= .95;
      //y -= 1;
      if (keys[2]) {
        vel.y = -2.5;
      }
      
      
    
  }
  void keyPres() {
    if (keyCode == RIGHT) {
       keys[0] = true;
     }
     if (keyCode == LEFT) {
       keys[1] = true;
     }
     if (keyCode == UP) {
        keys[2] = true;
     
     }
     if (keyCode == DOWN) {
       keys[3] = true;
     }
    
  }
  void keyRel() {
    if (keyCode == RIGHT) {
       keys[0] = false;
     }
     if (keyCode == LEFT) {
       keys[1] = false;
     }
     if (keyCode == UP) {
        keys[2] = false;
     
     }
     if (keyCode == DOWN) {
       keys[3] = false;
     }
    
  }
}