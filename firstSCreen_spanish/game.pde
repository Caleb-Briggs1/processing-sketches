class roll { //tests the movement
  ArrayList<float[]> draws = new ArrayList();
  private String mode = "input";
  private int pos = 0;
  private int rollCur = 0;
  private float distanceTo;
  private float x, y;
  final private float stagnations = 45; //for traveling to next start
  private float nx;
  private float ny;
  private int counter = 0;
  Server[] serverList = new Server[0];
  spinner spin ;
  boolean start = false;
  LAN SERVER;

  //*********
  //eg for 1231 make a talking port at 11231, it will lay stagnant until it gives clue to recconect
  //******

  roll (PApplet THIS) {
    this.parse();
    spin= new spinner();
    x = draws.get(pos)[0];
    y = draws.get(pos)[1];
    SERVER = new LAN(new Server[0], new Server( THIS,1230));
  }
  
  private void parse() {
    draws = new ArrayList();
    String[] info = loadStrings("mapTest2.txt");
    
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
     for (int i = 0; draws.size() > i; i++) {
      hexagon(draws.get(i)[0],draws.get(i)[1],draws.get(i)[2]); //maybe pre-process this
    }
  }
  void displayChar() {
    ellipseMode(CENTER);
    ellipse(x-7.5,y+3,15,15);
  }
  void run(PApplet THIS) {
    //first get input from the user
    SERVER.work(THIS);
  }
  void sendSpinner() {
    start = true;
  }
  
  void draw() {
    
    //lan
    
    displayMap();
    displayChar();
    if (mode == "input") {
      if (SERVER.connected && key == ' ') { //***experiemental code****
      SERVER.sendSpinner();
      key = 'q';
    }
    println(SERVER.doneSpin,SERVER.mode.equals("ping"));
    if (SERVER.mode.equals("ping") && SERVER.doneSpin && (SERVER.curOut!= null) ) {
      this.roll(Integer.parseInt(SERVER.curOut));
      println("rolling" + SERVER.curOut);
      spin.reset(); 
      SERVER.resetSpin();
      
    }

    }
    if (mode == "roll") {
      println(rollCur);
      if (rollCur > 0) {
      counter = 0;
      rollCur--;
      
      mode = "animate";
      pos ++;
      nx = draws.get(pos)[0]-x;
      ny = draws.get(pos)[1]-y;
      }
      else {
        mode = "input";
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
//hey, if your ever bored just program all those modes into functions, it will make it look much clearner
//that also apllies to the lan_spanish_C thing

import processing.net.*;
//send stop needs to be changed, isntea of fsending f or s, it ovverides that byb sending P
class LAN {
  //String mode = "getClient";
  boolean doneSpin = false;
  String mode = "assign";
  String readVal;
  boolean ready = true;
  //boolean isConnected = false;
  String send = " ";
  String curOut;
  boolean connected = false;
  //private final int players = 4;
  Server mover;
  Server s;
  Client c;
  int curId = 0;
  int curConnection = 0; //item in list currently connected to
  Server[] serverList = new Server[0];
  Client[] clientList = new Client[0]; //this should be equal to players
  LAN(Server[] s_, Server mover_ ) {
    serverList = s_; 
    mover = mover_;
    //s = mover_;
  } 
  void resetSpin() {
    doneSpin = false;
    curOut = null;
  }
  void sendStop(int id,PApplet thi) {
     
     s = new Server(thi , 1231); //testing this
    
    //wait until respsonse back, then send a disconnect
    //then connect t next thing, bby sending something through mover
  }
  void connectTo() {
    //this should be rmeovved
    /*
    c = mover.available();
    if (c != null) {
    c.write("1231");
    }
   
   */
    
  }

  void disconnect() {
    mode = "disconnect";
  }
  void sendSpinner() {
    mode = "spinner";
  }
  void createConnection(int id,PApplet b  ) {
    connected = false;
    //*****
    //here is where it creates the new server
    //***
    mover.write(str(1231+id) );
    if (ready) {
    serverList = append(serverList, new Server(b,11231 + id));
    s = new Server(b , 1231 + id); //this is the planned spot for server
    
    ready = false;
    }
    
     mode = "next";
  }
  
  void work(PApplet b) {
      
    
     if (mover.available() != null) { //i want this to mmean if something has been said
       
      
       char val = mover.available().readString().charAt(0);
     
       if(val == 'c') {
      
       createConnection(curId,b);
       
       }
       
       //mover.cl;
       //create space for new connection
     }
     //check for disconnect !! change code
     
       if (c != null && c.available() > 0) {
         
         if (c.readString().equals( "!") ) {
           s.disconnect(c);
           println("disconnect");
         }
       }
     
     if (mode == "next") { //attempt to connect !! MAKE SURE THIS STILL WORKS
       //connectTo();
       if (s.available() != null) {
         mode = "getClient";
         curId++;
         background(255);
         ready = true;
         
       }
     }
     
    if (mode == "getClient") {
     
       c = s.available(); //if connected
       
       if (c != null) {
          c.write(">"); //send data //eg tell it to start
         
          if (c.readString() != null) {
            mode = "ping";
          }
          }
       
      }
      
      if (mode == "ping") {
        connected = true;
        c.write(send); //show that you are ready //it can also send informaiton tha tis important
        String val = c.readString();
       
        if (val != null) { //if response back
          
          readVal = val;
          mode = "read";
          
        }
        
      }
      if (mode == "afterSpin") {
        
      
        afterSpin();
        
        
        
      }
      if (mode == "read") {
         read();
         println(curOut);
         
        }
        
        if (mode.equals("spinner") ) {
          spinner();
          
        }
        
      
      
    
    
     
  }
  void afterSpin() {
    c.write("R"); 
        //for recieved
        
        if (c != null) {
         
        String val = c.readString();
         if (val != null) {
        String readVal = "";  
        
        for (int i = 0; val.length() > i; i++) {
          readVal += val.charAt(i); 
          
          if (val.length() > i+1 && val.charAt(i+1) == '|') { //!!!!!potential bug here!!!!!!!
            i = val.length() + 1;
            println("hi");
          }
        }
        println(readVal,"read");
        if (!(readVal.charAt(0) == ('S'))) {
        //c.write("Z"); 
        println("read success");
       
        mode = "ping";
        doneSpin = true;
        
        curOut = readVal;
        }
        
         
          }
        
        }
  }
  void read() {
    String[] val = split(readVal,",");
            if (val.length != 0 && curOut == null) {
            curOut = val[0];
            }
            //line(float(val[0]),float(val[1]),float(val[2]),float(val[3 ]) );
            
        
          
          mode = "ping";
  }
  void ping() {
    
  }
  void spinner() {
    if (c!= null && connected) { //can remove this is already connected
          c.write("S");
          
          if (c.available() > 0) {
           String val = c.readString();
           
          if (val.length() > 1 && val.charAt(1) == '|') {
            mode = "afterSpin"; //he has gotten the message
            
            curOut = str(val.charAt(0));
            
          }
          
          }
          }
  }
  
}