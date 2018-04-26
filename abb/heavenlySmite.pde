class divineJustice {
  YOU_temp[] yous;
  character[] pos = new character[3]; 
  float[][] posPrev = new float[3][2];
  divineJustice() {
    YOU_temp[] yous2 = {ME,team1,team2};
    yous = yous2;
    for (int i = 0; yous.length > i; i++) {
      pos[i] = yous[i].retChar();
    }
  }
  
  void heavenlyAim() { //takes pos before
    for (int i = 0; pos.length > i; i++) {//stores previous position
      float[] val = {pos[i].x,pos[i].y};
      posPrev[i] = val; 
    }
    
  }
  boolean heavenlySmite(int i) {
    //after moves
    
      
      float[] posprev = posPrev[i];
      float[] cur = {pos[i].x,pos[i].y};
      if (dist(posprev[0],posprev[1],cur[0],cur[1]) > pos[i].maxSpeed*2) { //moved more than legal
        
        return true;
      }
      if(pos[i].hit(b,cur[0],cur[1])) {
        return true;
      }
      return false;
    
  }
}