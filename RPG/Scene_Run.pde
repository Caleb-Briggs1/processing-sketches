class Scene {
 //note on id
 //start 1001 for first special id
 //eg 1005 = 5th special speech
  int id = 1;
  int endId = 0;
  //void syncGlobal  --> takes all global variables and sets this class isntance to those globals, useful for otehr calsses ruefering
  //void runScene (id) --> main function, eg will run text box and stuff
  //void initScene (id) --> creates things for runScene, always called before and just 1 time
  text speech;
  choiceBox choice;
  Scene ( choiInit2 b){
    choice = new choiceBox(0,b);
  }
  void initScene(int id_) {
    if (id_ == 1) {
      speech = new text("Have pity on my soul, whichever you are, shade or living man!",1);
    }
  }
  void run () {
    if (id == 1){
      speech.display();
      speech.showFace("danteFace.png");
      if (speech.done() && mousePressed) {
        id = 2;
        
      }
      if (speech.done()) {
        speech.box.displayArrow();
      }
    }
    else if (id == 2) {
     choice.show();
     if (key == ENTER && choice.curChoi != -1 && keyPressed) {
      
       key = '-';
       if (choice.curChoi == 0) {
         id = 3;
         fade = true;
         updateArray1();
       }
       if (choice.curChoi == 1) {
         id = 1001;
         speech = new text("But this person is in trouble! Aren't you going to help him?",1);
         //then ask again, say something like " but thi man is in touble, arent you going to help him!"
           //get another choice, and new ending screen
       }
       if (choice.curChoi == 2) {
         end = true;
       //you dead
       id = -1;
       endId = 0;
      
     }
     }
     
    }
    else if (id == 3) {
      canMove = true;
    }
     else if (id == 4) {
       
      canMove = false;
      choice.show();
       if (key == ENTER && choice.curChoi != -1 && keyPressed) {
      
       key = '-';
       //AT HERE ------------------------------------------------------------------------------------------------------------------------
       if (choice.curChoi == 1) {
         path = true;
        
         id = 5; //test htis out
         canMove = true;
       }
       }
    }
    else if (id == 1001){
      speech.display();
     
      if (speech.done() && mousePressed) {
        id = 1002;
        choice = new choiceBox(0,new choiInitS());
      }
      if (speech.done()) {
        speech.box.displayArrow();
      }
    }
     else if (id == 1002){
       choice.show();
       if (key == ENTER && choice.curChoi != -1 && keyPressed) {
         key = '-';
         if (choice.curChoi == 0) {
          
          id = 3;
          fade = true;
          updateArray1();
         }
         if (choice.curChoi == 1) {
           end = true;
           endId = 1;
           id = -1;
        
         
       }
      
     }
     
      
    }
  }
  
  //
}

class thread {
  ArrayList threads = new ArrayList();
  
  
}