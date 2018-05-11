class question {
  
  //remove some of the extraneous prints
  private String[] keys = {"a","b","c","d","*"};
  int CUR_Q = 0;
  char curKey = ' ';
  int[] colors = {0,20,50,70};
  private int choi = 0;
  private String[] b;
  private String[] afterShuffle ;
  private char[] typeAnswer;
  private ArrayList answer;
  boolean correct = false;
  String mode = "ask";
  String curInput = "";
  boolean chosen = false;
  boolean doneQuestion = false;
  question() {
  b = loadStrings("questions.txt");
  afterShuffle = new String[b.length];
  typeAnswer = new char[b.length];
  answer = new ArrayList();;
  preprocess();
  }
  void run() {
    
    if (mode.equals("wait") ) {
      //do nothing, maybbe process stuff
    }
    if (mode.equals( "ask") ) {
      doneQuestion = false;
      correct = false;
      this.display(CUR_Q);
      
      if(chosen) {
      mode = "answer";
      chosen = false;
     
    }
      
    }
    if (mode.equals("answer")) {
      this.showAnswer(CUR_Q); //this needs some fixing
      if (key == ' ') {
        CUR_Q++;
        mode = "afterQuestion";
        
        doneQuestion = true;
        //    *** AFTER QUESTION, THEN MAYBE MOVE ON
        //c.write("correct");
        //c.write("wrong");
      }
    }
  }
  void preprocess() {
    for (int i = 0; b.length > i; i++) {
      
      afterShuffle[i] = getQuestion(i);
    }
  }
  void display(int id) {
     displayQuestion(id);
     char type = typeAnswer[id];
     if (type == '1') {
     displayChoice("multipleChoice",str(curKey) );
     }
     if (type == '2') {
       
       displayChoice("input",str(curKey) );
     }
     check(id);
     curKey = 0;
  }
  void showAnswer(int id) {
    textSize(32);
    String curAnswer = new String();
     char type = typeAnswer[id];
     
    if (type == '1' ) {
      curAnswer = keys [(int) (answer.get(id)) ];
    }
    if (type == '2') {
      curAnswer = trim((String) (answer.get(id)));
    }
    
    fill(190);
    textSize(40);
    if (! correct) {
    text("The correct answer is: \n " + curAnswer.toUpperCase() ,width/2,50);
    }
    else {
      text("Correct!",width/2,50);
    }
    textSize(15);
    fill(100);
    
    text("To continue, press space",width/2,height-50);
    
  }
  String getQuestion(int id) {
    
    char type = b[id].charAt(0); //tell you the type
    b[id] = b[id].substring(1,b[id].length());
    typeAnswer[id] = type;
    String ques2 = "";
    if (type== '1') {
    String[] ques = split(b[id].replace('+','\n'),'*'); //.replace("*","\n");
    String ans = ques[1];
    ques2 =  ques[0] +join( addLetter(shuffle( (remove(0,ques)) )),'\n');
    String[] ques3 =split(ques2,'\n');
    for (int i = 0; ques3.length > i; i++) {
      if (trim(ques3[i].substring(2,ques3[i].length())).equals( trim(ans) ) ) {
        answer.add( i-1);
        }
      }
    }
    if (type == '2') {
      String[] ques = split(b[id].replace('+','\n'),'*'); 
      ques2 = ques[0]; //
      println(ques[1],"this is added");
      answer.add( ques[1].toLowerCase() ) ;
      
      //should be 1 long
    }
    
    
    return ques2;
  }
  
  void displayQuestion(int id) {
    String text = afterShuffle[id];
    textSize(15);
    textAlign(CENTER,CENTER);
    fill(0);
    text(text,width/2,100);
  }
  int updateKeyRead( String keyRead) {
     int playerKey = -1;
    if (!chosen) {
    if (keyRead.equals("\n")) {
      keyRead = "*";
    } 
   
    
    
    keyRead = trim(keyRead);
   
    for (int i = 0; keys.length > i; i++) {
      
      
      if (keyRead.equals(keys[i] ) ) {
        
        playerKey = i;
        if (i <= 3) {
        choi = playerKey;
        }
        else {
          chosen = true;
          //choi = curInput;

          
        }
        
      }
    }
    }
    return playerKey;
  }
  void displayChoice(String type, String keyRead) {
    int val = updateKeyRead(keyRead);
    
    if (type == "multipleChoice") {
      rectMode(CENTER);
      colorMode(HSB);
      for (int i = 0; 4 > i; i++) {
        
        fill(colors[i],200 - (int(chosen && i == choi)*150),150 + (int((i == choi)) * 50) );
        
        float x = (width/4) + (width/2 * (i%2));
        float y = 275 + (i/2 * 150);
        rect( x,y,width/2,150);
        fill(0);
        textSize(40);
        text(keys[i].toUpperCase(),x,y);
      }
    }
    if (type == "input") {
      textSize(32);
      fill(150);
      text(curInput,width/2,height/2);
      
      if (int(keyRead.charAt(0)) == 8) {
        if (curInput.length() > 0) {
        curInput = curInput.substring(0,curInput.length()-1);
        }
      }
      else {
        if (int(keyRead.charAt(0)) > 0 &&int(keyRead.charAt(0)) < 127 ) {
        curInput += keyRead;
        println(curInput);
        }
      }
      
    }
    colorMode(RGB);
  }
  void check(int id) {
    char type = typeAnswer[id];
    Object input = new Object();
    Object curAnswer = new Object();
    if (type == '1' ) {
      curAnswer = (int) (answer.get(id));
      input = choi;
    }
    if (type == '2') {
      
      
      curAnswer = trim((String) (answer.get(id)));
     
      input = trim(curInput.toLowerCase());
      
    }
   
    
    if (chosen) {
     key = 'z';
      
      if (type == '1') {
           if (input == curAnswer ) {
              correct = true;
              
              
            }
            else {
              
              correct = false;
            }
      }
      if (type == '2') {
        if (input.equals(curAnswer) ) {
          correct = true;
          
          
        }
        else {
          
          correct= false;
        }
       
    }
    
    
    curInput = ""; 
    
    
    }
    
  }
  void draw(String keyRead) {
   fill(0);
    //text(q,width/2,height/2);
    
    
    for (int i = 0; 4 > i; i++) {
      fill(250);
      if (i == choi ) {
        fill(0);
        if (keyRead.equals( "*" ) ) {
          fill(150);
         
         }
      }
      
      rect(i*width/4,300,width/4,50);
    }
  }
  String[] shuffle(String[] list) { //this shuffles past one, ignores question basically
    
    String[] res = new String[list.length];
    int[] listO = new int[list.length];
    for (int i = 0; list.length > i; i++) {
      listO[i] = i;
    }
   
    for (int i = 0; listO.length > 0; i++) {
      int choi =(int) random(listO.length);
     
      res[i] = list[listO[choi]];
      
      
      listO = ((remove(choi,listO)));
      //test this shuffle, it is not tested yet
      
      
    }
    return res;
  }
  String[] addLetter(String[] val) {
    String[] res = new String[val.length];
    for (int i = 0; val.length > i; i++) {
      res[i] = keys[i].toUpperCase() + ": " + val[i] ;
    }
    return res;
  }
  int[] remove(int id, int[] list) {
    int count = 0;
    int[] res = new int[list.length-1];
      for (int j = 0; list.length > j; j++) {
        
        if (j != id) {
          res[count] = list[j];
          count++;
        }
      } //removve the one
      return res;
      
  }
  
  String[] remove(int id, String[] list) {
    int count = 0;
    String[] res = new String[list.length-1];
      for (int j = 0; list.length > j; j++) {
        
        if (j != id) {
          res[count] = list[j];
          count++;
        }
      } //removve the one
      return res;
      
  }
}