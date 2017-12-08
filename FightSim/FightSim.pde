int size = 5669; //red
ArrayList fit = new ArrayList();
int size2 = 3510; //green
ArrayList fit2 = new ArrayList();
int death1, death2 = 0;
void setup() {
  size(1000,1000);
  for (int i = 0; size > i; i++) {
    if ((int)random(0,3) != 1) {
      fit.add( new warrior( random(width/1.2,width), random(height),2005,47,3.2,1));
    }
    else {
    fit.add( new warrior(random(width/2), random(height),2505,47,3.2,1));
  }
  }
  for (int i = 0; size2 > i; i++) {
    if ((int)random(0,2) == 1) {
      
      fit2.add(new warrior(random(width/2,width/1.3), random(height),205,100,5,1));
   }
   else {
      
    fit2.add(new warrior(random(width/2,width/1.3), random(height-200),1,325,2,2));
    ((warrior)fit2.get(i)).range = random(10,50);
    }
  }
 
}

void draw( ){
  //stats
  println("death team1:" + str(death1) + "\t death team2:" + str(death2));
  background(255);
  //fit.add(new warrior(random(width/2,width), random(height),15,3));
  play();
}



void play() {
  
  for (int i = 0; fit.size() > i; i++) {
     
    ((warrior)fit.get(i)).update(fit2,1);
    
  }
   for (int i = 0; fit2.size() > i; i++) {
     
    ((warrior)fit2.get(i)).update(fit,2);
  }
  
  for (int i = 0; fit2.size() > i; i++) { //upddate dead
    
     if ( ((warrior)fit2.get(i)).dead()) {
       death2 ++;
       fit2.remove(i);
     }
   
  }
  for (int i = 0; fit.size() > i; i++) {
     if ( ((warrior)fit.get(i)).dead()) {
       death1 ++;
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
  warrior (float x_, float y_, float hp_, float atk_, float runspeed_, int type_) {

    runspeed = runspeed_;
    x = x_;
    y = y_;
    hp = hp_;
    atk = atk_;
    type = type_;
  }
  void update(ArrayList pos,int type2) {
    canAttack = true;
    if (type2 == 1) {
      fill(250,00,00,150);
    }
    if (type2 == 2) {
      fill(0,250,250*(type-1),150);
    }
    //for now it will just point to middle
    rect(x,y,5,5);
    //print(pos);
    float lowDist = 0;
    
    lowDist = distance(x,y,((warrior)pos.get(0)).x,((warrior)pos.get(0)).y);
    
   
    int index = 0;
    for (int i = 0; pos.size() > i; i++) {
      float dist = random(21) + distance(x,y,((warrior)pos.get(i)).x,((warrior)pos.get(i)).y);
      if (dist < lowDist && dist != 0) {
        lowDist =dist;
        index = i;
      }
    }
    if (type == 1) {
    if ( (!(lowDist < 5)))  { 
    float[] targetLoc = { ((warrior)pos.get(index)).x,((warrior)pos.get(index)).y};
    float[] xy = getXY(x,y,targetLoc[0],targetLoc[1]);
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
      canAttack = false;
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
    if ( (!(lowDist > range/5)))  { //if very close
    float[] targetLoc = { ((warrior)pos.get(index)).x,((warrior)pos.get(index)).y};
    float[] xy = getXY(x,y,targetLoc[0],targetLoc[1]);
    x -= xy[0]*runspeed/2;
    y -= xy[1]*runspeed/2;
    }
   
  }
  boolean dead() {
    if (hp > 0) {
      return false;
    }
    return true;
  }
  float distance(float x, float y, float x2, float y2) {
    return (abs((x-x2)) + abs(y-y2));
  }
}