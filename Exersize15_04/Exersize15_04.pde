int Red = 0;
void draw() { 
  fill(Red,0,0);
  rect(50,50,20,20);
}
void keyPressed() {
  if( keyCode == 65 ) {
    Red = Red + 15;
  }
}