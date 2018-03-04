//needs arduino
import processing.serial.*;
import processing.sound.*;
import cc.arduino.*;
int gens = 0;
Arduino arduino;
int ledPin = 13;
int potPin = 0;
float delayVal;

ArrayList<enemy> test = new ArrayList();
class info {
  Arduino arduino;
  void init(Arduino arduino_) {
   arduino = arduino_;
  }
  
  float getVal() {
    return (map(arduino.analogRead(potPin),0,1024,-1,1)); //max turn
  }
}
info a = new info();
player b = new player();
ArrayList<barrier> bar = new ArrayList();
void setup() {
  for (int i = 0; 5 > i; i++ ) {
    test.add(new enemy());
    test.get(i).init();
  }
  
  b.init();
  a.init(new Arduino(this, Arduino.list()[Arduino.list().length -1],57600));
  for (int i = 0; 505 > i; i++) {
    bar.add(new barrier());
    bar.get(i).init();
    
    
  }
 
  size(800,800);
  noStroke();
  colorMode(HSB,250);
}
float dirr = 1;
void keyPressed() {
  
   if (key == ' ') {
    dirr *= -1;
  }
  key = '5';
}
void draw() {
   background(0,0,255);
   if (frameCount %50 == 0) {
  gens+=1;
   }
 
  if ((int)random(10) == 1) {
    test.add(new enemy());
    test.get(test.size() - 1).init();
  }

  text(gens,10,10);
  delayVal = a.getVal();
 //println(dirr);
  b. dir += radians(4 * dirr);
 keyCode = 00;
  
b.update(delayVal,bar,test);
int minus = 0;
for (int i = 0; test.size()-minus > i; i++) {
  if ( test.get(i).update(b.x,b.y,bar,b.tr)) {
    gens += 5;
    test.remove(i);
    b.tr.add(0,new trail());
    b.tr.get(0).init((abs(delayVal) * 50),b.x/width * 250,b.y/height * 250,b.x,b.y);
    minus++;
    
  }
  

 
}


  for (int i = 0; bar.size() > i; i++) {
    bar.get(i).update(b.x,b.y);
  }
  
}
class trail {
  float[] hsb = {0,0,0};
  float size = 5;
  float x2,y2;
  float alpha = 250;
  void init(float h, float s, float b, float x_, float y_) {
    hsb[0] = h;
    hsb[1] = s;
    hsb[2] = b;
    x2 = x_;
    y2 = y_;
    
  }
  void update(float playX, float playY) {
    
    alpha -= 3;
    noStroke();
    fill(abs(hsb[0]),abs(hsb[1]) + 50,abs(hsb[2]) + 50,250);
    
    rect(playX - x2  + width/2,playY - y2 + height/2,size,size);
  }
  
}
class player {
  float x = 400;
  float y = 400;
  float size = 5;
  float dir = 0;
  float speed = 3;
  float col = random(250);
  ArrayList<trail> tr = new ArrayList();
  void init() {
    for (int i = 0; 30 > i; i++) {
      tr.add(new trail());
      tr.get(i).init(0,0,0,0,0);
    }
  }
  void update(float val, ArrayList<barrier> bar, ArrayList<enemy> en) {
    stroke(255);
     for (int i = 0; tr.size() > i; i++) {
     
      tr.get(i).update(x,y);
     
    }
     tr.remove(tr.size() -1);
     tr.add(0, new trail());
     tr.get(0).init(abs(col),x/width * 250,y/height * 250,x,y);
    fill(abs(col),x/width * 250  + 50,y/height * 250 + 50,250);
    boolean hit = false;
    boolean en2 = false;
    for (int i = 0; en.size() > i; i++) {
      for (int k = 0; en.get(i).tr2.size() > k; k++) {
       if( abs(x-en.get(i).tr2.get(k).x2) < 5 && abs(en.get(i).tr2.get(k).y2- y) < 5) {
        x = 0;
        y = 0;
        gens = 0;
        en2 = true;
        col = random(250);
        
        for (; tr.size() > 30;) {
          tr.remove(0);
        }
        
       }
     }
      if (abs(en.get(i).x - x) < 5 && abs(en.get(i).y - y) < 5 ) {
         x = 0;
        y = 0;
        gens = 0;
       en2 = true;
       col = random(250);
       
       for (; tr.size() > 30;) {
          tr.remove(0);
        }
        
      }
    }
    if (en2) {
       for (int i = 0; en.size() > i; i++) {
         en.remove(0);
         
       }
    }
    
   for (int i = 0; bar.size() > i; i++) {
      if ((bar.get(i).isTouching(5, x + (sin(dir) * speed), y + (cos(dir) * speed)))) {
        hit = true;
        if (bar.get(i).type == 1) {
          bar.get(i).type = 0;
          bar.get(i).x += random(-50,50);
          
          for (int wq = 0; 30 > wq; wq++) {
            tr.add(new trail());
            tr.get(0).init(0,0,0,0,0);
            }
            
        }
       
      }
    }
    if (!hit) {
    x += sin(dir) * speed;
    y += cos(dir) * speed;
    }
    dir += val/4.0;  //UNCOMMENT THIS
    rect(width/2,height/2,size,size);
  }
  
}

