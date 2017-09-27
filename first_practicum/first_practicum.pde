/* By Caleb Briggs
  Created Spt. 18 2017
  Generative Art
  
*/
int size = 12950; //amount of nodes
ArrayList positions = new ArrayList();
ArrayList Test = new ArrayList(); 

void setup() {
  float x = 700;
  float y = 400;
  float direction = 0;
  for (int i = 0; size > i; i++) {
    flutter temp = = new flutter();
    Test.add( 
    float[] val = lineD(direction,i/10,x,y); //i/10 == Size
    direction += 16.5; // --> how the direction changes
    Test[i].init(val[0],val[1],15+i/30); //for 15+i/30 --> startval + growSpeed
    x = val[0];
    y = val[1];
  }
  fullScreen(); 
}

void draw() {
   frameRate(1000);
    for (int i = 0; size > i; i++) {
    Test[i].move();
  }
}

class flutter { //creates an object that moves out a certain amount of time, then stops moving if size is too low
   float x,y,size; //these are start vals
   float direction,timeLiving,turnAmount,maxTurn,turnVal; //these are auto generated
   float generations; //these are counting vals
  void init(float x2,float y2,float size2) { 
    x = x2;
    y = y2;
    size = size2;
    //Auto Generated -- Values below subject to change greatly
    direction = 180; 
    timeLiving = (int) random(10,4060);
    turnAmount = (int) random(1,10);
    maxTurn = (int) random(-1,2);
    turnVal = random(1,2);
  }
  void move() {
     size = size -0.1; //size change rate
    if (-0.1>size) { //min size
      size = size + 0.1; //needs to be equal to the size change rate
    }
    noStroke();
    if (generations < timeLiving) { //Values below subject to change greatly
      
         colorMode(HSB);
         blendMode(RGB);
        fill(100/abs(size+1),sqrt(y+10)*10,abs(generations)/10 - abs(180-direction) -15,255/size); //this affect color, choice choosen because it looked best
        float[] newPos = lineD(direction,1,x,y); //update pos
        x = newPos[0];
        y = newPos[1];
        rect(x,y,size,size); //rect is faster, but ellipse looks a little better
        direction += turnVal + random(-0.1,0.1);
        generations += 1;
       if (generations % turnAmount == 0) { 
          turnVal = random(-1,1); //amount it turns
       }
    } 
  }
}
boolean within(float item1, float item2, float differance) {
  if (abs(item1 -item2) < differance) {
    return true;
  }
  return false;
}
float RadtoAng (float angle) { 
  return (angle /PI) * 180;
}
float angleToRadians (float angle) { 
  return (angle *PI) / 180;
}
float[] lineD(float direction2, float len, float posX, float posY) { 
  float direction = angleToRadians(direction2);
  float[] b = {posX+ (len* sin(direction)), posY+(len * cos(direction))};
  return b;
}