class dark {
  int fadeVal = 450;
  float sleepVal = 0;
  float addSleep = 0;
  int speed = 1;
  float view = 1;
  void show() {
  for (int i = 0; (width*height)/30 > i; i++) {
    fill(0,0,0,dist(width/2,height/2,i%width * 30,i/width * 30)/view);
    noStroke();
    rect(i%width * 30,i/width * 30, 30,30);
  }
  }
  void shake() {
     
     rotate(radians(random(-2,2)) );
     translate( random(-15,15),random(-15,15));
   
  }
  void sleepy() {
    sleepVal = sin(radians(frameCount * speed))* 140 + addSleep ;
    if (sleepVal < 0) {
      sleepVal = 0;
    }
    for (int i = 0; (width*height)/30 > i; i++) {
    fill(0,0,0,dist(width/2,height/2,i%width * 30,i/width * 30) + sleepVal);
    noStroke();
    rect(i%width * 30,i/width * 30, 30,30);
  }
  
 
    
  }
  boolean fade() {
    for (int i = 0; (width*height)/30 > i; i++) {
    fill(0,0,0,dist(width/2,height/2,i%width * 30,i/width * 30)+fadeVal );
    noStroke();
    rect(i%width * 30,i/width * 30, 30,30);
    
  }
  if (fadeVal > 0) {
    fadeVal -= 3;
  }
  else {
    return true;
  }
  return false;
  }
  //transition

  
}