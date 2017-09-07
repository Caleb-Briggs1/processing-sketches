
class B {
  int x = 500;
  int y = 500;
  int y2 = 1000;
   int x2 = 1000;
  void update(int color1,int color2,int color3) {
    fill(random(color1),random(color2),random(color3),10);
    noStroke();
    int Z = int(random(5));
    println(Z);
    if(Z == 1) {
      if (x2>x) {
      x=x+10;
      }
      
    }
    if(Z == 2) {
      if (y2>y) {
      y=y+10;
      }
      
    }
    if(Z == 3) {
      if (0<x) {
      x=x-10;
      }
      
    }
    if(Z == 4) {
      if (0<y) {
      y=y-10;
      }
      
    }
    
    rect(x,y,10,10); 
  }
}
B C = new B();
B D = new B();
B E = new B();
B F = new B();
B G = new B();
void setup() {
size(1000,1000);

}
void draw() {
  frameRate(1000);
    
    C.update(20,250,20);
    D.update(20,20,250);
    E.update(250,20,20);
   // F.update(250,250,250);
    //G.update(0,0,0);
} 
 