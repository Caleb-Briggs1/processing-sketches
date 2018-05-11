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
   colorMode(HSB);
    for (int i = 0; split > i; i++) {
      float deg = radians(i * (360.0/split) );
     stroke(i * (250/split),250,150 +( abs((sin(radians(frameCount/2)))) * 155) );
      line(x,y,x + cos(deg) *len,y + sin(deg)*len);
       //line(x,y,x + cos(deg + PI) *len,y + sin(deg+PI)*len);
    }
    colorMode(RGB);
  }
  void draw() {
    noFill();
    stroke(frameCount/4,150,150);
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
     colorMode(HSB);
     stroke( (turn/360.0) * 255,250,250);
     
      line(x,y,x + len*cos(turn), y + len*sin(turn));
      turn += speedTurn;
      speedTurn *= .99;
      if (abs(speedTurn)  < .0001) {
        done = true;
        spin = false; 
         roll = ((int(turn / radians(360/split))+split/2) % split + 1);
        colorMode(HSB);
      }
      
    }
    
  }
}