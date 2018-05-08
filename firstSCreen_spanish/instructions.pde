class speech {
  //create image thing for this
  String mode = "show";
  //create somethign where it draws a box based on max length from all lines
  //eg if you ahve the liens ( 'a', 'ab','a')
  //it draws a box 3 units tall and 2 units wide
  void run() {
    
    if (mode.equals("show")) {
      
    }
  }
  void drawBox(String[] text, float x, float y) {
     rectMode(CENTER);
     textAlign(CENTER,CENTER);
     textSize(32);
     fill(250);
     rect(x,y, longest(text) * 18, text.length * 48);
     fill(0);
     text(join(text,"\n"),x,y);
     //seems to work quite well
  }
  
  
  int longest(String[] words) {
    int max = 0;
    for (int i = 0; words.length > i; i++) {
      if (words[i].length() > max) {
        max = words[i].length();
      }
    }
    return max;
  }
}