int size = 950;
particle[] Particles = new particle[size];
void setup() {
  
  size(500,500);
  for (int i = 0; size > i; i++) {
    Particles[i] = new particle();
    Particles[i].reset();
    
    
  }
  
}
void draw() {
  
  background(0);
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
  void update() {
    noStroke();
    //gravity = gravity + .1;
    fill(generations,generations-y,0,250-generations );
    blendMode(ADD);
    y = y + gravity;
    if (generations % mod ==0) {
    moveX = random(-3,3);
    gravity = random(-3,3);
    }
    
    x = x+ moveX;
    generations = generations + 1;
    ellipse(orginX+x,orginY+y,10-y/50,10-y/50);
    
  }
  boolean timeSurvied() {
    if (orginY+y > 500 || orginY+Y < -100 || generations > 250) {
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
    orginY = mouseY;
    orginX = mouseX;
    maxAge = (int) random(5,45);
    gravity = random(-1,5);
   y = random(-10,10);
  x = random(-10,10);
  generations = (int) random(-1,1);
  mod = (int) random(1,15);
  
  }
  
}