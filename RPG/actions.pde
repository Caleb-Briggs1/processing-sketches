//shades in id 2 are endlessly walking, but they are walking and looking to no avail.
class NPCss {
  //make it a list of NPCs, has id 
  ArrayList<NPCs> npc = new ArrayList();
  
  void init() {
    NPCs temp = new NPCs();
    temp.init("char1.txt",576/2,576/2);
    temp.init2();
    npc.add(temp);
    
   
    
    
  }
  void run(int id) {
    NPCs charTest = npc.get(id);
    charTest.show(You.x,You.y);
   
    
  }
  void run2(int id) {
    NPCs charTest = npc.get(id);
     charTest.showAfter(You.x,You.y);
  }
}
class NPCs {
  ArrayList<ArrayList<int[]>> npcChunk = new ArrayList();
  ArrayList<NPC> npcs = new ArrayList();
  int[] xy = new int[2];
  void init(String name, int x, int y) {
    npcChunk.add(read(name)) ;
    xy[0] = x;
    xy[1] = y;
    //...
    this.init2();
    
  }
  ArrayList<ArrayList<int[]>> createChar(int x, int y, String name) { //not used
     ArrayList<ArrayList<int[]>> res = new ArrayList();
     int[] locT = {x,y};
     ArrayList<int[]> loc = new ArrayList();
     loc.add(locT);
     res.add(loc);
     res.add(read(name));
     return res;
  }
  void init2() {
    for (int i = 0; npcChunk.size() > i; i++) {
      for (int j = 0; npcChunk.get(i).size() > j; j++) {
        int[] vals = npcChunk.get(i).get(j);
        int id = vals[4];
        int x = vals[0] + xy[0];
        int y = vals[1] + xy[1];
        
        if (id == 1) {
        npcs.add(new NPC( x,y,vals[2],loadImage("m_skelcave.png"),id));
        }
        if (id == 2) {
          npcs.add(new NPC(  x,y,vals[2],loadImage("demon.png"),id));
        }
        if (id == 3) {
          npcs.add(new NPC(  x,y,vals[2],new PImage(),id));
        }
        if (id == 4) {
          npcs.add(new NPC(  x,y,vals[2],loadImage("cerberus.png"),id));
        }
        if (id == 5) { //virgil
          npcs.add(new NPC(  x,y,vals[2],loadImage("dante.png"),id));
         
      }
       if (id == 6) { //leopaard
          npcs.add(new NPC(  x,y,vals[2],loadImage("leapord.png"),id));
         
      }
      if (id == 7) { //lion
          npcs.add(new NPC(  x,y,vals[2],loadImage("lion.png"),id));
         
      }
      if (id == 8) { //shewolf
          npcs.add(new NPC(  x,y,vals[2],loadImage("wolf.png"),id));
         
      }
        
      }
    }
  }
  void show(float xp, float yp) {
    for (int i = 0; npcs.size() > i; i++) {
      npcs.get(i).display(xp,yp);
    }
  }
  void showAfter( float xp, float yp) {
    for (int i = 0; npcs.size() > i; i++) {
      npcs.get(i).displayAfter(xp,yp);
    }
  }
  //now create an npc for each item in here, and init it
  
  
  
  
  //helper
  ArrayList<int[]> read(String textFile) {
      
      String[] res = split(loadStrings(textFile)[0],"}");
      
      ArrayList<int[]> result = new ArrayList();
      for (int i = 0; res.length > i; i++) {
        
        String[] temp = split(res[i],",");
        
        int[] a = new int[temp.length];
        for (int j = 0; temp.length > j; j++) {
          
          a[j] = int(temp[j]);
        }
        
        
        result.add(a);
 
      }
      
      return result;
      
  }
}
class NPC {
  //here will be thigns such as enemies, run through chunk and run any actions on the thign if
  //id != 0
  //should use chunk style to make it run faster
  //each part of chunk should be individual npc
  PImage look = new PImage();
  float x,y;
  int size;
  int id;
  id2 demon = new id2();
  choiInit text = new choiInit();
  cerb cerberus = new cerb();
  virgil Virgil = new virgil(text);
  animal Animal = new animal();
  NPCFunc funcs = new NPCFunc();
  NPC (float x_, float y_, int size_,PImage look_, int id_) {
    x = x_;
    y = y_;
    size = size_;
    look = look_;
    id = id_;
  }
  void displayAfter(float xP, float yP) {
    if (id == 1) {
      
      if (this.touching(xP,yP)) {
          funcs.run(1);
          //do action
        }
    }
    if (id == 5) {
      Virgil.update();
      if (touching(xP,yP) && !Virgil.speak ) {
        Virgil.onTouch();
      }
    }
    
    
  }
  void display(float xP, float yP) {
     
    if (id == 1) {
      image(look.get(192,160,32,32), x-xP, y-yP,size,size);
      
    }
    if (id == 2) {
      tint(0,0,0,100);
      demon.update();
      image(look.get(demon.xyCost[0],demon.xyCost[1],32,32), x-xP + demon.xyPlus[0], y-yP + demon.xyPlus[1],size,size);
      noTint();
      
      
    }
    if (id == 3) {
      fill(0,250,0);
      
    }
    if (id == 4) {
      cerberus.update();
     
      
      image(look.get( int(cerberus.costX) * 100,0,100,100), x-xP, y-yP,size,size);
    }
    if (id == 5) {
      if (follow) {
      Virgil.follow(x-xP+Virgil.xSpot,y-yP+Virgil.ySpot);
      }
    
     
      image(look.get(Virgil.costXY[0],Virgil.costXY[1],32,32),(x-xP) +Virgil.xSpot,(y-yP)+Virgil.ySpot,size,size);
    }
    if (id == 6) {
      
      image(look.get(int(Animal.costXY[0]) * 48, int(Animal.costXY[1]) * 48,48,48),x-xP+Animal.xy[0],y-yP+Animal.xy[1],size,size);
      //Animal.update(x-xP+Animal.xy[0],y-yP+Animal.xy[1]);
    }
    if (id == 7) {
      
      image(look.get(int(Animal.costXY[0]) * 48, int(Animal.costXY[1]) * 48,48,48),x-xP+Animal.xy[0],y-yP+Animal.xy[1],size,size);
      //Animal.update(x-xP+Animal.xy[0],y-yP+Animal.xy[1]);
    }
    if (id == 8) {
      
      image(look.get(int(Animal.costXY[0]) * 48, int(Animal.costXY[1]) * 48,48,48),x-xP+Animal.xy[0],y-yP+Animal.xy[1],size,size);
      //Animal.update(x-xP+Animal.xy[0],y-yP+Animal.xy[1]);
    }
    
  }
  boolean touching(float xP, float yP) {
    if ( abs((x - xP) - width/2) <= size/2 + 16 && abs( (y - yP) - height/2) <= size/2 + 16) {
      return true;
    }
    return false;
  }
  
}

