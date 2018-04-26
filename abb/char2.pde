class character {
  boolean hasEaten = false;
  boolean dead = false;
  float eatSpeed = 5;
  float x;
  float y;
  float size;
  float energy = 285;
  float seeAblity = 1;
  float moveEffec = 4; 
  float waitEffec = .1;
  float maxEnergy = 300;
  float sightX = 155;
  float sightY = 155;
  int evolve = 0;
  float maxSpeed = 1;
  int colo = 0; 
  final float maxDist = dist(0,0,width/2,height);
  character (float x_, float y_, float size_) {
    x = x_;
    y = y_;
    size = size_;
  }
  void view() {
    sightX = (int(120 - (dist(x,y,width/2,height/2)/maxDist)  * 150) ) * seeAblity;
    
    sightY = sightX;
  }
  boolean evolveReady() {
    return (energy+10 >= maxEnergy);
    
  }
  void show() {
     ellipse(x,y,size,size);
  }
  void show2(float ang) {
    noFill();
    stroke(0);
    rect(x,y,sightX,sightY);
    line(x,y,x + cos(ang) * 15, y + sin(ang) * 15);
  }
  void run() {
     rectMode(CENTER);
     noStroke();
    //noFill();
    //stroke(0);
    //rect(x,y,sightX,sightY);
     //fill(this.colo * 2,energy*2.5,0);
     //ellipse(CENTER);
   //this.show();
    energy -= waitEffec;
 energy = min(energy,maxEnergy);
   
    
    
    
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
    float[] npos = {x + sin(ang) * speed_,y + cos(ang) * speed_};
     if (! hit(Map,npos[0], npos[1]) && speed_ <= maxSpeed) {
     x = npos[0];
     y = npos[1];
     energy -= sqrt(speed_)/moveEffec;
     }
  }
  
}