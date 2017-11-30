int size = 4950;
particle[] Particles = new particle[size];
ArrayList shape = new ArrayList();
ArrayList temp = new ArrayList();
float XX = 0;
float YY = 0;
float XX2 = 0;
float YY2 = 0;
void setup() {
  
  size(1000,800);
  for (int i = 0; size > i; i++) {
    Particles[i] = new particle();
    Particles[i].reset();
    
    
  }
  int[] val = {100,100,150,150,200,175,250,200};
  shapeCreate(val);
  
}
float times = 0;
float sizeADD = 0;

int mode = 0; //mode 0 is go to mouse, mode 1 = use ArrayList
void draw() {
  if (mousePressed == true) {
    
    sizeADD += 1;
  }
  
    XX2 = mouseX;
    YY2 = mouseY;
    
   
  
  println(shape);
  if (mode == 1) {
 ArrayList val = (ArrayList) shape.get(int(times%shape.size()) );
 mouseX = (int) val.get(0);
 mouseY = (int) val.get(1);
  }
  background(0);
  times = times + 1;
  
  for (int i = 0; size > i; i++) {
    Particles[i].update();
    if (Particles[i].timeSurvied() == true) {
      Particles[i].reset();
    }
  }
  //particles die after timeSurvied is greater than x
  
}


class particle {
  float y;
  float gravity;
  float x;
  int generations;
  int maxAge;
  float downY;
  float orginY;
  float orginX;
  float moveX;
  int mod;
  float sizeA;
  void update() {
    noStroke();
    //gravity = gravity + .1;
    fill(generations,generations-y,abs(x+orginX-250)/2.1,250-generations );
    
    y = y + gravity;
    if (generations % mod ==0) {
    moveX = random(-3,3)*(sizeA/10);
    gravity = random(-3,3)*sizeA/10;
    }
    
    x = x+ moveX;
    generations = generations + 1;
    
    ellipse(orginX+x+(XX+XX2*sizeA/10),orginY+y+(YY+YY2*sizeA/10),sizeADD+10-y/50+sizeA,sizeADD+10-y/50+sizeA);
    
   
    
  }
  boolean timeSurvied() {
    if (generations > random(200,600)) {
      return true;
    }
    return false;
    /*
    if (generations > maxAge) {
      return true;
    }
    return false;
    */
  }
  void reset() {
    moveX = random(-200,200);
    orginY = random(-880,800);
    orginX = random(-800,800);
    maxAge = (int) random(5,45);
    gravity = random(-1,5);
   y = random(-10,10);
  x = random(-10,10);
  generations = (int) random(-1,1);
  mod = (int) random(1,15);
  sizeA = random(1,10);
  
  }
  
}
void shapeCreate(int[] args) {
  for (int i = 0; args.length > i; i++) {
     
    temp.add(args[i]);
    if (i % 2 == 1) {
      shape.add(temp);
      temp = new ArrayList();
     }
  }
  
}
//templates 
/* T
  float[] val = {100,100,400,100,200,100,250,400,250,200}
  
  */
/* C
  float[] val = {100,100,150,150,200,175,250,200};
*/