class NPCFunc { //needs to be redone
  
  
  boolean init = true;
   
  text a = new text("abc",1);
  //redo sign so it is its own function
  void run(int id) {
    
    
    if (id == 0) {
      
    }
    if (id == 1) {
      if (init) {
        a.reset();
      }
      
      if (a.done() ) {
        //do something if poem done
        //shake = true;
      }
      else {
        a.displayPoem();
      }
      //make an if done
      
      
    }
    if (id == 2) { //etc
      
    }
    
   init = false; 
  }
  
  
}
class id2 {
  int dir = 0;
  int[] xyCost = {0,0};
  float gens = .3;
  int[] xyPlus = {0,0};
  float rampDir = 1;
  boolean walk = false;
  void update() {
    if ( gens >= 2.6 || gens  <= 0.2) {
      rampDir *= -1;
    }
    if (walk) {
    gens+=0.1 * rampDir;
    }
    if ( gens %1 == 0) {
      dir = int(random(4));
    }
    if ((int)random(15) == 1) {
      walk = !walk;
    }
    dir %= 4;
    xyCost[0] = int((gens)%3) * 32;
    xyCost[1] = (dir) * 32;
    if (walk) {
      if (dir == 0) {
        xyPlus[1] += 1;
      }
      if (dir == 3) {
        xyPlus[1] -= 1;
      }
      if (dir == 1) {
        xyPlus[0] -= 1;
      }
      if (dir == 2) {
        xyPlus[0] += 1;
      }
    
    }
  }
}
class cerb {
  float x; 
  float y;
  float costX = 1;
  int dir = 1;
  void update() {
    //actions for cerb
    
    if ( costX > 2.5 || costX < 0.5) {
      dir *= -1;
    }
    costX += 0.3 * dir;
    
  }
}
class virgil {
  float xSpot=0; 
  float ySpot=0;
  int[] costXY = {0,0};
  int dialague = 0;
  boolean speak = false;
  int dir = 0;

