void recur(int x, int y, int z, int num) {
  float x2 = x;
  float y2 = y;
  float z2 = z;
  
  float a = radians( random(360));
  x2 = x +  sin(a) * num;
  y2 = y +  cos(a) * num;
  z2 = z + random(-1,1) * num;
  
  //stroke(num,0,0,num);
 // line(x,y,z,x2,y2,z2);
  float[] c = {x,y,z,x2,y2,z2,num};
  b.add(c);
 
  
  if (num > 1) {
    for (int i = 0; int(sqrt(num/2)) > i; i++) {
       
      recur(int(x2),int(y2),int(z2),num/2);
    }
  }
  
  
}
view cam = new view();
ArrayList<float[]> b = new ArrayList();
void setup() {
  size(600,600,P3D);
  recur(0,0,100,int(pow(2,8)) );
}
void draw() {
  background(255);
  for (int i = 0; b.size() > i; i++) {
    float[] v= b.get(i);
    stroke(v[6],0,0,v[6]);
    line(v[0],v[1],v[2],v[3],v[4],v[5]);
  }
  cam.run();
  
}
void keyPressed() {
  cam.keyPres();
}
void keyReleased() {
  cam.keyRel();
}
class view {
  boolean[] keys = {false,false,false,false,false,false};
  float x = 0; float y = 0; float dir = 0; float z = 0; float yUp = 0;  //all to default of 0
  float speedMove = 1; //speed moving
  void run() {
      doKey();
      camera( x, y , z, x+(cos(radians( dir)))  , y+(yUp/(height*.25)) , z+sin(radians( dir)),0,-1,0);
  }
  void keyPres() {
    if (keyCode == RIGHT) {
       keys[0] = true;
     }
     if (keyCode == LEFT) {
       keys[1] = true;
     }
     if (keyCode == UP) {
        keys[2] = true;
     
     }
     if (keyCode == DOWN) {
       keys[3] = true;
     }
     if (key == 'w') {
       keys[4] = true;
     }
      if (key == 's') {
        keys[5] = true;
     }
  }
  void keyRel() {
    if (keyCode == RIGHT) {
       keys[0] = false;
     }
     if (keyCode == LEFT) {
       keys[1] = false;
     }
     if (keyCode == UP) {
        keys[2] = false;
     
     }
     if (keyCode == DOWN) {
       keys[3] = false;
     }
     if (key == 'w') {
       keys[4] = false;
     }
      if (key == 's') {
        keys[5] = false;
     }
  }
  void doKey() {
     if (keys[1]) {
       dir += speedMove;
     }
     if (keys[0]) {
       dir -= speedMove;
     }
     if (keys[3]) {
       yUp-= speedMove;

     }
     if (keys[2]) {
       yUp+= speedMove;

     }
     if (keys[4]) {
       x += cos(radians(dir)) * speedMove;
       z += sin(radians(dir)) * speedMove;
       y += yUp/(height*.25) * speedMove;
     }
      if (keys[5]) {
       x -= cos(radians(dir)) * speedMove;
       z -= sin(radians(dir)) * speedMove;
       y -= yUp/(height*.25) * speedMove;
       
     }
  }
}
