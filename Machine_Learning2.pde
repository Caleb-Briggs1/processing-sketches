 float printReslast2 = 0;
 float printRes = 0;
import java.util.Collections;
ArrayList Barriers = new ArrayList(); //rect only support currently 
ArrayList Rect1 = new ArrayList(); //First Rect
ArrayList Rect2 = new ArrayList(); //Second Rect
int size = 450;
int GenerateSize = 20;
populations Population = new populations();
line[] Creatures = new line[size];
float[] goal = {(int)random(150,size),(int)random(150,size)};
float XS = 0;
float YS = 0;
  void setup() {
   size(450,450);
   for (int i = 0; 85 > i; i++) { //random(45)
     ArrayList temp = new ArrayList();
     Rect1 = temp;
     Rect1.add((float)((int) random(150,size)) ); //x
    Rect1.add((float)((int) random(150,size))); //y
    Rect1.add(5.0); //width
    Rect1.add(5.0); //height
    Barriers.add(Rect1); 
  }
  Population.init();
  }
void draw() { 
   println("run");
  background(255);
  printReslast2 = printRes;
  fill(255,0,0);
   ellipse(goal[0],goal[1],10,10);
   fill(100);
  rectMode(RADIUS);
  for (int i = 0; Barriers.size() > i; i++) {
    ArrayList temp2 = new ArrayList();
    temp2 = (ArrayList) Barriers.get(i);
    rect((float)temp2.get(0),(float)temp2.get(1),(float)temp2.get(2),(float)temp2.get(3));  
  }
 Population.move();
 Population.Breed();
 Population.killRandom();
 Population.Reset();
frameRate(5000);
println(printRes/250);  
  }
float angleToRadians (float angle) { 
  return (angle *PI) / 180;
}
ArrayList GenerateRandom(int len) {
  ArrayList temp = new ArrayList();
  for (int i = 0; len > i; i++) {
    temp.add(random(-90,90));
  }
  return temp;
}
//Class LINE------------
class line {
  //global vars
   ArrayList Algorithm = GenerateRandom(GenerateSize);
  float posX = XS;
  float posY = YS;
  void drawAlgorithm() {
  float degrees = 0;
  for (int i = 0; Algorithm.size() > i; i++) {
    degrees = degrees + (float)Algorithm.get(i);
    lineD(degrees,5);
    }
    fill(0,250,0);
    ellipse(posX,posY,10,10);
    fill(255);
  } 
  void setAlg(ArrayList newAlg) {
    Algorithm = newAlg;
  }
  ArrayList getAlg() {
    return Algorithm;
  }
 boolean lineD(float direction2, float len) { //return true if hit
  float direction = angleToRadians(direction2);
  float tempX = posX;
  float tempY = posY;
  for (int i = 0 ;len > i; i++) { 
    if( CheckCollision((tempX + cos(direction)),(tempY+sin(direction)))) {
      return true;
    }
    //point(tempX,tempY);                                                 //<<UNCOMMENT TO SEE FULL LINE
    tempX = tempX + cos(direction);
    tempY = tempY + sin(direction);
  }
  //set new POSes
  posX = tempX;
  posY = tempY;
  return false;
} 
  float fitness() {
    return abs(posX-goal[0]) + abs(posY-goal[1]);
  }
  ArrayList breed(ArrayList Algorithm2) {
    //take average of both of them
    ArrayList res = new ArrayList();
    for (int i = 0; Algorithm.size() > i; i++) {
      res.add(   (((float)Algorithm.get(i) + (float)Algorithm2.get(i)))/2);
    }
    return res;
  }
  void reset() {
    if ( ( abs((printRes/250 - printReslast2/250)) < .01) && printRes/250 != printReslast2/250 && printRes > 4.0) { //&& printRes/250 < 100 //
    Algorithm.add(random(-180,180));
    print(printRes/250);
    print(printReslast2/250);
    }
    posX = XS;
    posY=YS;
  }  
}
boolean CheckCollision(float ObjX, float ObjY) { //will only work with points as params, and Rect
  for (int i = 0; i < Barriers.size(); i++) {
    ArrayList tempArray = new ArrayList();
    tempArray = (ArrayList) Barriers.get(i);
    if ( within( abs(((float) tempArray.get(0) - ObjX)), 0,    (float) tempArray.get(2)) && within( abs(((float) tempArray.get(1) - ObjY)), 0,    (float) tempArray.get(3))) {
      return true;
    }
  }
  return false; 
}
boolean within(float item1,float item2,float threshold) { //returns if item1 is within threshold of item2 
  if (abs(item1-item2) < threshold) {
    return true;
  }
  return false;
}
class populations {
  void init() {
    for (int i = 0; size > i; i++) {
         Creatures[i] = new line();
      }
  }
    void move() {
      for (int i = 0; size > i; i++) {
        Creatures[i].drawAlgorithm();
        
      }
    }
    
    void killRandom() { 
      ArrayList ToKill = Fitness();
      for (int i = 0; ToKill.size() > i; i++) {
       int A = (int) random(size-1);
       int B = (int) random(size-1);
        Creatures[(int)ToKill.get(i)].setAlg(Creatures[A].breed(Creatures[(int)random(B)].getAlg()));
      }
    }
    void Breed() {
      for(int i = 0; 10 > i; i++) {
      Creatures[(size-i)-1].setAlg(Creatures[(size-i)-1].breed(Creatures[(int)random(size)].getAlg()));
      }
    }
    void replaceWorst() {
     for(int i = 0; 10 > i; i++) {
        Creatures[(size-i)-1].setAlg( GenerateRandom(GenerateSize));
      }
    }
    void Reset() {
      for (int i = 0; size > i; i++) {
        Creatures[i].reset();
      }
    }
    void Average() {
      ArrayList res = new ArrayList();
      printRes = 0;
      for (int i = 0; size > i; i++) {
         res.add(Creatures[i].fitness());
         printRes = printRes + Creatures[i].fitness(); 
      }
    }
    ArrayList Fitness() {
      ArrayList res = new ArrayList();
      printRes = 0;
      for (int i = 0; size > i; i++) {
         res.add(Creatures[i].fitness());
         printRes = printRes + Creatures[i].fitness();
      }
      println(printRes/250);
      ArrayList res2 = new ArrayList();
      for (int a = 0; res.size() > a; a++) {
       res2.add( FindLowest(res));
        res.remove(FindLowest(res));
      }
      return res2;
    }
    
    
    
    
    
    
}
int FindLowest(ArrayList item) {
    float currentLowest = (float) item.get(0);
    int index = 0;
    for(int i = 0; item.size() > i; i++) {
      if ((float) item.get(i) > currentLowest) {
        currentLowest = (float) item.get(i);
        index = i;
      }
    }
    return index;
}
boolean in(int item, ArrayList list) {
  for (int i = 0; list.size() > i; i++) {
    if (item == (int) list.get(i)) {
      return true;
    }
  }
  return false;
}