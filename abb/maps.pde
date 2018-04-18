
class map {//class to draw the background, **not essential to know for the game** (except for the food functions)
 float[][] walls = new float[int(random(190)) ][4]; //creates random up to 90 walls
 ArrayList<bacteria> food = new ArrayList(); //start list of bacteria, called food
 ArrayList<carnivore> carniv = new ArrayList();
 
 
 void generateMap() { //draws walls
   
   
    noStroke();
    fill(250,0,0,50);
    for (int j = 0; walls.length > j; j++) {
      
      rect(walls[j][0],walls[j][1],walls[j][2],walls[j][3]);
    }
    
 }
 void light() { //draws light
     float maxDist = dist(width/2,height/2,0,0);
      noStroke();
    for (int i = 0; width*height/32  > i; i++) {
      int x = (i*32%width) ;
      int y = (int(i*32)/int(width) ) ;
      
      float tint = (dist(x,y,width/2,height/2) /maxDist )*40 ;//percentage of height
    
    
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
  void initCarniv() {
    for (int i = 0; 30 > i; i++) {
    carniv.add(new carnivore(random(width),random(height)));
    carniv.get(i).energy = 69;
  }
  }
  
  void initFood() {//creates food
    //for each item, create food based on light
     float maxDist = dist(width/2,height/2,0,0); // amount of light max
     
    for (int i = 0; (width*height) > i; i++){
     float x = i % width;
     float y = int((i)) /int( width);
     
      if ( int(random(0,pow( (dist(x,y,width/2,height/2) /maxDist )*35 + 2.5,4.0))) == 0) { //Calculation of light
        
        food.add(new bacteria(x,y));
        
      }
    }
  }
  void showCarniv() {
    int offset = 0;
    for (int i = 0; carniv.size()-offset > i; i++) {
      carnivore cur = carniv.get(i);
    
    cur.update(this);
    //println(cur.move.x);
   if (cur.energy > cur.repro && cur.wait == 0) {
    
    carniv.add(new carnivore(cur.x,cur.y,cur.size,cur.val,cur.reproSize,cur.repro));
    cur.wait = 5;
    
    cur.energy -= cur.reproSize;
  }
  if (cur.energy <= 0) {
    offset++;
    carniv.remove(i);
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
        cur.energy = 10;
      }
      if (cur.energy < 0) {
        food.remove(i);
        offset ++;
      }
     
    }
  }
  void INIT() {
    
    this.makeWalls();
    this.initFood();
    //this.initCarniv();
  }
  void RUN() {
    this.generateMap();
    noStroke();
    fill(0,250,0);
    this.showFood();
    //this.showCarniv();
    //this.light();
    
   
    
  }
   void eatan2(carnivore carniv) {
    for (int i = 0; food.size() > i; i++) { //eating the food
      bacteria cur = food.get(i);
      if (dist(carniv.x,carniv.y,cur.x,cur.y) <carniv.size/2) { //bacteria is considered to be 0 pixels large
        food.get(i).energy -= 1;
        carniv.energy += 1;
      }
    }
  }
  void eatan(character Char) { //*important*
   
    for (int i = 0; food.size() > i; i++) { //eating the food
      bacteria cur = food.get(i);
      if (dist(Char.x,Char.y,cur.x,cur.y) < Char.size/2) { //bacteria is considered to be 0 pixels large
        cur.energy -= Char.eatSpeed;
        Char.energy += Char.eatSpeed;
      }
    }
    
     for (int i = 0; carniv.size() > i; i++) { //eating the carniv
      carnivore cur = carniv.get(i);
      if (dist(Char.x,Char.y,cur.x,cur.y) < Char.size/2 + cur.size/2) { 
        cur.energy -= 15;
        Char.energy -= 5;
        
        if (cur.energy < 0) {
          Char.energy += 15;
        }
        
      }
    }
  }
  ArrayList<ArrayList<float[]>> infoSight(character cha) { //calculation of info for seeing
    float x = cha.x; 
    float y = cha.y;
    float size1 = cha.sightX/2; 
    float size2 = cha.sightY/2;
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
    ArrayList<float[]> carnivo = new ArrayList();
    for (int k = 0; carniv.size() > k; k++) {
      carnivore cur = carniv.get(k);
      float[] val = {cur.x,cur.y,cur.move.x,cur.move.y,cur.energy};
      carnivo.add(val);
      
    }
    info.add(carnivo);
    return info;
  }
  void evolve(character Char, int choi) { //choices for evolving, not finished
    float[] evolveData = { 100,1600,2250,4250,5500,9999999999999999L}; //energy required + max energy
    if (Char.evolveReady()) {
      if (Char.evolve == 0) {
        if (choi == 0) {
          Char.maxSpeed *= 1.5;
          Char.colo = 150;
        }
        if (choi == 1) {
          Char.size *= 4;
        }
       
      }
          if (Char.evolve == 1) {
            if (choi == 0) {
              Char.seeAblity *= 2;
              
            }
           if (choi == 1) {
             Char.moveEffec *= 2;
              Char.waitEffec *= 1.5;
           }
           if (choi == 2) {
             Char.maxSpeed *= 2;
              
           }
           
            } 
                  if (Char.evolve == 2) {
                  if (choi == 0) {
                    Char.seeAblity *= 3;
                    Char.maxSpeed *= 3;
                    Char.eatSpeed *= 2;
                    
                  }
                 if (choi == 1) {
                   //not done yet
                 }
                 if (choi == 2) {
                   //not done yet
                    
                 }
                 
                  }
         Char.energy /= 4.1;
        Char.evolve ++;
        println("energy needed",evolveData[Char.evolve]);
        Char.maxEnergy = evolveData[Char.evolve];
  }
}
}