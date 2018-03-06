

//now make them interact wiht other explosions
ArrayList<float[]> a = new ArrayList();

view camera = new view();

void setup() {
  size(500,500,P3D);
  for (int i = 0; (width* height)/150 > i; i++) {
    float[] b = {i % (width/5), i/(width/5), noise(i % width, i/width) * 100};
    //float[] b = {i % (width/5), i/(width/5), random(100)};
    a.add(b);
  }
  
}
void draw() {
  background(255);
  camera.run();
  rectMode(CENTER);
  lights();
  for (int i = 0; a.size() > i; i++) {
  
  
    pushMatrix();
    fill(a.get(i)[0]*25,a.get(i)[2],a.get(i)[1] *25,90);
    translate(a.get(i)[0]*25,a.get(i)[2]/2,a.get(i)[1] *25);
    pushMatrix();
    rotateX(radians(180) );
    box(25, (a.get(i)[2]),25);
    popMatrix();
    popMatrix();
    
   
  }
  
 
  
}
void keyPressed() {
  camera.keyPres(); if (key == 'w') {
    keys[0] = true;
  }
  if (key == 's') {
    keys[1] = true;
  }
  if (key == 'a') {
    keys[2] = true;
  }
  if (key == 'd') {
    keys[3] = true;
  }
  if (key == ' ') {
    keys[4] = true;
  }
}
void keyReleased() {
  camera.keyRel();
  if (key == 'w') {
    keys[0] = false;
  }
  if (key == 's') {
    keys[1] = false;
  }
  if (key == 'a') {
    keys[2] = false;
  }
  if (key == 'd') {
    keys[3] = false;
  }
  if (key == ' ') {
    keys[4] = false;
  }
}
