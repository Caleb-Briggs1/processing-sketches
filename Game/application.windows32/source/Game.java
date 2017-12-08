import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.sound.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Game extends PApplet {


 //imports processing



SoundFile file; //creates object


//int size = 5669; //Error:unneeded
ArrayList AI = new ArrayList(); //ai
//int size2 = 3510; //Error:unneeded
ArrayList team1 = new ArrayList(); //this is player
int death1, death2 = 0; //Error: unneeded
float pq = 1.25f;
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
 PImage l_;
 PImage m_;

  
public void setup() {
  float startSize = 100;
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
   l_ = loadImage("abe.png");
   m_ = loadImage("cannon.png");
  file = new SoundFile(this, "a.mp3");
  
  AI.add(new warrior( width-150, height/2,15000,.1f,1,0));
   ((warrior)AI.get(0)).range = 200;
     AI.add(new warrior( width-150-150, height/2-150,5000,.25f,1,10));
   ((warrior)AI.get(1)).range = 200;
        AI.add(new warrior( width-150-150, height/2+150,5000,.25f,1,10));
   ((warrior)AI.get(2)).range = 200;
  team1.add(new warrior( 150, height/2,15000,.1f,1,0));
   ((warrior)team1.get(0)).range = 200;
     team1.add(new warrior( 250, height/2+150,5000,.25f,1,10));
   ((warrior)team1.get(1)).range = 200;
    team1.add(new warrior( 250, height/2-150,5000,.25f,1,10));
   ((warrior)team1.get(2)).range = 200;
   
  for (int i = 0; startSize > i; i++) {
     
      AI.add( new warrior( width-random(50), random(height),15,1,1,1));
  
    
  
  }
  for (int i = 0; startSize > i; i++) {
    team1.add( new warrior( 0+random(50), random(height),15,1,1,1));
  }
   file.play();
 
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
public void draw( ){
 
  //stats
  background(255);
  if (waitTime == 0) {
    for (int i = 0; AI.size() > i; i++ ) {
          
     
          ((warrior)AI.get(i)).wind = false;
          
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
        for (int j =0; AI.size() > j; j++) {
          try {
        ((warrior)AI.get(i)).shoot(x1,x2);
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
        for (int i = 0; AI.size() > i; i++ ) {
          if (abs(( ((warrior)AI.get(i)).x-mouseX)+ abs(( ((warrior)AI.get(i)).y-mouseY))) < 150 ) {
     
          ((warrior)AI.get(i)).wind = true;
          }
          
        }
      }
    }
  }
  fill(50,50,50);
  text(str(money2),50,50);
   text(str(money1),width-50,50);
   
   if ( (AI.size() == 1 && ((warrior)AI.get(0)).hp != past) || (int)random(0,200) == 1 ) {
     if ((int)random(0,5) == 1) {
     spend = true;
     past = ((warrior)AI.get(0)).hp;
     }
   }
   if (money1 < 100) {
     spend = false;
   }
  if (spend == true) {   
  if (money1 > 50 && (int)random(3) == 1) {
    money1 -= 50;
    AI.add(new warrior(width, random(height),7,1,1,1));
  } 
    if (money1 > 300 && (int)random(2) == 1) {
    money1 -= 300;
    AI.add(new warrior(width, random(height),4,1,1,2));
    ((warrior)AI.get(AI.size()-1)).range = 40;
  }
  if (money1 > 450 && (int)random(15) == 1) {
    money1 -= 450;
    AI.add(new warrior(width, random(height),150,2,1,3));
    
  }
  if (money1 > 1500 && PApplet.parseInt(random(10)) == 1) {
    money1 -= 1500;
    AI.add(new warrior(width, random(height),100,50,.5f,5));
    ((warrior)AI.get(AI.size()-1)).range = 250;
  }
  if ((money1 > 1500) && (PApplet.parseInt(random(21)) == 1||money1>8000)) {
      money1 -= 1500;
    AI.add(new warrior(width, random(height),10,5,.5f,6));
    ((warrior)AI.get(AI.size()-1)).range = 20;
  }
   if ((money1 > 2000) && (PApplet.parseInt(random(10)) == 1||money1>8000)) {
      money1 -= 2000;
    AI.add(new warrior(width, random(height),random(500),0,random(3),9));
    
  }
  if ((money1 > 1000) && (PApplet.parseInt(random(30)) == 1)) {
      money1 -= 1000;
     
    AI.add(new warrior(width - 200 - random(100), height/2+random(-70,70),1000,5,0,7));
    
  }
  }
   
  if (money2 > 50 && key == '1' && keyPressed) {
    money2 -= 50;
    team1.add(new warrior(0, random(height),7,1,1,1));
  }
  if (money2 > 300 && key == '2' && keyPressed) {
    money2 -= 300;
    team1.add(new warrior(0, random(height),4,1,1,2));
    ((warrior)team1.get(team1.size()-1)).range = 40;
  }
  if (money2 > 450 && key == '3' && keyPressed) {
    money2 -= 450;
    team1.add(new warrior(0, random(height),150,2,1,3));
    
  }
  if (money2 > 150 && key == '4' && keyPressed) {
    money2 -= 150;
    team1.add(new warrior(width, random(height),3,1,2,1));
    
  }
  if (money2 > 1500 && key == '5' && keyPressed) {
    money2 -= 1500;
    team1.add(new warrior(0, random(height),100,50,.5f,5));
    ((warrior)team1.get(team1.size()-1)).range = 250;
  }
  if (money2 > 1500 && key == '6' && keyPressed) {
    money2 -= 1500;
    team1.add(new warrior(0, random(height),10,5,.5f,6));
    ((warrior)team1.get(team1.size()-1)).range = 20;
  }
  if (money2 > 1000 && key == '7' && keyPressed) {
    money2 -= 1000;
    team1.add(new warrior(random(100) + 200, height/2+random(-70,70),1000,5,0,7));
    ((warrior)team1.get(team1.size()-1)).range = 20;
  }
   if (money2 > 2000 && key == '8' && keyPressed) {
    money2 -= 2000;
    team1.add(new warrior(random(100) + 200, height/2+random(-70,70),125,4,0,8));
    ((warrior)team1.get(team1.size()-1)).range = 300;
  }
   if (money2 > 2000 && key == '9' && keyPressed) {
    money2 -= 2000;
    team1.add(new warrior(0, random(height),random(250),0,random(0.5f,3),9));
    
  }
  // if (money2 > 2000 && key == '9' && keyPressed) {
   // money2 -= 2000;
   // team1.add(new warrior(0, random(height),300,0,1,10)); 
 // }
   

  
  //AI.add(new warrior(random(width/2,width), random(height),15,3));
  play();
}



public void play() {
  if ((int)random(0,2) == 1){
  money1 += 5;
  money2 += 5;
  }
  for (int i = 0; AI.size() > i; i++) {
     
    ((warrior)AI.get(i)).update(team1,1);
    
  }
   for (int i = 0; team1.size() > i; i++) {
     
    ((warrior)team1.get(i)).update(AI,2);
  }
  
  for (int i = 0; team1.size() > i; i++) { //upddate dead
    
     if ( ((warrior)team1.get(i)).dead()) {
        float[] mon = {50/pq,300/pq,450/pq,300/pq,1500/pq,1500/pq,1000/pq,2000/pq,2000/pq,5000/pq};
       if (((warrior)team1.get(i)).type-1 == -1) {
         exit();
       }
       money1 += mon[((warrior)team1.get(i)).type-1];
       team1.remove(i);
     }
   
  }
  for (int i = 0; AI.size() > i; i++) {
     if ( ((warrior)AI.get(i)).dead()) {
       float[] mon = {50/pq,300/pq,450/pq,300/pq,1500/pq,1500/pq,1000/pq,2000/pq,2000/pq,5000/pq};
       
       money2 += mon[((warrior)AI.get(i)).type-1];
       
       
       AI.remove(i);
       
       
     }
  }
}
public float[] getXY(float x, float y, float x2, float y2) {
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
  public void shoot(float x_, float y_) {
    if (abs((x-x_)+ abs((y-y_))) < 150 ) {
      hp -= 30;
      
     
    }
  }
  public void update(ArrayList pos,int type2) {
    
    canAttack = true;
    if (type == 0) {
      
      noTint();
      fill(hp/4,0,0);
      rect(x,y,hp/500,10);
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
      if (type == 7) {
        image(k_,x,y,25,25);
      }
      
      if (type == 8 && type2 == 2) {
        image(m_,x,y,55,55);
      }
       if (type == 9 && type2 == 2) {
        image(l_,x,y,35,35);
      }
      if (type == 9 && type2 == 1) {
        image(l_,x,y,35,35);
      }
      if (type == 10) {
      
      noTint();
      fill(hp/4,0,0);

       image(h_,x,y,55,55);
    }
    //for now it will just point to middle
    
    
    //print(pos);
    if (move == 0) {
    float lowDist = 0;
    if (AI.size() == 0) {
         money1 = 10000;
         AI.add( new warrior( width-random(50), random(height),15,1,1,1));
       }
      if (team1.size() == 0) {
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
    if (type == 10) {
      
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
          
          team1.add( new warrior( x, y,15,1,1,1));
          
        }
        if (type2 == 1) {
          
          AI.add( new warrior( x, y,15,1,1,1));
          
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
    if (type == 8) {
      hp-=.25f;
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
    if (type == 9) {
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
    if (((warrior)pos.get(index)).canAttack && lowDist < 5) {
      
      hp = hp - ((warrior)pos.get(index)).atk; //upddate ur hp
      ((warrior)pos.get(index)).canAttack = false;
      }
      if (type2 == 2 && ((warrior)pos.get(index)).type != 0 && ((warrior)pos.get(index)).type != 9 && ((warrior)pos.get(index)).type != 10) {
        team1.add(new warrior(((warrior)pos.get(index)).x,((warrior)pos.get(index)).y, ((warrior)pos.get(index)).hp,((warrior)pos.get(index)).atk,((warrior)pos.get(index)).runspeed,((warrior)pos.get(index)).type));
        ((warrior)team1.get(team1.size()-1)).range =((warrior)pos.get(index)).range;
        AI.remove(index);
        //team1.add(new warrior();
      }
      if (type2 == 1 && ((warrior)pos.get(index)).type != 0 && ((warrior)pos.get(index)).type != 9 && ((warrior)pos.get(index)).type != 10) {
        AI.add(new warrior(((warrior)pos.get(index)).x,((warrior)pos.get(index)).y, ((warrior)pos.get(index)).hp,((warrior)pos.get(index)).atk,((warrior)pos.get(index)).runspeed,((warrior)pos.get(index)).type));
        ((warrior)AI.get(AI.size()-1)).range =((warrior)pos.get(index)).range;
        team1.remove(index);
        //team1.add(new warrior();
      }
    }
    }
    }
    else {
      move -= 1;
      x += 10;
    }
    
    
  }
  public boolean dead() {
    if (hp > 0) {
      
      return false;
    }
    if (type == 0) {
        text("win",width/2,height/2,50,50);
      }
    return true;
  }
  public float distance(float x, float y, float x2, float y2) {
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
  public void sendTo(float endX_, float endY_) {
    
    endX = endX_;
    endY = endY_;
    PVector a = new PVector (x,y);
    PVector b = new PVector (endX,endY);
    PVector c = b.sub(a).normalize();
    float[] d = {c.x,c.y };
    xy = d;
    done = false;
  }
  public void update() {
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
  public void settings() {  fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Game" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
