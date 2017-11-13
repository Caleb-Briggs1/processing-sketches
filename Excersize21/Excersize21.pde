PImage billy; 
void setup() {
  fullScreen();
  billy = loadImage("lava2.gif");
  image(billy,random(width),random(height),random(width),random(height));
  filter(ERODE);
  billy.mask(billy);
}
void draw() {
  image(billy,random(width),random(height),random(width),random(height));
  filter(ERODE);
  billy.mask(billy);
}
