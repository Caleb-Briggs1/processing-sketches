class You {
  float ang=45; 
  character YOU;
  You () {
    YOU = new character(width/2,height/2,10);
  }
  void run(map MAP) {//Avalible functions, part allowed to change
   this.calc();
    ArrayList<float[]> info = MAP.infoSight(YOU);
    for (int i = 0;(info.size()) > i; i++) { //repeat for each item
    //***This is your part
      if (MAP.infoSight(YOU).get(i)[2] > 20) {
        float[] val = MAP.infoSight(YOU).get(i);
        
        ang = atan2(val[0]-YOU.x,val[1]-YOU.y);
        line(YOU.x,YOU.y,val[0],val[1]);
        
      }
      //***
    }
    if (YOU.hit(MAP,YOU.x,YOU.y)) {
      ang += 180;
    }
    if (YOU.energy > YOU.maxEnergy-1) {
       MAP.evolve(YOU,0);
    }
    this.calc2(MAP,ang,1);
    
  }
  void calc() {
    YOU.view();
    YOU.run();
  }
  void calc2(map map,float ang,float speed) {
    YOU.move(map,ang,speed);
     map.eatan(YOU);
  }
}
