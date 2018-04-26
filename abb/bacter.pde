class bacteria { //sped up 
  float energy = 5;
  float x ;
  float y;
  final int maxEnergy = 250;
  final float centDist = dist(0,0,576,576);
  PVector acel = new PVector(0,0);
  bacteria(float x_, float y_) {
    x= x_;
    y = y_;
  }
  void update() {
    x += acel.x;
    y += acel.y;
    acel = acel.mult(.95); 
    energy += (0.4-0.1) - (dist(x,y,width/2,height/2)/ centDist); 
    ellipse(x,y,energy/20,energy/20);
    energy = min(maxEnergy,energy);
   //all good except maybe preload energy to speed it up
  }
  
  boolean reproduce() {
    return (energy == maxEnergy);
  }
  
}