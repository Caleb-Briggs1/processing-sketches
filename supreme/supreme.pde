void setup() {
 size(800,800,P3D);
}
float x = 0;
float siz = 1;
float r = 1;
float y = 1;
float z = 1;
void draw() {
  lights();
 
  directionalLight(126, 126, 126, 0, 0, -1);
  ambientLight(102, 102, 102);
  spotLight(51, 102, 126, 50, 50, 400, 
          0, 0, -1, PI/16, 800); 
  float sizeX = 10;
  float sizeY = 10;
  float sizeZ = 10;
  
  background(0);
  translate(width/2-r,height/2-y,siz);
  rotateX(radians(mouseX));
   rotateY(radians(mouseY));
   rotateZ(radians(z));
   if (mousePressed) {
     siz += 5;
   }
   if (keyCode == RIGHT) {
     r+=1;
   }
   if (keyCode == LEFT) {
     r-=1;
   }
   if (keyCode == UP) {
     y-=1;
   }
   if (keyCode == DOWN) {
     y+=1;
   }
   if (key == ' ' && keyPressed) {
     z++;
   }
   
  // scale(siz);
    rotateZ(radians(x));
    textSize(20);
    text("SUPREME", 0, 50,50);
    text("SUPREME", 0, 00,150);
    for (int ww = 0; ww < 10; ww++) {
    pushMatrix();
    noStroke();
    fill(60,60,60);
    blendMode(ADD);
    //translate(ww*15,0,150+sin(radians(frameCount))*50);
    text("SUPREME",0, ww*20,150+radians(frameCount)*50);
    popMatrix();
    }
  for (int k = 0; sizeZ > k; k++) {
  for (int j = 0; sizeY > j; j++) {
  for (int i = 0; sizeX > i; i++) {
    fill(i*20,j*20,k*20,50);
    translate(20,0);
    if (i  == 5 || j  == 5  || k == 4) {
    box(20);
    }
  }
  translate(-20*sizeX,20);
  }
  translate(0,-20*sizeY,20);
}


}