class enemy {
  float x;  //rember to subtract from pisitions
  float y;
  float dir = radians(random(360));
  float turn = random(5);
  float acel = 0;
  float maxSpeed = random(1,8);
  float c = random(250);
  ArrayList<trail> tr2 = new ArrayList();
  void init() {
     x = b.x + (random(-width,width)*2);
     y = b.y + (random(-height,height)*2);
      for (int i = 0; 30 > i; i++) {
      tr2.add(new trail());
      tr2.get(i).init(0,0,0,0,0);
    }
  }
  boolean update(float playerX, float playerY, ArrayList<barrier> bar, ArrayList<trail> tr) {
    for (int i = 0; tr2.size() > i; i++) {
     
      tr2.get(i).update(playerX,playerY);
     
    }
     tr2.remove(tr2.size() -1);
     tr2.add(0, new trail());
     tr2.get(0).init(c,x/width * 250,y/height * 250,x,y);
    fill(250,250,250);
    //if the player is at 500,500, and 
    rect( playerX - x  + width/2,playerY - y + height/2,5,5);
    
    stroke(0,0,250);
    
    if (dir < radians( 90 - degrees(atan2(playerY - y , playerX - x)))) {
      dir += radians(turn);
      
      
    }
    
    else {
      dir -= radians(turn);
      
      
    }
    if( abs(dir - radians( 90 - degrees(atan2(playerY - y , playerX - x)))) < 3) {
      acel += .1;
    }
    else {
      acel *= .95;
    }
    acel = min(maxSpeed,acel);
    acel *= .9999;
    
    boolean hit = false;
     for (int i = 0; tr.size() > i; i++) {
       if( abs(x-tr.get(i).x2) < 5 && abs(tr.get(i).y2- y) < 5) {
         return true;
       }
     }
    for (int i = 0; bar.size() > i; i++) {
      if ((bar.get(i).isTouching(5, x + sin(dir), y + cos(dir)))) {
        hit = true;
       
      }
    }
    if (!hit) {
       x += sin(dir) * acel;
       y += cos(dir) * acel;
    }
 
    //line(x,y,x + sin(dir) * 50,y + cos(dir) * 50 );
    return false;
  
    
  }
}
class barrier {
  float x;
  float y;
  float size;
  int type = 0;
  void init() {
    x = random(-width*3,width*3);
    y = random(-height*3,height*3);
    size = random(5,15);
    if ((int)random(0,20) == 1) {
      type = 1;
    }
  }
  void update(float playX, float playY) {
    fill(0);
    if (type == 1) {
      fill(120,250,250);
    }
    rect(playX - x + width/2, playY-y + height/2,size,size);
  }
  boolean isTouching(float size_, float x_, float y_) {
    if ( abs(x-x_) < size_/2 + size/2 && abs(y - y_) < size_/2 + size/2) {
      return true;
    }
    return false;
  }
}
