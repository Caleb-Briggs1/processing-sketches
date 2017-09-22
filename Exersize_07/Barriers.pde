/*
  Caleb Briggs
  Created Sempt. 22
  Project: Genetic algorithm, different particles learn to jump better
  284 lines long

*/
int size = 1000;

Object[] TEST = new Object[size];

int x =0;
int y = 0;
Pos Test = new Pos();
void setup() {
size (1600,400);
rectMode(CENTER);
Test.setPos(  CreateBarriers(0,0));
for(int i = 0; size >i;i++) {
TEST[i] = new Object();
TEST[i].setBarriers(Test);
TEST[i].init(random(10),40,1,150);
}
Test.DrawRect();
}

void draw() {
  boolean AllDead = true;
  background(255);
  float[] FitnessList = {};
  float totalFit = 0;
  Test.DrawRect();
  for (int i = 0; size > i; i++) {
    TEST[i].moveUntilDead();
  }
  for (int i = 0; size > i; i++) {
   FitnessList =  append(FitnessList, TEST[i].fitness());
   totalFit += TEST[i].fitness();
    
    if (TEST[i].isDead() == false) {
      AllDead = false;
    }
  }
  
  if (AllDead == true) {
    println(totalFit/size);
    
    FitnessList = sort(FitnessList);
    ArrayList Best = new ArrayList();
    for (int i = 0; size > i; i++) { //get best 50 (eg destory worst 450)
    if ( (TEST[i].returnAlg(FitnessList[size-200])).get(0) != "not") { //THESE VALS NEED TO CHANGE WITH SIZE
      Best.add((TEST[i].returnAlg(FitnessList[size-200]))); //add the alg of the best
    }
    }
    for (int i = 0; size > i; i++) {
    TEST[i].ReplaceAlg(FitnessList[size/2],(ArrayList) Best.get((int)random(0,Best.size()))); //kills worst 150
    }
   
  }
  frameRate(1000);
  
  
}


//Delete above once testing is finished 
//181 + 67 + 36 lines of code