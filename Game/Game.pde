//Spells
//catapult
//splash range
//wave mode add 
//summoners
import processing.sound.*;
SoundFile file;
int size = 5669; //red
ArrayList fit = new ArrayList();
int size2 = 3510; //green
ArrayList fit2 = new ArrayList();
int death1, death2 = 0;
PImage a_;
 PImage b_;
 PImage c_;
 PImage d_;
 PImage e_;
  PImage f_;
  PImage g_;
  PImage h_;
  PImage i_;
  PImage j_;
  PImage k_;
void setup() {
  a_ = loadImage("archer.png");
   b_ = loadImage("archer2.png");
   c_ = loadImage("test2.png");
   d_ = loadImage("test.png");
   e_ = loadImage("giant.png");
   f_ = loadImage("Catapult.png");
   g_ = loadImage("Catapult2.png");
   h_ = loadImage("crys.png");
   i_ = loadImage("wiz2.png");
   j_ = loadImage("wiz.png");
   k_ = loadImage("wall.png");
  file = new SoundFile(this, "a.wav");
  file.play();
  fullScreen();
  fit.add(new warrior( width-150, height/2,5000,.1,1,0));
   ((warrior)fit.get(0)).range = 200;
  fit2.add(new warrior( 150, height/2,5000,.1,1,0));
   ((warrior)fit2.get(0)).range = 200;
  for (int i = 0; 100 > i; i++) {
     
      fit.add( new warrior( width-random(50), random(height),15,1,1,1));
  
    
  
  }
  for (int i = 0; 100 > i; i++) {
    fit2.add( new warrior( 0+random(50), random(height),15,1,1,1));
  }
 
}
float money1 = 1000;
float money2 = 1000;
boolean spend = false;
int sadfhwioasdf = 0;
float x1 = 0;
float x2 = 0;
int waitTime = 0;
info[] ts = new info[50];
float past = 5000;
void draw( ){
  
  //stats
  background(255);
  if (waitTime == 0) {
    for (int i = 0; fit.size() > i; i++ ) {
          
     
          ((warrior)fit.get(i)).wind = false;
          
        }
        
    
  }
  else {
    waitTime--;
  }
  if (sadfhwioasdf == 90) {
    
    for (int i = 0; 50 > i; i++) {
      ts[i] = new info(0,random(height),x1,x2);
      
    }
  }
  if (sadfhwioasdf != 0) {
    sadfhwioasdf--;
    for (int i = 0; 50 > i; i++) {
      ts[i].update();
      if (ts[i].done) {
        sadfhwioasdf = 0;
        for (int j =0; fit.size() > j; j++) {
          try {
        ((warrior)fit.get(i)).shoot(x1,x2);
          }
          catch (IndexOutOfBoundsException e) {
            print("error");
          }
        }
      }
    }
    
  }
  
  
  if (key == ' ' && keyPressed) {
    fill(50,0,0,50);
    ellipse(mouseX,mouseY,150,150);
    if (mousePressed) {
      if (money2  > 700) {
        money2 -= 700;
      
        fill(250,0,0,250);
        ellipse(mouseX,mouseY,150,150);
        sadfhwioasdf = 90;
        
        x1 = mouseX;
        x2 = mouseY;
        key = 'z';
      
      }
    }
  }
   if (key == 'a' && keyPressed) {
    ellipse(mouseX,mouseY,150,150);
    if (mousePressed) {
      if (money2  > 200) {
        money2 -= 200;
      waitTime = 110;
        fill(250,0,0,250);
        ellipse(mouseX,mouseY,150,150);
        
        
        x1 = mouseX;
        x2 = mouseY;
        key = 'z';
        for (int i = 0; fit.size() > i; i++ ) {
          if (abs(( ((warrior)fit.get(i)).x-mouseX)+ abs(( ((warrior)fit.get(i)).y-mouseY))) < 150 ) {
     
          ((warrior)fit.get(i)).wind = true;
          }
          
        }
      }
    }
  }
  fill(50,50,50);
  text(str(money2),50,50);
   text(str(money1),width-50,50);
   
   if ( (fit.size() == 1 && ((warrior)fit.get(0)).hp != past) || (int)random(0,100) == 1 ) {
     if ((int)random(0,5) == 1) {
     spend = true;
     past = ((warrior)fit.get(0)).hp;
     }
   }
   if (money1 < 100) {
     spend = false;
   }
  if (spend == true) {   
  if (money1 > 50 && (int)random(3) == 1) {
    money1 -= 50;
    fit.add(new warrior(width, random(height),7,1,1,1));
  } 
    if (money1 > 300 && (int)random(2) == 1) {
    money1 -= 300;
    fit.add(new warrior(width, random(height),5,1,1,2));
    ((warrior)fit.get(fit.size()-1)).range = 50;
  }
  if (money1 > 450 && (int)random(15) == 1) {
    money1 -= 450;
    fit.add(new warrior(width, random(height),50,2,1,3));
    
  }
  if (money1 > 1500 && int(random(10)) == 1) {
    money1 -= 1500;
    fit.add(new warrior(width, random(height),100,50,.5,5));
    ((warrior)fit.get(fit.size()-1)).range = 250;
  }
  if ((money1 > 1500) && (int(random(21)) == 1||money1>8000)) {
      money1 -= 1500;
    fit.add(new warrior(width, random(height),10,5,.5,6));
    ((warrior)fit.get(fit.size()-1)).range = 20;
  }
  }
   
  if (money2 > 50 && key == '1' && keyPressed) {
    money2 -= 50;
    fit2.add(new warrior(0, random(height),7,1,1,1));
  }
  if (money2 > 300 && key == '2' && keyPressed) {
    money2 -= 300;
    fit2.add(new warrior(0, random(height),5,1,1,2));
    ((warrior)fit2.get(fit2.size()-1)).range = 50;
  }
  if (money2 > 450 && key == '3' && keyPressed) {
    money2 -= 450;
    fit2.add(new warrior(0, random(height),50,2,1,3));
    
  }
  if (money2 > 150 && key == '4' && keyPressed) {
    money2 -= 150;
    fit2.add(new warrior(width, random(height),3,1,2,1));
    
  }
  if (money2 > 1500 && key == '5' && keyPressed) {
    money2 -= 1500;
    fit2.add(new warrior(0, random(height),100,50,.5,5));
    ((warrior)fit2.get(fit2.size()-1)).range = 250;
  }
  if (money2 > 1500 && key == '6' && keyPressed) {
    money2 -= 1500;
    fit2.add(new warrior(0, random(height),10,5,.5,6));
    ((warrior)fit2.get(fit2.size()-1)).range = 20;
  }
  if (money2 > 1000 && key == '7' && keyPressed) {
    money2 -= 1000;
    fit2.add(new warrior(random(100) + 200, height/2+random(-70,70),1000,5,0,7));
    ((warrior)fit2.get(fit2.size()-1)).range = 20;
  }
   

  
  //fit.add(new warrior(random(width/2,width), random(height),15,3));
  play();
}



