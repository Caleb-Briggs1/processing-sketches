class You {
  float ang=45; 
  character YOU;
  You () {
    YOU = new character(width/2,height/2,10);
  }
  void run(map MAP) {//Avalible functions, part allowed to change
   this.calc();
    ArrayList<float[]> info = MAP.infoSight(YOU).get(0);
    
    float min = 999;
    int index = 0;
    
    float[] value = new float[info.size()];
    for (int i = 0;(info.size()) > i; i++) { //repeat for each item
   ////
       float[] val = info.get(i);
       //x,y,energy
       //val x,y,energy
       //
       value[i] = dist(val[0],val[1],YOU.x,YOU.y)*val[2];
      
         line(YOU.x,YOU.y,val[0],val[1]);
      }
     
    
  //  atan2(goal[0]-YOU.x,goal[1]-YOU.y);
    // ang = atan2(goal[0]-YOU.x,goal[1]-YOU.y); //points towards function
    if (YOU.hit(MAP,YOU.x,YOU.y)) {
      
    }
    if (YOU.evolveReady()) { //if ready to evolve
       MAP.evolve(YOU,0); //then evolve with choice of path 0
    }
    println(min);
    ////
    this.calc2(MAP,ang,.5 ); //mandatory, makes you moves, takes angle of movement, and speed as input
    
  }
  void computeDist(map MAP,float x_, float y_,float goalX, float goalY, ArrayList<float[]> walls) {
    float x = x_;
    float y =y_;
    int gens = 0;
    
    while(x != goalX && y != goalY) {
      float goalAng = atan2(goalX-x, goalY-y);
      float nx = x + sin(goalAng);
      float ny = y + cos(goalAng);
      if (YOU.hit(MAP,nx,ny)) {
        float curDist = dist(x,y,goalX,goalY);
        float dir = 0;
        //its acually angle differnce, the one with the least angle differenc eis the best one
        for (int i = 0; 4 > i; i++) {
          dir = radians(i*90);
          nx = x + sin(dir);//dont test if closer, but if can move and if closer than the other option of movment
          ny = y + cos(dir);
          if ( dist(nx,ny,goalX,goalY) < curDist) {
            
          }
          
          
        }
      }
      else {
        x = nx;
        y = ny;
        
      }
      gens ++;
    }
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
