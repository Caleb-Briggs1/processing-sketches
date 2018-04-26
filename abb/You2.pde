class You1 extends YOU_temp{
  
  float Xpre ;
  float Ypre;
  float angdif = 180;
  float tarX = 288;
  float tarY = 288;
  float ang = radians(165);
  int P =1;
  color invis=0;
  float C;
  float dirX;
  float dirY;
  int count = 0;
  ArrayList<float[]> trail = new ArrayList();
  character YOU;
   character retChar() {
    return YOU;
  }
  You1 () {
    YOU = new character(0,50,10);
    
    ang = atan2(YOU.x-250,YOU.y-250);
    for (int i = 0; 25 > i; i++) {
      float[] a = {0,0};
      trail.add(a);
    }
  }
  void run(map MAP) {//Avalible functions, part allowed to change
  YOU.x = 50;
  YOU.y = 50;
   this.calc();
   fill(250,0,0);
   ellipse(YOU.x,YOU.y,5,5);
    ArrayList<float[]> info = MAP.infoSight(YOU).get(0);
    if (frameCount % 103 == 0) {
    this.calc2(MAP,ang,1 ); //mandatory, makes you moves, takes angle of movement, and speed as input
    this.calc2(MAP,ang,1 ); //mandatory, makes you moves, takes angle of movement, and speed as input
    this.calc2(MAP,ang,1 ); //mandatory, makes you moves, takes angle of movement, and speed as input
    }
    
    this.calc2(MAP,ang,1 ); //mandatory, makes you moves, takes angle of movement, and speed as input
    for (int i = 0; trail.size() > i; i++) {
      //if(i==0) {
      //  trail.get(i)[0] = YOU.x;
      //  trail.get(i)[1] = YOU.y;
      //}else{
      //trail.get(i)[0] = trail.get(i-1)[0];
      //trail.get(i)[1] = trail.get(i-1)[1];
      //}
    //  colorMode(HSB);
                  //invis= get(round(trail.get(i)[0]),round(trail.get(i)[1]));
               
              
                
                  //  fill(invis);
                  //  stroke(invis);
      //C = C + 5;
      //C %= 255;
//C= get(int(YOU.x), int(YOU.y));

//int r= red(C );
//int g= green(C);
//int b= blue(C);



      fill(0,255,0);
      ellipse(trail.get(i)[0],trail.get(i)[1],10,10);
      
    }
    float[] curpos = {YOU.x,YOU.y};
    trail.add(curpos);
    trail.remove(0);
    
     
    for (int i = 0;(info.size()) > i; i++) { //repeat for each item
   ////main loop
     
   
         // println(P,tarX, tarY, ang);
     //    println(YOU.x,Xpre,YOU.y,Ypre);
          stroke(0,255,0);
          //line(YOU.x,YOU.y,tarX,tarY);
          dirX = sin(ang) * 10;
          dirY = cos(ang) * 10;
          stroke(255,0,0);
        //  line(YOU.x,YOU.y,dirX + YOU.x,dirY + YOU.y);  COMMENT THIS BACK IN
     
     if(P==1) {
       if (dist(YOU.x,YOU.y,tarX,tarY) < dist(YOU.x,YOU.y,info.get(i)[0],info.get(i)[1])) {
       tarX = info.get(i)[0];
       tarY = info.get(i)[1];
       
       }
     if (frameCount % 125 == 0) {
       ang = atan2(YOU.x-tarX,YOU.y-tarY) + radians(180);
     }
       if(dist(YOU.x,YOU.y,288,288) >= 75) {
         P++;
        // angdif = ang + 180;
       }
     }
     if(P==2) {
       
       tarX = 288;
       tarY = 288;
        ang = atan2(YOU.x-tarX,YOU.y-tarY) + radians(180);
       if(dist(tarX,tarY,YOU.x,YOU.y) < 5) {
      P = 1;
    }
    
    if (YOU.hit(MAP,YOU.x + sin(ang),YOU.y + cos(ang))) {
      //if hitting against wall
      //boing.play();

      for ( int m = 0; 360 > m; m += 1) {
        float dir = radians(m);
        float mx = YOU.x + sin(dir);
        float my = YOU.y + cos(dir);
        if(YOU.hit(MAP,mx,my)) {
          ang = dir + radians(90);
        }
      }
    
    //}
    
    if ( count >= 5) {
       ang += 180;
       count = 0;
    }
    if (Xpre != YOU.x && Ypre != YOU.y) {
      
    }
    
    
     }
       
     
     
    if (YOU.hit(MAP,YOU.x + sin(ang),YOU.y + cos(ang))) {
      //if hitting against wall
      //boing.play();

      for ( int m = 0; 360 > m; m += 1) {
        float dir = radians(m);
        float mx = YOU.x + sin(dir);
        float my = YOU.y + cos(dir);
        if(YOU.hit(MAP,mx,my)) {


          ang = dir + radians(90);
        }
      }
    
    }
    }
     
    
//println(ang);
    // ang = atan2(goal[0]-YOU.x,goal[1]-YOU.y); //points towards function
    //if (YOU.hit(MAP,YOU.x,YOU.y)) {
    //  //if hitting against wall
    //  for ( int i = 0; 4 > i; i++) {
    //    float dir = radians(i * 90);
    //    float mx = YOU.x + sin(dir);
    //    float my = YOU.y + cos(dir);
    //    if(YOU.hit(MAP,mx,my)) {
    //      ang = dir + radians(90);
    //    }
    //  }
    
    //}
    if (YOU.evolveReady()) { //if ready to evolve
       MAP.evolve(YOU,0); //then evolve with choice of path 0
    }
   
    ////
    toAng(0,-1);
    ang = radians(5);
    
    if (YOU.x != Xpre && YOU.y != Ypre) {
    Xpre = YOU.x;
    Ypre = YOU.y;
    } else {
      count++;
    }
  }
    
  }

  
  void calc() {
    YOU.view();
    YOU.run();
  }
  void toAng(float x,float y ){
    //println(degrees(atan2(x,y)));
  }
  void calc2(map map,float ang,float speed) {
    YOU.move(map,ang,min(YOU.maxSpeed,speed) ); //max speed of maxSpeed
     map.eatan(YOU);

  }
 
}