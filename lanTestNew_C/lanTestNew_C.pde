import processing.net.*;
//BREAKING ON SECODN ROUND, FAILING TO REST PROPERLY
//BREAKS AFTER FIRST ROLL
//GETS STUCK ON TURN
//NOT RESSETING QUEstION
//NOT REseETINg oN THE LAN vERSION
//TEXT NEEDS TO DISPLAY IN WHITE
//taking forever to run, maybe try to fix that
//MIght e a problem here, it looks like it is swaping ot ur turn instead of continueing
//Extra your turn, so its not working right
//String ip = "10.3.2.141";

String ip = "192.168.168.150";
//it appears multiple can be on the same thing, so we could use that or keep them on seperate connections
//send seomthing to the server ur on to connect to it and create a new thing
//CONSOLE LIKE MESSAGE BOx, FOR stuff like coNNECTED SUCCESFULLY
//Have a feeling it is not reseting well

//Maybe each has a copy of the list of questions, so with the question it says 
//a number which is equal to the question, that removes the need for QM/QI
class client {
  Client beginC;
  Client c;
  Client turn;
  int urId;
  boolean reset= false;
  boolean look_reset = false; //remeber to set this to false every reset
  console CONSOLE = new console(160,110);
  boolean isConnect = false;
  spinner Spin = new spinner();
  boolean connected = false;
  boolean spin = false;
  boolean isTurn = false;
  boolean done = false;
  boolean printConnect = true;
  
  String mode = "connecting";
  question ques = new question();
  client(PApplet THIS) {
    beginC = new Client(THIS,ip,2000);
    turn = new Client(THIS,ip,1999);
    
  }
  void update(PApplet THIS) {
    String val = beginC.readString();
    if (! mode.equals("inQuestion")) {
    CONSOLE.run();
    }
    String stringRead = turn.readString();
    int turnRead = -1;
    if (stringRead != null && stringRead.length() < 10) {
      turnRead = Integer.parseInt(stringRead);
    }
   //println(turnRead);
    if (turnRead == urId-2001) {
      //then it is your turn
      isTurn = true;
    }
    else {
      if (turnRead != urId- 2001) {
        isTurn = false;
      }
    }
    
    if (spin ) {
      Spin.draw();
      
      if (done) {
        println(Spin.roll);
        spin = false;
      }
    }
    
    //
    if (val != null && val.length() == 4 && !connected  ) {
      //givve it a client at this location
      urId = Integer.parseInt(val);
      c = new Client(THIS,ip,urId);
      connected = true;
    }
    if (c != null) {
      //bring the spinner in here also
      if (mode == "connecting") {
      c.write("connected");
      if (printConnect) {
     CONSOLE.addLine("\nConnected succesfully! You are player " + str(urId-2000) );
     printConnect = false;
      }
      }
      
      if (mode == "urTurn" && Spin.done) {
      
      c.write(str(Spin.roll) + "|");
     
      CONSOLE.addLine("\nRolled a " + Spin.roll);
      mode = "question";
      c.readString();
      spin = false;
    }
 
    if (mode == "question") {
      String valueRead = c.readString();
      
       
      if (valueRead != null && valueRead.charAt(0) == 'Q' && parseQues(valueRead) != -1) { //that means a question
        mode = "inQuestion";
        println(valueRead);
        ques.CUR_Q = parseQues(valueRead); //******!!!!!!
        //needs to read if there is a | at the end
      }
      
   
      //Question should bbe in form Q#|
      //starts with Q and ends with |
      //
      
      
    }
     if (mode == "inQuestion") {
      ques.run();
      
      if (ques.doneQuestion) {
        if (!look_reset) {
          if (ques.correct) {
          CONSOLE.addLine("\nCorrect answer!");
          }
          else {
            CONSOLE.addLine("\nWrong answer, you got moved back");
          }
        }
        look_reset = true;
        
        if (ques.correct) {
          c.write("C");
          
        }
        else {
          
          c.write("W");
        }
      }
      key = 0;
      
    }
     if (look_reset) {
       if (c != null) {
         String done = c.readString();
       if (done != null && done.equals("D") || !isTurn) { //keep getting null pointer here
         reset();
         println("DONE");
         for (int i = 0; 10 > i; i++) {
         delay(1000); //CLUTCH HERE //wait 10 seconds
         }
       }
       
       }
      }
      
   
      //Question should bbe in form Q#|
      //starts with Q and ends with |
      //
      
      
    }
    
     
    
    if (turn!= null) {
       
       int read = turnRead;
       
       //println(read,isConnect);
      
        
         if (  read == urId - 2001 && !isConnect) {
           println("has become your turn");
           mode = "urTurn";
           CONSOLE.addLine("\n Your turn!");
           spin = true;
           isConnect = true;
          
         }
       
      
      
    }
  }
  void reset() {
    look_reset = false;
    mode = "connecting";
    spin = false;
    done = false;
    isTurn = true;
    isConnect = false;
    Spin.reset();
    ques = new question();
  }
  int parseQues(String val) {
    boolean start = false;
    String res = "";
    for (int i = 0; val.length() > i; i++) {
      if (val.charAt(i) == '|') {
        start = false;
        if (!(res.length() > 10)) {
       
      
          return Integer.parseInt(res);
        }
      }
      if (start) {
        res += val.charAt(i);
      }
      if (val.charAt(i) == 'Q') {
        start = true;
      }
     
      
      
    }
    
    
      return -1;
    
  }
}

client c;
void setup() {
  size(800,500);
   c =   new client(this);
}
void draw() {
  background(0);
   c.update(this);
  
}
void keyPressed() {
  c.ques.curKey = key;
}