int x  = 500;
int y = x;
int speed = 1;
void setup() {
  size(800,800);
}
void draw() {
  print(key);
  if (key == 'a') {
    x--;
  }
  if (key == 'd') {
    x++;
  }
  if (key == 'w') {
    y--;
  }
  if (key == 's') {
    y++;
  }
  noStroke();
  fill(x/4,y/4,50,10);
  ellipse(x,y,10,10);
    
  
}