void play() {
  if ((int)random(0,2) == 1){
  money1 += 5;
  money2 += 5;
  }
  for (int i = 0; fit.size() > i; i++) {
     
    ((warrior)fit.get(i)).update(fit2,1);
    
  }
   for (int i = 0; fit2.size() > i; i++) {
     
    ((warrior)fit2.get(i)).update(fit,2);
  }
  
  for (int i = 0; fit2.size() > i; i++) { //upddate dead
    
     if ( ((warrior)fit2.get(i)).dead()) {
        float[] mon = {50,300,450,300,1500,1500,1000};
       if (((warrior)fit2.get(i)).type-1 == -1) {
         exit();
       }
       money1 += mon[((warrior)fit2.get(i)).type-1];
       fit2.remove(i);
     }
   
  }
  for (int i = 0; fit.size() > i; i++) {
     if ( ((warrior)fit.get(i)).dead()) {
       float[] mon = {50,300,450,300,1500,1500,1000};
       
       money2 += mon[((warrior)fit.get(i)).type-1];
       
       
       fit.remove(i);
       
       
     }
  }
}
float[] getXY(float x, float y, float x2, float y2) {
  PVector a = new PVector(x,y);
  PVector b = new PVector(x2,y2);
  PVector ts = b.sub(a).normalize();
  float[] temp = {ts.x,ts.y};
  return temp;
}

