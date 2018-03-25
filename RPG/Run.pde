

chunk map = new chunk();
character You = new character(-32 * 7,32 * 4);
NPCss npc = new NPCss();
dark mask =  new dark();
 end END = new end();
 boolean follow = false;
Scene SCENE;
int scene = 1;
float view = 1.1;
boolean path = false;
float pathId = 0;
boolean canMove = false;
boolean shake = false;
boolean fade = false;
boolean sleep = false;
boolean cutScene = false;
boolean end = false;

choiInit2 choiceTest ;

text speech;
void init() {
   rectMode(CENTER);
  END.init();
  map.init();
  You.init();
  npc.init();
  
   SCENE = new Scene(new choiInit2());

  SCENE.initScene(1);
}
void run() {
 
  rectMode(CENTER);
  background(0);
  if (shake) {
  mask.shake();
  }
  
  
 
  
  ArrayList<ArrayList<int[]>> extras = new ArrayList();
  You.reset();
 for (int i = 0; map.info.size() > i; i++) {
  extras.add( map.drawChunk(i,You.x,You.y)); 
  You.update(map,i);
 }
 if (canMove) {
 You.run();
 }
 
  npc.run(0);
  //npc.run(1);
  
  for (int i = 0; extras.size() > i; i++) {
  map.drawChunk(extras.get(i));
  
  }
  
  
  if (fade) {
    if(mask.fade()) {
      fade = false;
    }
  }
  else {
    if (sleep ) {
       //mask.speed = 3;
    mask.sleepy();
  }
  else{
    
    mask.show();
    
  }
  
  
  
  
  
  
  }
  mask.view = view;

  
  npc.run2(0);
  //npc.run2(1);
  
  
  
  SCENE.run();
  
  if (end) {
    END.display(SCENE.endId);
  }
  if (path) {
    doPath();
        
  }
  println( abs(You.x-640));
  if (follow && abs(You.x+640) < 32) { //at about 640
    //TELEPORT TO A NEW PLACE
    map.teleport(0);
    
    println("BROA");
    
  }
  
}
void keyPressed() {
  You.keyPres();
}
void keyReleased() {
  You.keyRel();
}
void updateArray1() {
    NPCs temp = new NPCs();
    temp.init("char1U.txt",576/2,576/2);
    temp.init2();
    npc.npc.set(0,temp);
  }
  
  
  void doPath() {
    canMove = false;
     ArrayList<int[]> cur = map.info.get(2).get(1);
         for (int i = 0; cur.size() > i; i++) {
            cur.get(i)[8] = 0;
           if ( abs(cur.get(i)[0] - (576 - 32*pathId) ) <= 5 && cur.get(i)[1] == 96) {
             
             cur.get(i)[4] = 2;
             cur.get(i)[7] = 3;
             cur.get(i)[8] = 0;
             if (cur.get(i)[0] == 0) {
               cur.get(i)[4] = 12;
               cur.get(i)[7] = 0;
             }
             //cur.get(i)[4] =2
             //cur.get(i)[7]=3
           }
         }
         pathId += .1;
        You.x -= 3.2;
        if (pathId*32 > 576) {
          if ( You.x < -170) {
              You.x += 15;
          }
          else {
          follow = true;
           path = false;
           canMove = true;
          }
        }
       
        
  }