class You {
  float ang=45; 
  character YOU;
  You () {
    YOU = new character(width/2,height/2,10);
  }
  void run(map MAP) {//Avalible functions, part allowed to change
   this.calc();
    ArrayList<float[]> info = MAP.infoSight(YOU).get(0);
    
   

    for (int i = 0;(info.size()) > i; i++) { //repeat for each item
   ////main loop
      
      }
     
    

    // ang = atan2(goal[0]-YOU.x,goal[1]-YOU.y); //points towards function
    if (YOU.hit(MAP,YOU.x,YOU.y)) {
      //if hitting against wall
    }
    if (YOU.evolveReady()) { //if ready to evolve
       MAP.evolve(YOU,0); //then evolve with choice of path 0
    }
   
    ////
    this.calc2(MAP,ang,.5 ); //mandatory, makes you moves, takes angle of movement, and speed as input
    
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
