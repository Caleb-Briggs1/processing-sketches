String billy = "billy";
float i= 1;
float x = 300;
float y = 900/2;
int size = 850;
boolean mode = true;
int direction = 0;
int size3 = 520;
test[] test2 = new test[size3];
void setup() {
  size(900,900);
}
class test {
  float dir = random(90);
  float max = random(1000);
  void draw() {
    if (gens < max) {
     gens += 1;
    float[] val = lineD(direction,i/10,x,y); //i/10 == Size
    direction += dir; // --> how the direction changes
   
    fill(sqrt(i)*2,70,sqrt(gens),5);
    
   
    textSize(15+i/30);
    //println(i);
    
    text(" Flynn ",val[0],val[1] ); //for 15+i/30 --> startval + growSpeed
    x = val[0]; 
    y = val[1];
    i *= 1.0046;
   }
  }
}

  /*
  textSize(i);
  y+= i;
  text(billy,50,y/1.5);
  if (i > 2 && mode){
    i/=1.5;
    
  }
  else {
    i*=1.5;
    mode = false;
  }
  */
  

int gens = 0;
void draw() {
  println(gens);
   if (gens < 2100) {
     gens += 1;
    float[] val = lineD(direction,i/10,x,y); //i/10 == Size
    direction += 49.33122; // --> how the direction changes
   
    fill(70,sqrt(i)*2,sqrt(gens)*3,100);
    
   
    textSize(15+i/30);
    //println(i);
    
    text(" Flynn",val[0],val[1] ); //for 15+i/30 --> startval + growSpeed
    x = val[0]; 
    y = val[1];
    i *= 1.0046;
   }
}
float angleToRadians (float angle) { 
  return (angle *PI) / 180;
}
float[] lineD(float direction2, float len, float posX, float posY) { 
  float direction = angleToRadians(direction2);
  float[] b = {posX+ (len* sin(direction)), posY+(len * cos(direction))};
  return b;
}