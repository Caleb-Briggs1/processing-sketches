class firstScreen {
  public boolean start = false;
  public int players = 2; //default
  public int map = 1;
  //done = comment ator
  
  private String screen = "start";  
  private button startButton ;
  private button Option;
  private slider Players;
  private slider MapSize;
  private final int fadeSpeed = 3;
  private int speedCur = 0;
  private PImage background;
   firstScreen() {
      startButton= new button(width/2,height/2,80,80,loadImage("startButton1.png"));
      Option = new gear(width-50,50,100,100,loadImage("gear.png"));
      Players = new slider(width/2 - 50, height/3, 100,3, "Players","2","4"); //2 to 4 players
      MapSize = new slider(width/2 - 50, 2 * height/3, 100,3, "Map Size","1","3"); //2 to 4 players
      background = loadImage("backgroundImage.png");
   }
  void run() {
    
    if (screen.equals("start") ) {
      image(background,width/2,height/2,width,height);
       startButton.run();
       Option.run();
       
       if (startButton.touch) {
        
         screen = "fade";
       }
       if (Option.touch) {
         screen = "toOption";
       }
       /*
       if (c.touch) {
         screen = "option"; //maybbe = animation, gives times to do animation
       }
       */
    }
    if (screen.equals("done")) {
      start = true;
    }
    if (screen.equals( "toOption") ) {
      image(background,width/2,height/2,width,height);
      tint(max(0,255-speedCur) );
      speedCur += fadeSpeed;
      if (speedCur >= 355) {
        screen = "fadeOption";
        speedCur = 255;
      }
    }
    if (screen.equals( "fadeOption") ) {
      if (speedCur > 125) {
      speedCur -= 1;
      }
      else {
        screen = "option";
        speedCur = 0;
      }
      background(255-speedCur);
    }
    if (screen.equals("option")) {
       background(120);
       
       Players.display();
       MapSize.display();
       map = MapSize.curChoi + 1;
       players = Players.curChoi + 2;
       text("Press space to continue",width/2,height - 50);
       if (key == ' ' && keyPressed) {
         screen = "fadeO"; //create fade out
         speedCur = 0;
         key = 'z'; //z is escape key
       }
       
    }
    if (screen.equals( "fadeO")) {
      background(120 -speedCur);
      speedCur ++;
      if (speedCur > 120) {
        screen = "start";
        Option.touch = false;
        
      }
    }
    if (screen.equals( "fade") ) {
      image(background,width/2,height/2,width,height);
      tint(max(0,255-speedCur) );
      speedCur += fadeSpeed;
      if (speedCur >= 355) {
        screen = "done";
        
      }
    }
    
   
    //display()
    //tet if done()
    //test if options screen
    //read options
  }
  
  
  private class slider { //for class slider
    private float x,y,xSize,stagnations;
    public int curChoi = 0;
    private final float moveSize; 
    private String title,left,right;
    slider (float x_, float y_, float xSize_, float stagnations_, String title_, String left_, String right_) {  //stagnations = amoutn of choices
      x = x_;
      y = y_;
      xSize = xSize_;
      stagnations = stagnations_-1; //cause first is a choice, accounts for that
      moveSize = xSize/stagnations; 
      title = title_;
      left = left_;
      right = right_;
      
    }
    void display() {
      strokeWeight(5);
      stroke(180);
      line(x,y,x+xSize,y);
      fill(140);
      stroke(140);
      
      ellipse(x+(curChoi*moveSize),y,10,10);
      if (mousePressed && abs(mouseY - y) < 5 && abs( (mouseX-x)-xSize/2) < xSize/2 + 5  ) {
        curChoi = int(((mouseX-x)/moveSize ));
        
      }
      fill(50);
      textAlign(CENTER,CENTER);
      textSize(15);
      text(left, x-25,y);
      text(right, x+xSize+25,y);
      textSize(25);
      text(title,x+xSize/2,y - 25);
      
      textSize(15);
      strokeWeight(1);
    }
  }
  private class button {
    float x,y,xSize,ySize;
    boolean touch = false;
    PImage look ;
    final float oscTime = 35;
    final float oscSize = .9;
    
    button( float x_, float y_, float xSize_, float ySize_, PImage look_ ) {
      x = x_;
      y = y_;
      xSize = xSize_;
      ySize =ySize_;
      look = look_;
    }
    void run() {
       hover();
       display();
       oscSize();
      noTint();
       if (isTouching()) {
         touch = true;
         
       }
       
    }
    void hover() {
      
      if (abs(mouseX-x) < xSize/2 && abs(mouseY-y) < ySize/2) {
        //maybe swap to image 2?
        
        
        
      }
     
    }
    void oscSize() {
      
      xSize += (sin(frameCount/oscTime) ) *oscSize ;
      ySize += (sin(frameCount/oscTime) ) *oscSize;
    }
    void display() {
     imageMode(CENTER);
     image(look,x,y,xSize,ySize); 
    }
    boolean isTouching() {
       return (abs(mouseX-x) < xSize/2 && abs(mouseY-y) < ySize/2 && mousePressed) ;
         
       
    
  }
}
  
  private class gear extends button {
    private float turn = 0;
    private float turnSpeed = 0;
    gear(float a, float b, float c, float d,PImage look) {
      super(a,b,c,d,look);
    }
    void run() {
      
      
      
      display();
 hover();


     
      noTint();
       if (isTouching()) {
         touch = true;
       }
    }
    void display() {
     imageMode(CENTER);
     pushMatrix();
    
     translate(x,y);
     rotate(turn);
     image(look,0,0,xSize,ySize); 

     popMatrix();
    }
    void hover() {
     
      if (abs(mouseX-x) < xSize/2 && abs(mouseY-y) < ySize/2) {
        //maybe swap to image 2?
        
       turnSpeed += radians(.3) ;
        
      }
      turn += turnSpeed;
      turnSpeed *= .93;
    }
  }
}