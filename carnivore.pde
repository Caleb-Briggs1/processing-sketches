class carnivore {
  float x;
  float y;
  float energy = 10;
  float maxEnergy = 100;
  float size = random(1,10);
  float val = random(1);
  float reproSize = random(1,50);
  float repro = random(reproSize+20,maxEnergy);
  int wait = 5;
  //act like jelly fish, high friciton bbut move if move length is very small
  
  PVector move = new PVector(0,0);
  
  carnivore (float x_,float y_) {
     x= x_;
     y = y_;
     
  }
  carnivore (float x_,float y_,float size_, float val_,float reproSize_,float repro_) {
     x= x_;
     y = y_;
     energy = reproSize;
     size = size_ + random(-.1,.1);
     val = val + random(-.1,.1);
     reproSize = reproSize_ + random(-.1,.1);
     repro = repro_ + random(-.1,.1);
     
  }
  void update(map MAP) {
    if (wait > 0) {
    wait--;
    
    }
    MAP.eatan2(this);
    if (energy > maxEnergy) {
      energy = maxEnergy;
    }
    fill(energy*5,0,0);
    ellipse(x,y,size,size);
    
    float min=999;
    int index =0;
    for (int i = 0; MAP.food.size() > i; i++) {
      bacteria cur = MAP.food.get(i);
      if (dist(cur.x,cur.y,x,y) < min) {
        min = dist(cur.x,cur.y,x,y);
        index = i;
      }
    }
    x += move.x;
    y += move.y;
    move.mult(1- (size/40.0) );
    energy -= size/100.0;
     float dir = 0;
    if (MAP.food.size() > 0) {
    dir = atan2(MAP.food.get(index).x-x,MAP.food.get(index).y-y);
    }
    if ( sqrt(move.x * move.x + move.y *move.y) < val)  {
      //then allowed to move
      
      PVector curMove = (new PVector(sin(dir),cos(dir))).mult(3);
      energy -= size;
      move.add(curMove);
      
    }
    
  }
}