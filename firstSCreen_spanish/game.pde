import processing.net.*;
//connect part
class roll { //tests the movement
  //****
  //just have em read from the new server that was made
  //***
  //just rewrite this,ge tthe old code fform github probbably
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
  
  lan LAN;
  //*********
  //eg for 1231 make a talking port at 11231, it will lay stagnant until it gives clue to recconect
  //******

  roll (PApplet THIS) {
    this.parse();
    spin= new spinner();
    x = draws.get(pos)[0];
    y = draws.get(pos)[1];
    LAN = new lan(THIS);
    
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
    LAN.run(THIS);
  } 
  void sendSpinner() {
    start = true;
  }
  
  void draw(PApplet THIS) {
    
    //lan
    
    displayMap();
    displayChar();
    this.run(THIS);
    this.handleRoll();
    String val = (LAN.getOutPut(0));
    if (! (val.equals("f")) && rollCur == 0 ) {
      println(val);
      this.roll(Integer.parseInt(val));
      key = 'q';
    }
    
  }
  void handleRoll() {
    if (mode == "roll") {
      
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
import processing.net.*;
String ip = "10.3.2.141";
 

class lan {
  String mode = "getConnection";
  Server turn;
  Server[] servers = new Server[1];
  Server currentPortServer; 

  int id = 0;
  
  //another sevver ot print the current turn 
  


  Server entry; //this is where they all start before being repositioned
  lan(PApplet THIS) {
    turn = new Server(THIS,1999);
    servers[0] = new Server(THIS,2001);
    currentPortServer = new Server(THIS,2000);
  }
  void writeTurn(int id) {
    turn.write(id);
  }
  String getOutPut(int id) {
    Client c= servers[id].available();
    if (c  != null) {
      String val = c.readString();
      return val;
    }
    else {
     return "f";
    }
      
    
  }
  
  void run(PApplet THIS) {
    handleConnections(THIS);
    //getOutPut(0);
    //if last item .read != null
    
  }
  
  
  
  
  /*
                            -----------************************-----------
  */
  void start() {
    for (int i = 0; servers.length > i; i++) {
      getOutPut(i); //just refreshes all of them
    }
  }
  void handleConnections(PApplet THIS) {
    //write current id
    currentPortServer.write(str(2001 + id) );
    // ----  ----  ----  ----  ----
    
    if (mode.equals("getConnection")) {
      for (int i = 0; servers.length > i; i++) {
      servers[i].write(str(i)) ;
      }
     
    }
    Client c = servers[servers.length-1].available();
    if (c  != null && c.read() != -1) {
      id++;
      servers =(Server[]) append(servers, new Server(THIS,2001+id));
    }
  }
   /*
                            -----------************************-----------
  */
}