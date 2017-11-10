int[][] points = {{(int)random(600),(int)random(600)}};

float hi = 5;
float wide = 5;
int flip = 1;
int i = 0;
void setup() {
  
  background(255);
  size(600,600);
    
}
int[] val = {(int)random(600),(int)random(600)};
int[] val2 = {(int)random(600),(int)random(600)};
void draw() {
  delay(50);
  if((int)random(0,35) == 1){
  
  
     background(0);
  }
  int[][] rand = {val,val2};
    points = rand;
    i = 0;
    int[] first;
    int[] second;
     if (flip == 1){
       first = points[i*2];
       second = points[i*2+1];
     }
     else {
       /*
       second = points[i*2];
       first = points[i*2+1];
       */
       second = points[i*2];
       first = points[i*2+1];
       
     }
       for (int k = 0; 65 > k; k++) {
         print(i);
          hi = random(-105,105);
          
          wide = random(-105,105);
          stroke(second[0],second[1],first[0],150);
          fill(first[0],first[1],second[0],10);
         beginShape();
         vertex(first[0],first[1]);
        bezierVertex( avg(first[0],second[0]), first[1]+hi,first[0], first[1], second[0], second[1] );
        endShape();
       }
    flip *= -1;
     val = val2;
     int[] val3 = {(int)random(600),(int)random(600)};
     val2 = val3;
      
     
  }
  
  //noFill();
  
  

float avg(float val1,float val2){
 return (val1+ val2)/2;
}