  float curCostume = 1;
  int curCostume2 = 0;
  float a = 0.2;
  String[] text;
  text dia;
  virgil(choiInit text_) {
    int id = 0;
    text = text_.words.get(id);
   
  }
  void update() {
     
    
    costXY[0] = round(curCostume )*32;
    costXY[1] = curCostume2*32;
    if (speak) {
    dia.displayPoem();
    dia.showFace("danteFace.png");
      if (dia.done() && mousePressed ) {
      speak = false;
      if (dialague ==  1) {
        SCENE.id = 4;
        SCENE.choice = new choiceBox(1,new choiInitS());
        dialague = -1;
      }
      else {
      dialague ++;
      }
      
    }
    }
    
  }
  void follow(float x_, float y_) {
    curCostume += a;
    
    if (curCostume > 2 || curCostume < 0) {
      a *= -1;
    }
    int A = 0;
     for (int i = 0; You.keys.length > i; i++) {
       if (You.keys[i]) {
         A++;
       }
     }
     float speed = You.movSpeed;
     if(A==2) {
     speed /=sqrt(A);
     }
     
       //if 2keys pressed then slow down by a little
       if (You.dir == 1 || You.dir == 2) {
          if (y_ > height/2+2 ) {
          ySpot -= speed;
          
          }
          if (y_ < height/2-2 ) {
          ySpot += speed;
          
          }
        }
        if (You.dir == 0 || You.dir == 3) {
          if ( x_ < width/2 - 2) {
        xSpot += speed;
        
        }
        else if (x_ > width/2+2) {
        xSpot -= speed;
      
        }
        }
        if ( x_ < width/2 - 32) {
        xSpot += speed;
        curCostume2 = 2;
        }
        else if (x_ > width/2+32) {
        xSpot -= speed;
        curCostume2 = 1;
        }
        
        else {
          if (y_ > height/2+32 ) {
          ySpot -= speed;
          curCostume2 = 3;
          }
          if (y_ < height/2-32 ) {
          ySpot += speed;
          curCostume2 = 0;
          }
        }
    
  }
  void onTouch() {
    if (dialague != -1) {
    speak = true;
    dia = new text(text[dialague],1); 
    }
    
    
    
    
  }
}
class animal {
  float x; 
  float y;
  int[] costXY = {0,0};
  float curCostume = 1;
  int[] xy = {0,0};
  float a= 0.2;
  boolean close = false;
  animal() {
    
   
  }
  void update(float x, float y) {
    int[] movement = move(x,y);
    xy[0] += movement[0];
    xy[1] += movement[1];
    if (movement[0] > 0.5) {
      costXY[1] = 2;
    }
    if (movement[0] < -0.5) {
      costXY[1] = 1;
    }
    if (movement[1] > 0.5) {
      costXY[1] = 0;
    }
    if (movement[1] < -0.5) {
      costXY[1] = 3;
    }
    if (movement[0] != 0 || movement[1] != 0) {
    curCostume += a;
    if (curCostume > 2.5 || curCostume < 0.5) {
      a *= -1;
    }
    }
    costXY[0] = int(curCostume);
    
  }
  int[] move(float x, float y) {
    int[] mov = {0,0}; 
    if ( this.close(x,y) ){
    if (x > width/2) {
      mov[0] = -1;
    }
    else if (x < width/2) {
      mov[0] = 1;
    }
    else if(y > height/2){
      mov[1] = -1;
    }
    else if (y < height/2){
      mov[1] = 1;
    }
    }
    return mov;
  }
  boolean close(float x, float y){
    if ( dist(x,y,width/2,height/2) > 50 ){
      close = true;
    return true;
    }
    close = false;
    return false;
  }
  
}