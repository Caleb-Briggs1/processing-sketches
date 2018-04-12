
class map {//class to draw the background, **not essential to know for the game** (except for the food functions)
 float[][] walls = new float[int(random(90)) ][4]; //creates random up to 90 walls
 ArrayList<bacteria> food = new ArrayList(); //start list of bacteria, called food
 PImage images;//really just one image, needs to be loaded in setup
 void init() {
   //images = loadImage("m_sand.png"); //loads image
 }
 void generateMap() { //draws walls
   
   //image(images,0,0,576,576);
    
    for (int j = 0; walls.length > j; j++) {
      noStroke();
      fill(250,0,0,50);
      rect(walls[j][0],walls[j][1],walls[j][2],walls[j][3]);
    }
    
 }
 void light() { //draws light
     float maxDist = dist(width/2,height/2,0,0);
     
    for (int i = 0; width*height/32  > i; i++) {
      int x = (i*32%width) ;
      int y = (int(i*32)/int(width) ) ;
      
      float tint = (dist(x,y,width/2,height/2) /maxDist )*40 ;//percentage of height
    
     noStroke();
     fill(0,0,0,tint);

     rect(x,y,32,32);
    
     
    }
   
      
   
 }
 
  
  void makeWalls() { // Algorithm to make walls
    
    for (int i = 0;walls.length > i; i++) {
      float[] val = {random(width),random(height),random(5,25),random(5,25)};
      walls[i] = val;
    }
  }
  void initFood() {//creates food
    //for each item, create food based on light
      float maxDist = dist(width/2,height/2,0,0); // amount of light max
    for (int i = 0; (width*height)/32.0 > i; i++){
     float x = i*32 % width;
     float y = int((i*32)) /int( width);
     fill(250,0,0);
      if ( int(random(0,pow( (dist(x,y,width/2,height/2) /maxDist )*35,2.0))) == 0) { //Calculation of light
        
        food.add(new bacteria(x,y));
        
      }
    }
  }
  void showFood() { //how food is updated
    int offset = 0;
    for (int i = 0; food.size()-offset > i; i++) {
      bacteria cur = food.get(i);
      cur.update();
      if (cur.reproduce()) { //if ready to reproduce, release spore nearby
        food.add( new bacteria(food.get(i).x,cur.y));
        food.get(food.size() -1).acel = new PVector(random(-2,2),random(-2,2));
        cur.energy = 20;
      }
      if (cur.energy < 0) {
        food.remove(i);
        offset ++;
      }
     
    }
  }
  void INIT() {
    this.init();
    this.makeWalls();
    this.initFood();
  }
  void RUN() {
    this.generateMap();
    noStroke();
    fill(0,250,0);
    this.showFood();
    this.light();
   
    
  }
  void eatan(character Char) { //*important*
   
    for (int i = 0; food.size() > i; i++) { //eating the food
      bacteria cur = food.get(i);
      if (dist(Char.x,Char.y,cur.x,cur.y) < Char.size/2) { //bacteria is considered to be 0 pixels large
        food.get(i).energy -= 10;
        Char.energy += 10;
      }
    }
  }
  ArrayList<ArrayList<float[]>> infoSight(character cha) { //calculation of info for seeing
    float x = cha.x; 
    float y = cha.y;
    int size1 = cha.sightX/2; 
    int size2 = cha.sightY/2;
    ArrayList<ArrayList<float[]>> info = new ArrayList(); //ArrayList of float[]
     ArrayList<float[]> infoTemp = new ArrayList();
    for (int i =0; food.size() > i; i++){
      bacteria cur = food.get(i);
     
      if ( abs(x - cur.x) < size1 && abs(y-cur.y) < size2) {
        float[] b= {cur.x,cur.y,cur.energy}; // *form of info*  = x,y,energy  
        infoTemp.add(b);
      }
    }
    info.add(infoTemp);
    infoTemp = new ArrayList();
    for (int j = 0; walls.length > j; j++) {
      infoTemp.add(walls[j]);
    }
    info.add(infoTemp);
    return info;
  }
  void evolve(character Char, int choi) { //choices for evolving, not finished
    float[] evolveData = { 100,200,250,250,500}; //energy required + max energy
    if (Char.energy >= evolveData[Char.evolve]-1) {
      if (Char.evolve == 0) {
        if (choi == 0) {
          Char.maxSpeed *= 2;
        }
        if (choi == 1) {
          Char.size *= 2;
        }
        Char.energy = 50;
        Char.evolve ++;
        Char.maxEnergy = evolveData[Char.evolve];
      }
    }
  }
}
class bacteria { //class for bacteria
  float energy = 5;
  float x ;
  float y;
  int maxEnergy = 150;
  PVector acel = new PVector(0,0);
  bacteria(float x_, float y_) {
    x= x_;
    y = y_;
  }
  void update() {
    x += acel.x;
    y += acel.y;
    acel = acel.mult(.95); //slow down, friction amount
    energy += .5 - dist(x,y,width/2,height/2)/ (dist(0,0,width/2,height)); //grows in proportion to the light it has
    energy -= 0.1;//loses some energy by default 
    
  
    ellipse(x,y,energy/20,energy/20);
    if (energy > maxEnergy) {
      energy = maxEnergy;
     
    }
  }
  
  boolean reproduce() {
    if (energy == maxEnergy) {
      return true;
    }
    return false;
  }
  
}


class character {
  float x;
  float y;
  float size;
  float energy = 95;
  float maxEnergy = 100;
  int sightX = 155;
  int sightY = 155;
  int evolve = 0;
  float maxSpeed = 1;
  
  character (float x_, float y_, float size_) {
    x = x_;
    y = y_;
    size = size_;
  }
  void view() {
    sightX = int(120 - (dist(x,y,width/2,height/2)/(dist(0,0,width/2,height))  * 150) );
    
    sightY = sightX;
  }
  boolean evolveReady() {
    if (energy > maxEnergy) {
      return true;
    }
    return false;
  }
  void run() {
     rectMode(CENTER);
    noFill();
    stroke(0);
    rect(x,y,sightX,sightY);
     fill(0,energy*2.5,0);
     rectMode(CORNER);
    ellipse(x,y,size,size);
    energy -= 0.1;

    if (energy > maxEnergy) {
      energy = maxEnergy;
      
    }
    
    
  }
  boolean hit(map Map, float x, float y) {
    float[][] walls = Map.walls;
    for (int i = 0; walls.length > i; i++) {
        if ( abs(x-walls[i][0]) < size/2 + walls[i][2]/2 && abs(y-walls[i][1]) < size/2 + walls[i][3]/2) {
          return true;
        }
    }
    return false;
  }
  void move(map Map ,float ang, float speed_) {
    
     if (! hit(Map,x + sin(ang) * speed_, y + cos(ang) * speed_) && speed_ <= maxSpeed) {
     x += sin(ang) * speed_;
     y += cos(ang) * speed_;
     energy -= sqrt(speed_)/2;
     }
  }
  
}

map b= new map();
You tst ;

void setup() {
  size(576,576);
  b.INIT();
  tst = new You();


}
void draw() {
  background(255);
   
   b.RUN();
    tst.run(b);

   stroke(0,250,250);
   
   
   
 
}
