class bacteria { //class for bacteria
  float energy = 5;
  float x ;
  float y;
  int maxEnergy = 100;
  
  PVector acel = new PVector(0,0);
  bacteria(float x_, float y_) {
    x= x_;
    y = y_;
  }
  void update() {
    
    x += acel.x;
    y += acel.y;
    acel = acel.mult(.95); //slow down, friction amount
    energy += .4 - dist(x,y,width/2,height/2)/ (dist(0,0,width/2,height)); //grows in proportion to the light it has
    energy -= 0.1;//loses some energy by default 
    
  
    ellipse(x,y,energy/20,energy/20);
    if (energy > maxEnergy) {
      energy = maxEnergy;
     
    }
  }
  
  boolean reproduce() {
    if (energy == maxEnergy) {
      return true;
    }
    return false;
  }
  
}