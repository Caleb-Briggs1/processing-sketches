class mapEdit {
  final ArrayList<float[]> items = this.inMap();
  final int gridSize = 15;
  int type = 0;
  PImage jumpTile;
  PImage brick;
  PImage crys;
  PImage check;
  PImage platForm;
  PImage lava;
  PImage ques;
  PImage ques2;
  mapEdit() {
    jumpTile = loadImage("jumpTile.png");
    brick = loadImage("brick.png");
    crys = loadImage("crystal.png");
    check = loadImage("check.png");
    platForm = loadImage("platForm.png");
    lava = loadImage("lava.png");
    ques = loadImage("question.png");
    ques2 = loadImage("question2.png");
  }
  ArrayList<float[]> inMap() {
    String[] loadString = loadStrings("map.txt");
    ArrayList<float[]> item = new ArrayList();

    for (int i = 0;loadString.length > i; i++) {
      String[] val = split(loadString[i],",");
      float[] val2 = {float(val[0]),float(val[1]),float(val[2]),float(val[3]),float(val[4])};
      item.add(val2);
    }
    return item;
  }
  void run(float camX, float camY) {
    fill(type * 140,type* 50 + 50,type * 25);
    stroke(250);
    rect(mouseX/gridSize * gridSize + camX%15 ,mouseY/gridSize * gridSize + camY%15,gridSize,gridSize);
     for (int i = 0; items.size() > i; i++) {
       float[] val = items.get(i);
       if (val[4] == -1 && key == 'q') { //q to run
         d.hoopers.add(new we_be_hoopin(val[0],val[1]));
         items.remove(i);
       }
       if (val[4] == -2 && key == 'q') { //q to run
         d.eaters.add(new back_in_NAM(val[0],val[1]));
         d.eaters.get(d.eaters.size()-1).reset = (int)random(200,500);
         items.remove(i);
       }
       
       colorMode(HSB);
       if (val[4] == 0) {
         imageMode(CENTER);
         image(platForm,val[0] + camX + width/2,val[1] + camY + height/2,val[2],val[3]);
         
       }
       else if (val[4] == 1){
         imageMode(CENTER);
         image(brick,val[0] + camX + width/2,val[1] + camY + height/2,val[2],val[3]);
       }
       else if (val[4] == 2) {
          imageMode(CENTER);
          
          if (val[3] == 15.1) {
            
         image(ques2,val[0] + camX + width/2,val[1] + camY + height/2,val[2],val[3]);
          }
          else {
            image(ques,val[0] + camX + width/2,val[1] + camY + height/2,val[2],val[3]);
          }
       }
       else if (val[4] == 3) {
         imageMode(CENTER);
         image(jumpTile,val[0] + camX + width/2,val[1] + camY + height/2,val[2],val[3]);
       }
       else if (val[4] == 4){
         tint(250,250,150 + abs(sin(radians(frameCount))) * 100);
         imageMode(CENTER);
         
         image(lava,val[0] + camX + width/2,val[1] + camY + height/2,val[2],val[3]);
         noTint();
        
         
       }
       else if (val[4] == 5) {
         imageMode(CENTER);
     
         image(check,val[0] + camX + width/2,val[1] + camY + height/2,val[2],val[3]);
         
         image(crys,val[0] + camX + width/2,val[1] + camY + height/2 - (sin(radians(frameCount))*15) - 30,val[2],val[3]);
       }
         else {
           stroke(249);
           fill(val[4] * 5,0,0);
       rect(val[0] + camX + width/2,val[1] + camY + height/2,val[2],val[3]);
         }
     }
     if (key == 'e') {
         for (int i = 0; items.size() > i; i++) {
           float[] al = items.get(i);
           
           if ( abs(( (mouseX/gridSize * gridSize + camX%15) - (al[0]+ camX + width/2 ))) < 5 && abs(( (mouseY/gridSize * gridSize + camY%15) - (al[1]+ camY + height/2 ))) < 5) {
             items.remove(i);
            
           }
           
         }
       }
  }
  void key() {
    try {
      if(key == 'k') {
        type = -1;
      }
      if (key == 'l') {
        type = -2;
      }
      
      else {
     type = (Integer.parseInt(str(key) ));
      }
      
    
    
    }
    catch (NumberFormatException e) {
      
    }
  }
  
  void createObject() {
    //float[] item = {mouseX/gridSize * gridSize   , mouseY/gridSize * gridSize   ,gridSize,gridSize,type};
    //float[] item = { (-int(d.camX)/gridSize * gridSize) + (int(mouseX)/gridSize * gridSize) - width/2,(-int(d.camY)/gridSize * gridSize) + (int(mouseY)/gridSize * gridSize) - height/2   ,gridSize,gridSize,type};
    //items.add(item);
  }
  
}