class You {
  float ang=45; 
  character YOU;
  You () {
    YOU = new character(width/2,height/2,10);
  }
  void run(map MAP) {//Avalible functions, part allowed to change
   this.calc();//mandatory part, runs all functions
    ArrayList<float[]> info = MAP.infoSight(YOU);
    for (int i = 0;(info.size()) > i; i++) { //repeat for each item
    //***This is your part
      if (MAP.infoSight(YOU).get(i)[2] > 20) {
        float[] val = MAP.infoSight(YOU).get(i);  //information of the current object
        
        ang = atan2(val[0]-YOU.x,val[1]-YOU.y); //points towards function
        line(YOU.x,YOU.y,val[0],val[1]); //line from here to goal spot, not needed, just for animation
        
      }
      //***
    }
    if (YOU.hit(MAP,YOU.x,YOU.y)) {//test if you are hitting something
      ang += 180;
    }
    if (YOU.evolveReady()) { //if ready to evolve
       MAP.evolve(YOU,0); //then evolve with choice of path 0
    }
    this.calc2(MAP,ang,1); //mandatory, makes you moves, takes angle of movement, and speed as input
    
  }
  void calc() {
    YOU.view();
    YOU.run();
  }
  void calc2(map map,float ang,float speed) {
    YOU.move(map,ang,min(YOU.maxSpeed,speed) ); //max speed of maxSpeed
     map.eatan(YOU);
  }
 
}
