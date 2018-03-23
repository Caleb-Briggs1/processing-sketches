class choiceBox {//pre programmed for ease
  int curChoi = -1;
  
  String[] words;
  choiceBox(int id, choiInit2 choi) {
    words = choi.words.get(id);
  }
  choiceBox(int id, choiInitS choi) {
    words = choi.words.get(id);
  }
  void show() {
    int totalHeight = 200;
    
   for (int i = 0; words.length > i; i++){
    
    fill(0);
    if (words.length-i-1 == curChoi) {
      fill(250,0,0,50);
    }
    strokeWeight(5);
    stroke(182,182,142);
    rect(width/2,height-(totalHeight/words.length*i)  - 50,width-100,(totalHeight/words.length) );
    
     
    fill(182,182,142);
    textAlign(CENTER,CENTER);
    
      text(words[words.length-i-1],width/2  ,height-(totalHeight/words.length*i)  - 50 );
      if (abs(width/2-mouseX) < width/2 && abs(height-(totalHeight/words.length*i)  - 50 - mouseY) <(totalHeight/words.length)/2 ) {
       noStroke();
      float size = (totalHeight/words.length)/2.5;
     if(mousePressed) {
        curChoi = words.length-i-1;
        fill(0);
      }
      triangle(70,height-(totalHeight/words.length*i)  - 50 -size   ,50 + size*2,height-(totalHeight/words.length*i)  -50   ,70,height-(totalHeight/words.length*i)  - 50 + size  );
      
    }
     }
  }
  
}
class choiInit { //purely to initalize infomation on text
  ArrayList<String[]> words = new ArrayList();
  choiInit() {
    
    String[] text = loadStrings("text.txt");
    for (int i = 0; text.length > i; i++){
      words.add( split(text[i],"|"));
    }
    
    
  }
}
class choiInit2 { //purely to initalize infomation on text
  ArrayList<String[]> words = new ArrayList();
  choiInit2() {
    
    String[] text = loadStrings("choi.txt");
    for (int i = 0; text.length > i; i++){
      words.add( split(text[i],"|"));
    }
    
    
  }
}
class choiInitS { //purely to initalize infomation on text
  ArrayList<String[]> words = new ArrayList();
  choiInitS() {
    
    String[] text = loadStrings("choiS.txt");
    for (int i = 0; text.length > i; i++){
      words.add( split(text[i],"|"));
    }
    
    
  }
}