class commentator {
  String mode = "start";
  int speech = 0;
  String[] modes = {"intro","greeting","introchar","introchar2","introchar3","start","freelance"};
  String[] freeMode = {"energy","bacteria","seePlayer"};
  String[] teams = {"THE SUPER SNEAKY SPAGGETI","TEAM 2","CALEB"};
  String[] teams2 = {"CALEB","THE SUPER SNEAKY SPAGGETI","TEAM 2"};
  boolean start = false;
  boolean seeMode = false;
  boolean firstBlood = false;
  int id1 = -1;
  int id2 = -1;
  //mainlu talk about events
  words txt;
  //create threads, or not
  //add pauses
  void run(map map) {
    setMode(map);
    if (mode == "intro") {
       textSize(20);
      txt = new words("Hello ladies and gentlemen, \n welcome to another game of & \n ANIMALITO!& &  ");
      speech = 1;
      mode = "talking";
    }
    if (mode == "greeting") {
      txt = new words("I'm your host,& LAAARRRYY. & \n Without futher ado, lets begin! &  ");
      speech = 2;
      mode = "talking";
    }
    if (mode == "introchar") {
      txt = new words("In the top left corner we have & &\n THE SUPER SNEAKY SPAGGETI &  ");
      speech = 3;
      mode = "talking";
    }
    if (mode == "introchar2") {
      txt = new words("In the bottom right corner we have & &\n TEEEAAAM 2 &  ");
      speech = 4;
      mode = "talking";
    }
    if (mode == "introchar3") {
      txt = new words("In the top right corner\n master coder, and returning champion & &\n & CALEBBBBB &  ");
      speech = 5;
      mode = "talking";
    }
    if (mode == "start") {
      txt = new words("We will begin in \n & &  3 \n & & 2 \n & & 1 \n & & GOOOO!!! & & ");
      speech = 6;
      mode= "talking";
    }
    if (mode == "freelance") {
      start = true;
     
      mode = "bacteria";
     
    }
    //maybe mention how htye saw things
    //draws rectangesl and liens towrads goal
     if (mode == "seePlayer") {
       String res = "Heres some insight into how the bots are thinking \n This is how they see & & & & & & ";
       seeMode = true;
        txt = new words(res + "& ");
        mode = "talking";
     }
    if (mode == "bacteria") {
      //
      textSize(15);
      String res = "";
      float bacteria = b.food.size();
      if (bacteria > 500) {
        res = "holy bacteria!" + "how" + txt.randAdj() + " \n There is: " + bacteria + " bacterias on the board!";
      }
      else if (bacteria > 100) {
        
        
         res = "not too shabby! \n There is: " + bacteria + " bacterias on the board!";
      }
      else if (bacteria > 50) {
        res = "the bacteria is a" +  txt.randAdjM() +"amount \n There is: " + bacteria + " bacterias on the board!";
      }
      else {
        res  = "How " + txt.randAdjB() + "! A bacteria drought! \n There is a mere: " + bacteria + " bacterias on the board!";
      }
       txt = new words(res + "& & & & ");
        mode = "talking";
       
    }
    
    if (mode == "energy") { 
     textSize(10);
      
      String[] speech = {"Look at those numbers! \n", "Heres the stats for you: \n","What an amazing game! \n","Heres for all you nerds out there! \n"};
      String[] place = {" is leading with a"," is in seconds with a"," is in last with a"};
      String res = speech[int(random(speech.length))];
      float val1 = ME.YOU.energy;
      float val2 = team1.YOU.energy;
      float val3 = team2.YOU.energy;
      for (int i = 0; 3 > i; i++) { //for there teams
        if (val1 > val2 && val1 > val3) {
          String adj = "";
          if (i == 0) {
            adj = txt.randAdj();
          }
          else if (i ==1) {
            adj = txt.randAdjM();
          }
          else if (i == 2) {
            adj = txt.randAdjB();
          }
          res += teams[2] + place[i] + adj + " energy of " + val1 + "\n & ";
          val1 = -1;
        }
        else if (val2 > val1 && val2> val3) {
          String adj = "";
          if (i == 0) {
            adj = txt.randAdj();
          }
          else if (i ==1) {
            adj = txt.randAdjM();
          }
          else if (i == 2) {
            adj = txt.randAdjB();
          }
          res += teams[1] + place[i] + adj + " energy of " + val2 + "\n & ";
          val2 = -1;
        }
        else if (val3 > val2 && val3> val1) {
          String adj = "";
          if (i == 0) {
            adj = txt.randAdj();
          }
          else if (i ==1) {
            adj = txt.randAdjM();
          }
          else if (i == 2) {
            adj = txt.randAdjB();
          }
          res += teams[0] + place[i] + adj + " energy of " + val2 + "\n & ";
          val3 = -1;
        }
      }
      txt = new words(res + "& & & & ");
      mode = "talking";
    }
    
    
    
    
    
    
    
    if (mode == "talking") {
      txt.speak();
      
      if (txt.done() && !start) {
        
        mode = modes[speech];
      }
      
      if (txt.done() && start) {
        if (frameCount % 1000 == 0) {
        mode = freeMode[int(random(freeMode.length))];
        seeMode = false;
        
        }
      }
    }
    
    
  }
  void setMode(map map) {
    String res = "";
    if (!firstBlood) {
    if(ME.YOU.hasEaten) {
      res = txt.randAdj() + "! " + teams[2] + " has managed to snag the first bacteria";
       firstBlood = true;
    }
    if (team1.YOU.hasEaten) {
      res = txt.randAdj() + "! " + teams[0] + " has managed to snag the first bacteria";
       firstBlood = true;
    }
    if (team2.YOU.hasEaten) {
      res = txt.randAdj() + "! " + teams[1] + "\n has managed to snag the first bacteria";
      firstBlood = true;
    }
    
    }
    if (!res.equals("") ) {
    txt = new words(res + "& & & & ");
    mode = "talking";
    }
    
  }
  void eat(int attacker, int victim) {
    textSize(30);
     txt = new words(teams2[attacker] + "\n has attacked \n" +  teams2[victim] + "!! & & ");
     
      mode = "talking";
  }
  void dead(int id) {
     textSize(30);
     txt = new words("HOLY!\n " + teams2[id] + "\n HAS DIED ");
     
      mode = "talking";
  }
  void winner(int id) {
    textSize(30);
    txt = new words("WE HAVE A WINNER!\n " + teams2[id] + "& ");
     
    mode = "talking";
  }
  
  
}

