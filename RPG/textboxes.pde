class textBox {

  //maybe add that at a period it should wait longer, might make things better
  //also flashing light at curosr rmight b enice looking

  
  void display(String words, int x, int y, int xS, int yS) {
    
    rectMode(CENTER);
    fill(255);
    rect(x,y,xS,yS);
    
    fill(250,0,0);
    text(words,x,y);
    
  }
  void displayBox(String words) {
    
   
    rectMode(CENTER);
    fill(0);
    strokeWeight(5);
    stroke(182,182,142);
    rect(width/2,height-75 - 25,width-100,150);
    
    fill(182,182,142);
    textAlign(CENTER,CENTER);
    //create blining arrow in corner + make it go faster if mouse down
    //find corner here 
    //- (width-100)/2,- 50
    text(words,width/2  ,height-100 );
    
  }
 
  void displayArrow() {
    tri(width/2 + (width-100)/2 - 50 , height-75 - 25 + 75 - (sin(radians(frameCount*10)) * 10) - 50, 15,15);
  }
  void tri(float x, float y, float size, float size2 ) {
    triangle(x,y,x+size,y,x+size/2,y+size/2);
  }
 
}
class text {
  textBox box = new textBox();
  int start = 0;
  int startBefore = 0;
  String text = "";
  float word = 0;
  float wordSpeed = 0.3;
  float initWordSpeed = 1;
  int mode = 0;
  int clickSpeed = 10;
  text(String a, int mode_ ) {
    text = a;
    mode = mode_;
    
  }
  boolean done() {
    if (int(word)+1 == text.replace("}"," ").length()) {
      return true;
    }
    return false;
  }
   void showFace(String name) {
    image(loadImage(name),width/2 - (width-100)/2 + 50,height-75 - 25   - 50,32,32);
  }
  void displayPoem() {
   
      PFont font = createFont("IowanOldStyle-Black", 16);
      textFont(font);
    if (text.charAt(int(word)) == '\\' && text.charAt(int(word)+1) == 'n'){
      text = text.substring(0,int(word-1) ) + "\n" + text.substring(int(word+2),text.length()); //this actually works
    }
    if (text.charAt(int(word)) == '}'){
      
      word += 1;
      
      if (startBefore == 0) {
        startBefore = int(word);
        
      }
      else {
        
        start = int(startBefore);
        
        startBefore = int(word);
        
      }
      
    }
    box.displayBox(text.replace("}"," ").substring(start,int(word)+1 ));
    word += wordSpeed;
    if (word >= text.length()-1) {
      word = text.length()-1;
    }
    
    if (text.charAt(int(word) ) == ',' ) {
      wordSpeed = initWordSpeed/8;
    }
    else if (text.charAt(int(word) ) == '.' ||text.charAt(int(word) ) == '!' || text.charAt(int(word) ) == '?'  ) {
      
      wordSpeed =initWordSpeed/12;
    }
    else {
      wordSpeed = initWordSpeed;
    }
    if (mousePressed) {
    wordSpeed *= initWordSpeed * clickSpeed; //change this to 2 if mouse down
    }
    if (this.done()) {
      box.displayArrow();
    }
  }
  void reset() {
    start = 0;
    startBefore = 0;
  }
  void display() {
    
    
    if (mode == 1) {
    PFont font = createFont("IowanOldStyle-Black", 16);
    textFont(font);
    }
    if (mode == 2) {
      PFont font = createFont("Impact", 16);
      textFont(font);
    }
    
    box.displayBox(text.substring(0,int(word)+1 ));
    word += wordSpeed;
    if (word >= text.length()-1) {
      word = text.length()-1;
    }
    
    if (text.charAt(int(word) ) == ',' ) {
     wordSpeed = initWordSpeed/8;
    }
    else if (text.charAt(int(word) ) == '.' ||text.charAt(int(word) ) == '!' || text.charAt(int(word) ) == '?' || text.charAt(int(word)) == ';' ) {
      
      wordSpeed =initWordSpeed/12;
    }
    else {
       wordSpeed = initWordSpeed;
    }
    if (mousePressed) {
   wordSpeed *= initWordSpeed * clickSpeed; //change this to 2 if mouse down
    }
  }
}