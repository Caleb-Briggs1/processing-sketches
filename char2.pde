class character {
  float eatSpeed = 3;
  float x;
  float y;
  float size;
  float energy = 85;
  float seeAblity = 1;
  float moveEffec = 4;
  float waitEffec = .1;
  float maxEnergy = 100;
  float sightX = 155;
  float sightY = 155;
  int evolve = 0;
  float maxSpeed = 1;
  int colo = 0; 
  character (float x_, float y_, float size_) {
    x = x_;
    y = y_;
    size = size_;
  }
  void view() {
    sightX = (int(120 - (dist(x,y,width/2,height/2)/(dist(0,0,width/2,height))  * 150) )) * seeAblity;
    
    sightY = sightX;
  }
  boolean evolveReady() {
    if (energy+10 >= maxEnergy) {
      return true;
    }
    return false;
  }
  void run() {
     rectMode(CENTER);
    noFill();
    stroke(0);
    rect(x,y,sightX,sightY);
     fill(this.colo * 2,energy*2.5,0);
     //ellipse(CENTER);
    ellipse(x,y,size,size);
    energy -= waitEffec;

    if (energy > maxEnergy) {
      energy = maxEnergy;
      
    }
    
    
  }
  boolean hit(map Map, float x, float y) {
    float[][] walls = Map.walls;
    for (int i = 0; walls.length > i; i++) {
        if ( abs(x-walls[i][0]) < walls[i][2]/2.0 && abs(y-walls[i][1]) <  walls[i][3]/2.0) {
          return true;
        }
    }
    return false;
  }
  void move(map Map ,float ang, float speed_) {
    
     if (! hit(Map,x + sin(ang) * speed_, y + cos(ang) * speed_) && speed_ <= maxSpeed) {
     x += sin(ang) * speed_;
     y += cos(ang) * speed_;
     energy -= sqrt(speed_)/moveEffec;
     }
  }
  
}