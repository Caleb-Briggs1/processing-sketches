class end {
  float scroll = -50;
  String[] ends;
  void init() {
  ends = loadStrings("end.txt");
  }
  void display(int id) {
   
      fill(255);
      //reverse this string in processing, because it goes from teh bottom up in the current movment
      String text = (ends[id]);
      text(join(reverse(split(text,"*")),"\n"),width/2,scroll);
      scroll += 0.5;
      
    
  }
}