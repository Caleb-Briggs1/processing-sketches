//integrate dis my boi

class console{
  String CurrentConsole = "";
  float x,y;
  float size = 200;
  float sizeX = 300;
  float textSize = 11;
  console ( float x_, float y_) {
    x = x_;
    y = y_;
  }
  void run() {
    display();
  }
  void display() {
    fill(135,206,250,150);
    stroke(30,144,2525);
    rectMode(CENTER);
    strokeWeight(7);
    textSize(textSize);
    rect(x,y,sizeX,size,5,5,5,5);
    textAlign(LEFT,TOP);
    fill(255,255);
    text(CurrentConsole,x-sizeX/2 + 10,y - size/2 + 8);
    strokeWeight(1);
    textAlign(CENTER,CENTER);
  }
  void addLine(String info) {
    CurrentConsole = info + CurrentConsole;
    CurrentConsole = updateLook();
  }
  String updateLook() {
    int lineFeeds = 0;
    String res = "";
    for (int i = 0; CurrentConsole.length() > i; i++) {
     
      if (CurrentConsole.charAt(i) == '\n') {
        lineFeeds ++;
        
        
      }
      if (lineFeeds < (size/(textSize*2)) ) {
          res += CurrentConsole.charAt(i);
        }
    }
    return res;
    
  }
}