class warrior {
 
     
  float x,y,hp,atk,range,runspeed;
  int type;
  boolean canAttack = true;
  int shoot = 0;
  int move = 0;
  boolean wind = false;
  warrior (float x_, float y_, float hp_, float atk_, float runspeed_, int type_) {

    runspeed = runspeed_;
    x = x_;
    y = y_;
    hp = hp_;
    atk = atk_;
    type = type_;
  }
  void shoot(float x_, float y_) {
    if (abs((x-x_)+ abs((y-y_))) < 150 ) {
      hp -= 30;
      
     
    }
  }
  void update(ArrayList pos,int type2) {
    
    canAttack = true;
    if (type == 0) {
      
      noTint();
      fill(hp/4,0,0);
      rect(x,y,hp/100,10);
       image(h_,x,y,55,55);
    }
    if (type2 == 1) {
      tint(0,0,250);
    }
    else {
      noTint();
      
    }
     if (type == 1 && type2 == 1) {
      image(d_,x,y,15,15);
      }
      if (type == 1 && type2 == 2 || type == 4) {
         image(c_,x,y,15,15);
      }
      if (type == 2 && type2 == 2 || type == 4) {
         image(a_,x,y,45,45);
      }
      if (type == 2 && type2 == 1) {
         image(b_,x,y,45,45);
      }
      if (type == 3) {
        image(e_,x,y,45,45);
      }
      if (type == 5 && type2 == 1) {
        image(g_,x,y,25,25);
      }
      if (type == 5 && type2 == 2) {
        image(f_,x,y,25,25);
      }
      if (type == 6 && type2 == 2) {
        image(i_,x,y,25,25);
      }
      if (type == 6 && type2 == 1) {
        image(j_,x,y,25,25);
      }
      if (type == 7 && type2 == 2) {
        image(k_,x,y,25,25);
      }
    //for now it will just point to middle
    
    
    //print(pos);
    if (move == 0) {
    float lowDist = 0;
    if (fit.size() == 0) {
         money1 = 10000;
         fit.add( new warrior( width-random(50), random(height),15,1,1,1));
       }
      if (fit2.size() == 0) {
         noLoop();
         exit();
       }
    lowDist = distance(x,y,((warrior)pos.get(0)).x,((warrior)pos.get(0)).y);
    
   
    int index = 0;
    for (int i = 0; pos.size() > i; i++) {
      float dist = random(2) + distance(x,y,((warrior)pos.get(i)).x,((warrior)pos.get(i)).y);
      if (dist < lowDist && dist != 0) {
        lowDist =dist;
        index = i;
      }
    }
    
    if (type == 1 || type == 3) {
    if ( (!(lowDist < 5)))  { 
    float[] targetLoc = { ((warrior)pos.get(index)).x,((warrior)pos.get(index)).y};
     float[] xy;
    if (!(wind)) {
      
    xy = getXY(x,y,targetLoc[0],targetLoc[1]);
    }
    else {
      xy = getXY(x,y,mouseX,mouseY);
    }
    x += xy[0]*runspeed;
    y += xy[1]*runspeed;
    }
    else {//fight
      if (((warrior)pos.get(index)).canAttack) {
      hp = hp - ((warrior)pos.get(index)).atk; //upddate ur hp
      ((warrior)pos.get(index)).canAttack = false;
      }
      if (canAttack) {
      ((warrior)pos.get(index)).hp -= atk; //update its hp
      //canAttack = false;
      }
    }
    }
    if (type == 2) {
      
    if ((!(lowDist < range))) { //if out of range
    
       float[] targetLoc = { ((warrior)pos.get(index)).x,((warrior)pos.get(index)).y};
      
      float[] xy = getXY(x,y,targetLoc[0],targetLoc[1]);
      x += xy[0]*runspeed;
      y += xy[1]*runspeed;
    }
     else {//fight
     //float[] targetLoc = { ((warrior)pos.get(index)).x,((warrior)pos.get(index)).y};
     //line(x,y,targetLoc[0],targetLoc[1]);
      if (((warrior)pos.get(index)).canAttack && lowDist < 5) {
      
      hp = hp - ((warrior)pos.get(index)).atk; //upddate ur hp
      ((warrior)pos.get(index)).canAttack = false;
      }
      if (canAttack) {
      ((warrior)pos.get(index)).hp -= atk; //update its hp
      canAttack = false;
      }
    }
    }
    if (type == 0) {
      
    if ((!(lowDist < range))) { //if out of range
    
       float[] targetLoc = { ((warrior)pos.get(index)).x,((warrior)pos.get(index)).y};
      
      float[] xy = getXY(x,y,targetLoc[0],targetLoc[1]);
     
    }
     else {//fight
     //float[] targetLoc = { ((warrior)pos.get(index)).x,((warrior)pos.get(index)).y};
     //line(x,y,targetLoc[0],targetLoc[1]);
      if (((warrior)pos.get(index)).canAttack && lowDist < 5) {
      
      hp = hp - ((warrior)pos.get(index)).atk; //upddate ur hp
      ((warrior)pos.get(index)).canAttack = false;
      }
      if (canAttack) {
         float[] targetLoc = { ((warrior)pos.get(index)).x,((warrior)pos.get(index)).y};
         stroke(250,0,0,120);
        line(x,y,targetLoc[0],targetLoc[1]);
      ((warrior)pos.get(index)).hp -= atk; //update its hp
      canAttack = false;
      }
    }
    }
   if (type == 5) {
      
    if ((!(lowDist < range))) { //if out of range
    
       float[] targetLoc = { ((warrior)pos.get(index)).x,((warrior)pos.get(index)).y};
      
      float[] xy = getXY(x,y,targetLoc[0],targetLoc[1]);
      x += xy[0]*runspeed;
      y += xy[1]*runspeed;
    }
     else {//fight
     //float[] targetLoc = { ((warrior)pos.get(index)).x,((warrior)pos.get(index)).y};
     //line(x,y,targetLoc[0],targetLoc[1]);
     if (shoot != 100) {
       
      shoot++;
      canAttack = false;
      }
      if (shoot == 100) {
         
        shoot = 0;
        canAttack = true;
      }
      if (((warrior)pos.get(index)).canAttack && lowDist < 5) {
      
      hp = hp - ((warrior)pos.get(index)).atk; //upddate ur hp
      ((warrior)pos.get(index)).canAttack = false;
      }
      if (canAttack) {
      ((warrior)pos.get(index)).hp -= atk; //update its hp
      canAttack = false;
      }
    }
    }
    if (type == 6) {
      
    if ((!(lowDist < range))) { //if out of range
    if (shoot != 45) {
       
      shoot++;
      
      }
      if (shoot == 45) {
         
        shoot = 0;
       
        if (type2 == 2) {
          
          fit2.add( new warrior( x, y,15,1,1,1));
          
        }
        if (type2 == 1) {
          
          fit.add( new warrior( x, y,15,1,1,1));
          
        }
      }
       float[] targetLoc = { ((warrior)pos.get(index)).x,((warrior)pos.get(index)).y};
      
      float[] xy = getXY(x,y,targetLoc[0],targetLoc[1]);
      x += xy[0]*runspeed;
      y += xy[1]*runspeed;
    }
     else {//fight
     //float[] targetLoc = { ((warrior)pos.get(index)).x,((warrior)pos.get(index)).y};
     //line(x,y,targetLoc[0],targetLoc[1]);
     
      if (((warrior)pos.get(index)).canAttack && lowDist < 5) {
      
      hp = hp - ((warrior)pos.get(index)).atk; //upddate ur hp
      ((warrior)pos.get(index)).canAttack = false;
      }
      if (canAttack) {
      ((warrior)pos.get(index)).hp -= atk; //update its hp
      canAttack = false;
      }
    }
    }
    }
    else {
      move -= 1;
      x += 10;
    }
    
    
  }
  boolean dead() {
    if (hp > 0) {
      
      return false;
    }
    if (type == 0) {
        text("win",width/2,height/2,50,50);
      }
    return true;
  }
  float distance(float x, float y, float x2, float y2) {
    return (abs((x-x2)) + abs(y-y2));
  }
}
class info {
  float endX,endY,x,y;
  float startX,startY;
   float[] xy;
   boolean done = false;
   float speed = 15;
   PImage a;
  info (float x_, float y_,float endX_, float endY_) {
    a = loadImage(("arrow.png"));
    startX = x_;
    startY = y_;
    x = x_;
    y = y_;
    endX = endX_;
    endY = endY_;
    PVector a = new PVector (x,y);
    PVector b = new PVector (endX,endY);
    PVector c = b.sub(a).normalize();
    float[] d = {c.x,c.y };
    xy = d;
  }
  void sendTo(float endX_, float endY_) {
    
    endX = endX_;
    endY = endY_;
    PVector a = new PVector (x,y);
    PVector b = new PVector (endX,endY);
    PVector c = b.sub(a).normalize();
    float[] d = {c.x,c.y };
    xy = d;
    done = false;
  }
  void update() {
    if (!(done)) {
    x += xy[0]*speed;
    y += xy[1]*speed;
    fill(250,10,0,90);
    
    
    if ( (x > endX) ) {
      done = true;
      
    }
    image(a,x,y,35,35);
    }
    
  }
  
  
}
