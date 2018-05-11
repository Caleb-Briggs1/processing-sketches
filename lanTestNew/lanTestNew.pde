import processing.net.*;
//imrpove speed of character drawing by preloading images, it is much faster that way
//String ip = "192.168.168.139";
 //I think the ques is not workign right
//PROBLEM: Getting stuck in the mode INQUESTION for clients. Need to make sure they get the message of their turn being over
//add tile actions when landing on a certain one
//amke everything self contained within modes
//some things are messed up in the nexTurn,it should be changed ffrom the whole
//advance to enxt turn boolean
//set turn id to negative number after tile, so then it is nobodies turn!!*!*!*!*!*!*!!!*!**!
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
  
  void handleConnections(PApplet THIS) {
    //write current id
    currentPortServer.write(str(2001 + id) );
    // ----  ----  ----  ----  ----
    
    if (mode.equals("getConnection")) {
      for (int i = 0; servers.length > i; i++) {
      //servers[i].write(str(i)) ;
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

roll MAP;
void setup() {
  size(500,500);
  MAP = new roll(this);

}
void draw() {
  background(225);
  MAP.draw(this);

}