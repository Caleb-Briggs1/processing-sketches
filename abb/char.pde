class You extends YOU_temp { //run theh if hit first, and then cahnge ang otherwise
  float ang=0; 
  int move = 0;
 int[] evPath = {1,1,1,0,0,0};
 int ev = 0;
 //
  character YOU;
  character retChar() {
    return YOU;
  }
  You () {
    YOU = new character(width,0,10);
  }
  void run(map MAP) {//Avalible functions, part allowed to change
   this.calc();
   
   
   float speed = YOU.maxSpeed;
  
    ArrayList<ArrayList<float[]>> info = MAP.infoSight(YOU);
     
   
    if (move > 0) {
    move--;
    }
   
    else {
       if (info.get(0).size() == 0 ) {
       ang = atan2(width/2-YOU.x,height/2-YOU.y);
           if (dist(width/2,height/2,YOU.x,YOU.y)  < 5) {
            speed = 0;
        }
       
    }
    /*
    if (YOU.hit(MAP,YOU.x + sin(ang) * YOU.maxSpeed,YOU.y + cos(ang)*YOU.maxSpeed) || move > 0) {
      
     
      for (int i = 0; 4> i; i++) {
        float dir = radians(90 * i);
        if (YOU.hit(MAP,YOU.x + sin(dir),YOU.y + cos(dir)) && ! YOU.hit(MAP,YOU.x + sin(dir-PI/2.0)*YOU.maxSpeed,YOU.y + cos(dir-PI/2.0)*YOU.maxSpeed)) {
          ang = radians( (degrees(dir)-90) );
           move = 5;

          
        }
        
      }
      
       
    }
    */
    
    
    
    
   
    else{
    float min = 999;
    int index = -1;
    
    float[] value = new float[info.get(0).size()];
    for (int i = 0;(info.get(0).size()) > i; i++) { //repeat for each item
   ////
       float[] val = info.get(0).get(i);
       
       
       value[i] = computeDist(MAP,YOU.x,YOU.y,val[0],val[1],info.get(1))/val[2];
       //value = 500 if that bacteria is in a wall
       if ( YOU.hit(MAP,val[0],val[1])) {
         value[i] = 9999;
       }
        
      }
      min = 999;
      index = 0;
      
      for (int i = 0; value.length >i; i++) {
        if (value[i] < min && value[i] != 9999) {
          index = i;
          min = value[i];
        }
      }
      
      if (info.get(0).size() > 0 && index != -1) {
      float[] goal = {info.get(0).get(index)[0],info.get(0).get(index)[1]};
      
      if (dist(YOU.x,YOU.y,goal[0],goal[1]) < 5) {
        speed = 0;
      }
      
      
    
  //  atan2(goal[0]-YOU.x,goal[1]-YOU.y);
 
    ang = atan2(goal[0]-YOU.x,goal[1]-YOU.y); //points towards function
      }
      
     
    }
    }
    if (YOU.evolveReady()) { //if ready to evolve
    //println(evPath[ev]);
       MAP.evolve(YOU,evPath[ev]); //then evolve with choice of path 0
       
       ev ++;
       
       //println("EVOLVE");
    }
   
   
    ////
    
    stroke(0);
    
    line(YOU.x,YOU.y,YOU.x + sin(ang)*15, YOU.y + cos(ang)*15);
     if (YOU.hit(MAP,YOU.x + sin(ang) * YOU.maxSpeed,YOU.y + cos(ang)*YOU.maxSpeed) || move > 0) {
      
    //find shorter path
    PVector goalAng = new PVector(sin(ang),cos(ang));
    float val = 90;
      for (int i = 0; 4> i; i++) {
        float dir = radians(90 * i);
        if (YOU.hit(MAP,YOU.x + sin(dir),YOU.y + cos(dir)) && ! YOU.hit(MAP,YOU.x + sin(dir-PI/2.0),YOU.y + cos(dir-PI/2.0))) {
         
          PVector b = new PVector(sin(radians( (degrees(dir)-90) )),cos(radians( (degrees(dir)-90) )));
          if (PVector.angleBetween(goalAng,b) < val) {
            val = PVector.angleBetween(goalAng,b);
             ang = radians( (degrees(dir)-90) );
          }
          
         
           move = 5;

          
        }
        
      }
      
       
    }
    this.calc2(MAP,ang,speed); //mandatory, makes you moves, takes angle of movement, and speed as input
    
  }
  float computeDist(map MAP,float x_, float y_,float goalX, float goalY, ArrayList<float[]> walls) {
    float x = x_;
    float y =y_;
    int gens = 0;
    
    while(dist(x,y,goalX, goalY) > 10 && gens < 50) {
      float goalAng = atan2(goalX-x, goalY-y);
      float nx = x + sin(goalAng) * 3;
      float ny = y + cos(goalAng) * 3;
       
      if (YOU.hit(MAP,nx,ny)) {
        float curDist = dist(x,y,goalX,goalY);
        float dir = 0;
        float distanceFromCenter = 0; 
        //its acually angle differnce, the one with the least angle differenc eis the best one
        float angHit;
        float ang =0;
        for (int i = 0; 4 > i; i++) {
          dir = radians(i*90);
          
          float nx2 = x + sin(dir) * 3;//dont test if closer, but if can move and if closer than the other option of movment
          float ny2 = y + cos(dir) * 3;
          if (YOU.hit(MAP,nx2,ny2)) {
            angHit = dir;
            ang = dir + radians(-90);
          }
        }
        x = x + sin(ang) * 3;
         y = y + cos(ang) * 3;
      }
      else {
        stroke(0);
       // line(x,y,nx,ny);
        x = nx;
        y = ny;
        noStroke();
        fill(0,0,250,10);

        
      }
      gens ++;
    }
    return gens;
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