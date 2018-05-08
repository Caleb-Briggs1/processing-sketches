//global varaibbel for images
//creat edesign for this
//create swap connection protocol

//keep track of mmax players, and discconnect from curr and then connect to previvous id
//until it goes an dreaches the mover id
class screens {
  String mode = "SCREEN1";
  firstScreen SCREEN1;
  speech intro;
  roll game;
  screens(PApplet thi) {
    SCREEN1 = new firstScreen();
    intro = new speech();
    game = new roll(thi);
  }
  void run(PApplet thi) {
    
    if (mode.equals("SCREEN1") ) {
      SCREEN1.run();
      if (SCREEN1.start) {
        mode = "instructions";
      }
    }
    if (mode.equals("instructions") ) {
      
      //*********
      //
      //GREAT IDEA: MAKE INSTRUCTIONS FOR INDIDUAL PLAYERS< AND THEY CLICK READY WHEN THEY HAVE READ THEM
      //*********
      
      mode = "connect";
      
    }
    if (mode.equals("connect")) {
      //****
      //in this mode you are waiting for evveryone to connection, and for the server to start the game
      //****
      if (key == ' ') {
        mode = "game";
      }
      
    }
    if (mode.equals("game") ) {
      game.run(thi);
      game.draw();
      if (key == 'r') {
       game.SERVER.sendStop(0,thi);
       
      }
    }
    
  }
}

screens b ;
void setup() {

  size(500,500);
  b = new screens(this);
}

void draw() {
  background(255);
  b.run(this);
  
}