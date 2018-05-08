import processing.net.*;
//first ping for info
//then start running correctly

//create a message for have connected, shows after spinner
//String ip = "10.3.2.141";
String ip = "192.168.168.139";

class LAN {
  text Text;
  boolean spin = false;
  int x = 250;
  int y = 250; 
  Client c;
  Client orgin; 
  String mode = "getSocket";
  String val;
  spinner Spin = new spinner();
  LAN(Client socket) {
  c = socket;
  }
  
  //find some solution to the this problem
  void run(PApplet b) {
    println(mode);
    
    if (Text != null) {
      textRun();
    }
    if (spin) {
      spinRun();
    }
    if (mode == "disconnect") {
      if (c != null) { //this is for disconnecting
        c.write("!");
        }
      }
     if (mode == "getSocket") { //get placement
      getSocket(b);
     }
     else {
     String read = read();
    if (read.equals(">")) {
      mode = "init ping"; // > == go
    }
    if (read.equals( "!" ) ) {
      mode = "disconnect";
      
    }
    if (read.equals( "S") && !spin ) {
      spin = true;
      c.write("S");
      
      Spin.draw();
    }
    if (mode.equals("spinEnd")) {
       spinEnd(read);
    }
    if (!(mode.equals("wait"))) { //if not waiting
      if (mode == "init ping") {
        initPing(read);
      }
      else if (mode == "send" ){
          send();
      }
      else if (mode == "sending") {
         sending(read);
       }
     }
  }
  }
  void spinEnd(String read) {
    c.write(str(Spin.roll) + "|" ); //  | represents end of data
       //println(c.read());
       if (read.equals(" ") ) {
          Text = new text(str(Spin.roll));
          Text.gens = -Spin.roll * 25;
          Text.S = int(random(250));
          Text.H = 200;
          Text.B= 150;
          mode = "wait";
          spin = false;
          Spin.reset();
        }
  }
  String read() {
    String read = "";
    if (c.available() > 0) {
       
       read = c.readString();
       if (read.charAt(0) == ' ' && read.length() == 2) {
         read = read.substring(1,read.length());
       }
     }
     return read;
  }
  void getSocket(PApplet b) {
    c.write("c");
       if (c.available() > 0)  { //you are connected
       println("connecting");
         String val =c.readString();
         println(val);
         delay(1000);
         if (val.length() == 4) { //if 4 digit
           Text = new text("You succesfully connected! \n Good luck!");
           Text.maxSize = 25;
           Text.H = 150;
           Text.maxLife = 150;
           Text.speed = 0.1;
           c = new Client( b , ip,int(val)); //find how to refer to this
           mode = "init ping";
       }
       }
  }
  void textRun() {
    Text.show();
      if (Text.gens > Text.maxLife) {
        Text = null;
      }
  }
  void initPing(String read) {
    c.write(" "); //sends 0 until done
      if (read != "") {
        //have gotten a ping back
        
        
        mode = "wait";
        c.clear();
      }c.write(" "); //sends 0 until done
      if (read != "") {
        //have gotten a ping back
        
        
        mode = "wait";
        c.clear();
      }
  }
  void spinRun() {
    Spin.draw();
      
      
      if (Spin.done) {
        
        mode = "spinEnd";
        Spin.done = false;
        spin = false;
      }
  }
  void send() {
           mode = "sending";
           c.write(val);
           c.clear(); //clear that one letter
  }
  void sending(String read) {
    c.write("d");
      if (read != "" ) { //if ready once again
       
        if (read.equals( "s") ) { //if was sucessful
        
        
        mode = "wait";
        
        }
        else {
          mode = "send"; //resend
        }
         c.clear();
      }
  }
  void draw(String val) {
    //String[] val2 = split(val,",");
    //line(float(val2[0]),float(val2[1]),float(val2[2]),float(val2[3])); 
  }
  private class text {
    //displays the text, eg maybe after seeing 
    private String text;
    private float size = 10;
    private float maxSize = 80;
    int maxLife = 40;
    float speed = 0.5;
    int gens = 0;
    int H;
    int S;
    int B;
    public boolean done = false; 
    text( String text_ ) {
      text = text_;
      H = 70;
      S = 120;
      B = 50;
    }
    void show() {
      colorMode(HSB);
      
      textAlign(CENTER,CENTER);
      textSize(size);
      if (size < maxSize) {
        size+= speed;
      }
      else {
        gens ++;
      }
      fill(H,S,B);
      text(text,width/2,height/2);
      colorMode(RGB);
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
LAN b;
void setup() {
  size(400,400);
  b = new LAN(new Client(this, ip, 1230));
  frameRate(122);
  
}
void draw() {
  background(255);
  
  
  if (key == 'r') {
    b.mode = "disconnect";
    
  }
  
  b.run(this);
  
   
}