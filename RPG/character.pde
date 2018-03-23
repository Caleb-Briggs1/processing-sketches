class character {
  int x,y;
  int movSpeed = 4;
  boolean[] keys = {false,false,false,false}; //up, down, left right  | add space later
  int dirCostume = 1;
  PImage look = new PImage() ;//this will get cahnged later
  float curCostume = 0;
  int dir = 0;
  boolean hit = false;
  int[] mov;
  character (int x_, int y_) {
    x = x_;
    y = y_;
   
  }
  void init() {
     look = loadImage("virgil.png");
     //demon.png is another thign that works
  }
  
  void reset() {
    hit = false;
    mov = doKey();
    if( mov[0] > 0) {
        dir = 2;
      }
      if( mov[0] < 0) {
        dir = 1;
      }
      if( mov[1] > 0) {
        dir = 0;
      }
       if( mov[1] < 0) {
        dir = 3;
      }
      if(mov[0] != 0 || mov[1] != 0) {
        curCostume += 0.25*dirCostume;
       
        if (curCostume >= 2.75 || curCostume < .25) {
          dirCostume *= -1;
        }
      }
     
  }
  void update(chunk Chunk, int id) {
    
    
    if ((Chunk.hit(id,x+mov[0],y + mov[1]))) {
      
      
      hit = true;
    }
    
    
    //rect(width/2,height/2,15,15); //this would be look part
    
   
  }
  void run() {
    if (!hit) {
      if (abs(mov[0]) == abs(mov[1])) {
        mov[0] /= sqrt(2);
        mov[1] /= sqrt(2);
      }
      x += mov[0];
      y += mov[1];
    }
     imageMode(CENTER);
    
      image(look.get( int(curCostume) * 32 ,dir*32 -1,32,32),width/2,height/2,32,32);
  }
  void keyPres() {
    if (keyCode == UP) {
      keys[0] = true;
    }
    if (keyCode == DOWN) {
      keys[1] = true;
    }
    if (keyCode == LEFT) {
      keys[2] = true;
    }
    if (keyCode == RIGHT) {
      keys[3] = true;
    }
  }
    void keyRel() {
    if (keyCode == UP) {
      keys[0] = false;
    }
    if (keyCode == DOWN) {
      keys[1] = false;
    }
    if (keyCode == LEFT) {
      keys[2] = false;
    }
    if (keyCode == RIGHT) {
      keys[3] = false;
    }
  }
  int[] doKey() {
    int[] a = {0,0};
    if (keys[0]) {
      
      a[1] = -movSpeed;
    }
    if (keys[1]) {
      
      a[1] = movSpeed;
    }
    if (keys[2]) {
      a[0] = -movSpeed;
    }
    if (keys[3]) {
      
      a[0] = movSpeed;
    }
    return a;
  }
  
  
}