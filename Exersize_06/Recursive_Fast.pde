//


void setup() {
    size(900,900);
   // drawing(000,000,random(412),(int) random(8));
   drawing(000,000,156,(int) 6);
   
}
int i = 0;
void draw() {
  
   
     //delay(10);
     
    

}

void drawing(float X, float Y,  float leng, int times) {
 
  
  stroke(leng*10,0,0);
  float X2 = random(X,X+leng);
  float Y2 = random(Y, Y +leng);
  line(X,Y,X2,Y2);
  
  
  if (leng > 1) {
    for(int i = 0; times > i; i++ ) {
      
      //println(leng);
    drawing(X2,Y2,leng/2,times);
    }
  }
  
}