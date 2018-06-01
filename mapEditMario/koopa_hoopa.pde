class we_be_hoopin {
  float x,y;
  PVector vel = new PVector(0,0);
  int dir = 0;
  int size = 25;
  PImage images;
  we_be_hoopin(float x_, float y_) {
    x = x_;
    y = y_;
    images = loadImage("dope.png");
    
  }
  boolean hitBody(float x_, float y_) {
    if ( abs( x_ - x) < size/2 && abs( y_ - y) < size/2) { //hard coded boi
    
      if ( ( y_ - y) >= -2)  {
        return true; //hit body
       
      }
    }
    return false;
  }
  boolean hitHead(float x_, float y_) {
    if ( abs( x_ - x) < size/2 && abs( y_ - y) < size/2) { //hard coded boi
    
      if ( ( y_ - y) < -2)  {
        return true;
       
      }
    }
    return false;
  }
  void draw(mapEdit map, float camX, float camY) {
    boolean hit = true;
    //increase hit box size
    //figure out how to change direction
    //for the plant make its lowe rportion get long by pasting mor eimages
    fill(250,0,0);
  //  rect(x + camX + width/2,y + camY + height/2,7,7);
  imageMode(CENTER);
  
  
    vel.y += 0.1;
    y += vel.y;
    vel.x *= .9;
    x += vel.x;
        //rect(x + camX + width/2,y + camY + height/2, -size ,size);
    if (dir == 0) {
      vel.x =-.5;
      image(images.get(43*((frameCount/10) %3),15,37,37), x + camX + width/2,y + camY + height/2 + 5, -size ,size);
    }
    else {
      vel.x = .5;
       
        pushMatrix();
       pushMatrix();
       
       translate(x + camX + width/2,y + camY + height/2+5 );
       scale(-1.0, 1.0);
       image(images.get(43*((frameCount/10) %3),15,37,37), 0,0,-size ,size);
       popMatrix();
       popMatrix();
    }

    
    
    hit = false;
    boolean hit2 = false;
    for (int i = 0; map.items.size() > i; i++) {
    float[] al = map.items.get(i);
    if ( abs((al[0] - (x + vel.x))) < al[2]/2   && abs(al[1] - (y + vel.y)) < al[2]/2 + size/2) {
      vel.y = -0.1;
      //y = top needs to be added
     
     if (al[1] - (y + vel.y ) > size/2) { 
      y = al[1] - al[3]/2 - size/2 + .3;
      if (!hit2) {
      hit = true;
      }
      
     }
      if (al[1] - (y + vel.y ) < size/2) {
         hit2 = true;
        hit = false;
      }
    }
    
    
    }
    if (!hit) {
      //y-= .09;
       if (dir == 1) {
         dir = 0;
       }
       else {
         dir = 1;
       }
       
    }
    
    
  }
}