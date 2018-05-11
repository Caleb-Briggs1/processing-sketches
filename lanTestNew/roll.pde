class roll { //tests the movement
 
  
  ArrayList<float[]> draws = new ArrayList();
  private String mode = "rolling";
  private int pos = 0;
  private int rollCur = 0;
  private float distanceTo;
  private float x, y;
  boolean drawMap = true;
  boolean advanceTurnAfterRoll = false;
  int[] tiles; 
  final private float stagnations = 45; //for traveling to next start
  private float nx;
  private float ny;
  int TURN_CUR = 0;
  private int counter = 0;
  int CUR_QUES  = 0;
  Server[] serverList = new Server[0];
  spinner spin ;
  boolean correct = false;
  question ques = new question(); //need to get ffile
  int[] poses = {0,0}; //HARD CODED ******!*!*!*!**!*!**!*!*!**!*!*!**!*
  boolean start = false;
  String[] images_ = {"fiest.png","demon.png","nothing.png","move1.png","move2.png","loseTurn.png","Trick_Translate.png"};
  String[] chars_ = {"hat.png","maraca.png","pinata.png","taco.png"};
  PImage[] chars;
  PImage[] images;
  int gensTile = 0;
  int tile = 0;
  lan LAN;
  //*********
  //eg for 1231 make a talking port at 11231, it will lay stagnant until it gives clue to recconect
  //******

  roll (PApplet THIS) {
    this.parse();
    images = new PImage[images_.length];
    for (int i = 0; images.length > i; i++) {
      images[i] = loadImage(images_[i]);
    }
    spin= new spinner();
    tiles = new int[draws.size()];
    for (int i = 0; tiles.length > i; i++) {
      tiles[i] = int(random(images.length));
    }
    chars = new PImage[chars_.length];
    for (int i = 0; chars_.length > i; i++) {
      chars[i] = loadImage(chars_[i]);
    }
    x = draws.get(pos)[0];
    y = draws.get(pos)[1];
    LAN = new lan(THIS);
    
  }
  
  private void parse() {
    draws = new ArrayList();
    String[] info = loadStrings("mapTest.txt");
    
    if (info != null) {
    for (int i =0; info.length > i; i++) {
      String[] info2 = split(info[i],' ');
      float[] val = new float[3];
      for (int j = 0; info2.length > j; j++) {
         val[j] = float(info2[j]);
      }
      draws.add(val);
    }
  }
  }
  void displayMap() {
    imageMode(CORNER);

     for (int i = 0; draws.size() > i; i++) {
       
        
      
       
     
      //image(images[tiles[i]],draws.get(i)[0],draws.get(i)[1],draws.get(i)[2],draws.get(i)[2]);
       stroke(tiles[i]* 55,tiles[i] * 15,0);
      hexagon(draws.get(i)[0],draws.get(i)[1],draws.get(i)[2]); //maybe pre-process this
  
}
 
    
  }
  void displayChar() {
    for (int i = 0; poses.length > i; i++) {
        x = draws.get(poses[i])[0];
        y = draws.get(poses[i])[1];
        imageMode(CENTER);
        image(chars[i],x,y,45,45);
        /*
        fill(i*250);
      ellipseMode(CENTER);
      ellipse(x-7.5,y+3,15,15);
      */
    }
  }
  void run(PApplet THIS) {
    //first get input from the user
    LAN.run(THIS);
  } 
  void sendSpinner() {
    start = true;
  }
  
  void draw(PApplet THIS) {
    
    //lan
   
    if (drawMap) {
    displayMap();
    displayChar();
    }
    if(!(mode.equals("tileShow"))) {
    this.runTurn(TURN_CUR);
    }
    else {
      this.runTurn(-1);
    }
    this.run(THIS);
    this.handleRoll();
     if (mode.equals("afterTile")) {
      println("afterTile");
      if (tile == 0) {
        textSize(40);
        colorMode(HSB);
        fill(gensTile*1.1,250,50);
        text("Landed on \n Move forward 1!",width/2,height/2);
        colorMode(RGB);
      }
      if (tile == 1) {
        textSize(40);
        colorMode(HSB);
        fill(gensTile*1.1,250,50);
        text("Landed on \n Move forward 2!",width/2,height/2);
        colorMode(RGB);
      }
      if (tile == -2) {
        textSize(40);
        colorMode(HSB);
        fill(gensTile*1.1,250,50);
        text("Answered wrong, \n Moved back 4 spaces!",width/2,height/2);
        colorMode(RGB);
      }
      gensTile++;
      if (gensTile > 200) {
      nextTurn();
      }
      
    }
    
    if (key == ' ') {
      TURN_CUR = 0;
      mode = "rolling";
    }
    
    //working with 2 at the moment, just need to get spin stuff down
    String val = (LAN.getOutPut(TURN_CUR));
    
    if (isInt(str(val.charAt(0))  ) && mode == "rolling") { //maybe add an AND isTime to check for numer
     
      
      
      this.roll(Integer.parseInt(str(val.charAt(0)) ));
      
      
     
      
    }
    else {
      //nothing is needed here DELETE THIS
    }
    if (mode == "Tile") { //that means it is time to ask a question

      mode = "displayQ";
      
     // LAN.currentPortServer.write( "Q"  + curQuestion + "|");
     
      //need to change this
      //i thnk this is right
      
    }
    if (mode == "displayQ") {
     
      LAN.servers[TURN_CUR].write( "Q" + str(CUR_QUES) + "|");
      ques.display(CUR_QUES);
      drawMap = false;
      
        String read = val.trim();
       
       if (read.equals("C")) {
         text(read,width/2,height/2);
         correct = true;
          mode = "afterChoi";
          
       }
       else if (read.equals("W")) {
         text(read,width/2,height/2);
         correct= false;
         mode = "afterChoi";
         
       }
       else {
         //println("c not connected");
       }
       
      
      
      
      //display the question here
      
      
    }
    
      if (mode == "afterChoi") {
        //run the tile action here
        println("afterChoi");
        LAN.servers[TURN_CUR].write("D"); //done
         if (correct) {
           text("correct", width/2,height/2);
          
         }
         else {
         tile = -2;
         poses[TURN_CUR] -= 4;
         if (poses[TURN_CUR] < 0) {
           poses[TURN_CUR] = 0;
         }
      } 
        tileAction();
        //nextTurn();
       
     
        
      }
    
    
  }
  void tileAction() {
    int type = tiles[poses[TURN_CUR]];
    if (tile != -2) {
    tile = tiles[poses[TURN_CUR]];
    }
    if (type == 0) {
      println("move 1");
      ques = new question();
      this.roll(1);
      advanceTurnAfterRoll = true;    
      mode = "afterTile";
      //nextTurn(); //CHANGE THIS IF YOU WANT TO AMKE THE TILES ASK MANY QUESTIONS !!!!!!!!!!
      
    }
    if (type == 1 || type > 1) {
      println("move 2");
      this.roll(2);
      ques = new question();
              //poses[TURN_CUR] += 2;
        mode = "afterTile";      
        advanceTurnAfterRoll = true;      
      //nextTurn();
      
    }
    
  }
  void runTurn(int id) {
    LAN.turn.write( str(id) );
  }
  void nextTurn () {
    gensTile = 0;
    tile = 0;
    if (!drawMap) {
    TURN_CUR++;
    if (TURN_CUR == LAN.id) { //5 here just represnts the max turn 
      TURN_CUR  = 0;
    }
    advanceTurnAfterRoll = false;
    drawMap = true;
    CUR_QUES++;
    correct = false;
    start = false;
    spin= new spinner();
    x = draws.get(poses[TURN_CUR])[0];
    y = draws.get(poses[TURN_CUR])[1];
    ques = new question();
    mode = "rolling";
    }
  }
  boolean isInt(String val) {
    try {
      int temp = Integer.parseInt(val);
      return  true;
    }
    catch (NumberFormatException e) {
      return  false;
    }
  }
  
  void handleRoll() {
    if (mode == "roll") {
      
      if (rollCur > 0) {
      counter = 0;
      rollCur--;
      
      mode = "animate";
      poses[TURN_CUR] ++;
      pos ++;
      nx = draws.get(poses[TURN_CUR])[0]-x;
      ny = draws.get(poses[TURN_CUR])[1]-y;
      }
      else {
        //eg after done
        
        mode = "Tile";
        
      }
      
    }
    if (mode == "animate") {
      if (counter < stagnations) {
      x += nx/stagnations;
      y += ny/stagnations;
      counter++;
      }
      else {
        mode = "roll";
      }
      
      
    }
  }
  void roll(int roll) {
    rollCur = roll;
    mode = "roll";
  }
  void hexagon(float x_, float y_, float size_) { //change this to vertex if needed
    float size = size_*.5;
    float x = x_ - size/2;
    float y = y_ - size/1.175;
    final float change = radians(60);
    for (int i = 0; 6 > i; i++) {
      float nx =x +  cos(change * i + radians(30)) * size;
      float ny = y + sin(change * i + radians(30)) * size;
      line(x,y, nx,ny);
      x = nx;
      y = ny;
    }
  }
  private class spinner {
  private final float len = 50;
  private float x= width-90;
  private float y = 90; //maybe not private
  private float turn = 0;
  private float speedTurn = 1;
  private boolean spin = false;
  private boolean getSpeed = true;
  private int roll = 0; 
  public boolean done = false;
  private int split =10; //this is equal to half the number of splits (if odd)
  void reset() {
    done = false;
    turn = 0;
    roll = 0;
    spin = false;
    getSpeed = true;
    
    
  }
  void split() {
   
    for (int i = 0; split > i; i++) {
      float deg = radians(i * (360.0/split) );
    
      line(x,y,x + cos(deg) *len,y + sin(deg)*len);
       //line(x,y,x + cos(deg + PI) *len,y + sin(deg+PI)*len);
    }
  }
  void draw() {
    noFill();
    ellipse(x,y,len*2,len*2); //maybbe make moue turn into a trail in the mode when making the turn
    split();
    fill(250,0,0);
   
   if (turn > TWO_PI) {
        turn -= TWO_PI;
      }
   
    if(mousePressed && spin && getSpeed) {
      turn = atan2(mouseY-y,mouseX-x);
      line(x,y,x + cos(turn)*len, y + sin(turn)*len);
    }
    if (mousePressed && !spin) {
      spin = true;
      getSpeed = true;
      turn = atan2(mouseY-y,mouseX-x);
      
    }
     if (!spin) {
      line(x,y,x + cos(turn)*len, y + sin(turn)*len);
    }
    
    if (!mousePressed && spin || !getSpeed) {
      if (getSpeed) {
        speedTurn = abs(pmouseY-mouseY)/30.0 + random(.01,.2);
        spin = true;
         getSpeed = false;
      }
     
      
     // spin = false;
      line(x,y,x + len*cos(turn), y + len*sin(turn));
      turn += speedTurn;
      speedTurn *= .99;
      if (abs(speedTurn)  < .0001) {
        done = true;
        spin = false; 
        roll = ((int(turn / radians(360/split))+split/2) % split + 1);
        
      }
      
    }
    
  }
  
}
}