class words {
  String speech;
  int count =0;
  int wait = 0;
  String[] adj = {" stunning"," amazing"," immpresive"," awesome"," spectacular"};
  String[] adjM = {" mediocre"," alright"," ok"," average"," medium"};
   String[] adjB = {" rubbish"," trash"," pathetic"," depressing"," terrible", " pitiful"};
  words(String speech_) {
    speech = speech_;
  }
  String randAdj() {
    return adj[int(random(adj.length))];
  }
  String randAdjM() {
    return adjM[int(random(adjM.length))];
  }
  String randAdjB() {
    return adjB[int(random(adjB.length))];
  }
  void speak() {
    if (wait == 0) {
    if(frameCount % 3 == 0) {
    count+=1;
    }
    }
    else {
      wait--;
    }
    display(curString());
  }
  boolean done() {
    if (count < speech.length()) {
        return false;
    }
    return true;
  }
  String curString() {
    
    if (!done()) {
      if (speech.charAt(count) == '&') {
        speech = speech.replaceFirst("&",""); //look up replace first
        //speech.r
        
      count++;
      wait = 25;
    }
        return speech.substring(0,count);
    }
    else {
    return speech.substring(0,speech.length());
    }
  }
  void display(String string) {
    //textSize(20);
    textAlign(CENTER,CENTER);
    rectMode(CORNERS);
    fill(0,0,0,50);
    rect(20,20,width-20,200);
    fill(150,0,50);
    text(string,width/2,100);
    rectMode(CENTER);
    
  }
}