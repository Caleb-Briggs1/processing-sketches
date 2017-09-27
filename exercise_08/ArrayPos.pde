//create a for each item, make rect at x-scrollX,y-scrollY,size,size
//make an update Barrier posiont, that checks if each item is a koopa, and if it is, it will move a perscribeda mount,
//create collision finder, to check if something has hit any of the rectangles, and return the position of where it hit
//to make to scrool, recreate so that all metions of x are now null. Each move till dead will change scroll(globalvar) by 1, and then once all are dead reset, 
//barriers printed x - scroll, rect printed startX -scroll, rework collision system to reflect this
//y should not be changed
class Object {
  float x; 
  float y;
  int size;
  float startX;
  float startY;
  Pos Barriers;
  int lowerBound;
  float gravity;
  ArrayList Alg;
  float Fitness;
  void mutate() {
    if (int(random(0,15)) == 0) { //chance to mutate
     
      for (int i = 0; Alg.size() > i; i++) {
        if ( (int) random(0,10) == 0) {
          ArrayList temp = new ArrayList();
         // temp.add(    (int)random(0,5) );
         temp.add( (int)((ArrayList) Alg.get(i) ).get(0) + (int) random(-2,2)  );
          temp.add( (float)((ArrayList) Alg.get(i) ).get(1) + random(-2,2)  );
          //temp.add(random(-11,-1));
          Alg.set(i,temp);
        }
      }
    }
    //take alg, and then change the value by a large random val
  }
  void init(float X, float Y, int Size,int LowerBound) {
    startX = X;
    startY = Y;
    x = X;
    y = Y;
    size = Size;
    lowerBound = LowerBound;
    Alg = GenerateAlg(50); //THIS NEEDS TO BE CHANGED
  }
  ArrayList returnAlg(float Threshold) {
    if(Fitness > Threshold) {
    return Alg;
  }
  ArrayList temp = new ArrayList();
  temp.add("not");
  return temp;
  }
  void ReplaceAlg(float Threshold, ArrayList Alg) { //if fitness is under threshold, then change formula / breed
  if(Fitness < Threshold) {
    //make this breeding rather than random
    if ((int) random(0,2) == 0) {
   GenerateAlg(50);
    
    }
    else {
       Combine(Alg); 
    }
    
  }
  mutate();
   y = startY;
      x =startX ;
  }
  void moveUntilDead() {
    int counter = 0;
    int currentWait = (int) ((ArrayList)Alg.get(0)).get(0);
    if(y < lowerBound) {
      rect(x,y,size,size); //REMOVE THIS AT SOMEPOINT
      
      x = x + 1;
      y+= gravity;
      if(this.checkCollision()) {
        gravity = 0;
        if (currentWait <= 0) {
        gravity = (float) ((ArrayList)Alg.get(counter)).get(1);
        counter +=1;
        currentWait = (int) ((ArrayList)Alg.get(counter)).get(0);
        }
        currentWait -=1;
        
        //has collided so should set grav to zero 
      }
      gravity +=0.3;
    }
    Fitness = x;
    
   
    
  }
  boolean isDead() {
    if (lowerBound < y) {
      return true;
    }
    return false;
  }
  float fitness() {
    return Fitness;
  }
 
  void setBarriers(Pos Object) {
    Barriers = Object;
  }
  boolean checkCollision() { //pass barrier objec to this function
     for (int i = 0; Barriers.getPos().size() > i; i++) {
      float[] CurrentCounter = (float[]) Barriers.getPos().get(i);
      if(within(CurrentCounter[0] ,x,CurrentCounter[5] + size/2   ) && within(CurrentCounter[1],y,CurrentCounter[2] + size/2  )) {
        //if CurrentCounter[5] == "RED" {y = 1 + yBoundry} //eg kill                                      
        return true;
      }
    }
    return false;
     //check within for size of item  
  }
  ArrayList GenerateAlg(float len) {
   //[waitTime,JumpHeight]
    ArrayList res = new ArrayList();
    for (int i =0; len > i; i++) {
      ArrayList temp = new ArrayList();
      temp.add((int)random(0,5));
      temp.add((float)random(-10,-1));
      res.add(temp);
    }
    return res;
    //to change should keep counter of which one it is currently on,
    //destroy the one before counter, counter, and after
  }
  void Combine(ArrayList second) {
    ArrayList res = new ArrayList();
    
    for (int i = 0; second.size() >i;i++) {
      ArrayList temp = new ArrayList();
      int waitAv = (((int)(( (ArrayList) Alg.get(i)).get(0))) + (int)(((ArrayList) second.get(i)).get(0)))/2 ; //grabs wait of both, adds em, averages
      float gravAv = (((float)(( (ArrayList) Alg.get(i)).get(1))) + (float)(((ArrayList) second.get(i)).get(1)))/2 ;
      temp.add(waitAv);
      temp.add(gravAv);
      res.add(temp);
    }
    Alg = res;
  }
  
  
}

class Pos { //has a list of rects
  //form [x,y,size,scrollX,scrollY] 
  ArrayList positions = new ArrayList();
  void setPos(ArrayList New) { 
    positions = New;
    
  }
  ArrayList getPos() {
    return positions;
  }
  void printFull() {
    println(positions);
    for (int i = 0; positions.size() > i; i++) {
       
        println(positions.get(i));
       
      
    }
  }
  float Get(int x,int y) {
    float[] temp = (float[]) positions.get(x);
    return temp[y];
  }
  void Add(float vals0,float vals1,float vals2, float vals3, float vals4,float vals5) { //vals 5 is size2, eg length   //add val6, which is a number that represents type
      float[] temp = {vals0,vals1,vals2,vals3,vals4,vals5};
      positions.add(temp);
  }
  void DrawRect() {
    for (int i = 0; Test.getPos().size() > i; i++) {
      rect(Test.Get(i,0),Test.Get(i,1),Test.Get(i,5),Test.Get(i,2));
    }
  }
  
  
}