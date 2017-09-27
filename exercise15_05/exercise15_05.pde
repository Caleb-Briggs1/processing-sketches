int Red = 0;
int Blue = 0;
void draw() { 
  fill(Red,Blue,0);
  rect(50,50,20,20);
}
void keyPressed() {
  if( keyCode == 65 ) {
    Red = Red + 15;
  }
  if (keyCode == 66) {
    Blue = Blue + 15;
  }
}