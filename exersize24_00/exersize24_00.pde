/*

by Caleb Briggs and Griff Boi

*/
class point2 {
  ArrayList points = new ArrayList();
  float x, y;
  int pos = 0;
  int[] poss = new int[250];
  float[] speed = new float[250];
  point2 (float x_, float y_) {
    x = x_;
    y = y_;
  }
  void connect(point2[] places) {
    for (int i = 0; places.length > i;i++) {
      if ( abs(places[i].x - x)  < 100 && abs(places[i].y - y) < 100 ) {
        points.add(places[i]);
      }
    }
  }
  void reset(point2[] places) {
    if ((int)random(20) == 1) {
    x += random(-50,50);
    y += random(-50,50);
    }
     points = new ArrayList();
    for (int i = 0; places.length > i;i++) {
      if ( abs(places[i].x - x)  < 100 && abs(places[i].y - y) < 100 ) {
        points.add(places[i]);
      }
    }
  }
  void show(float val, float val2) {
    //make arrayList ffor poses
    if ((int)random(50) == 1) {
    x += random(-5,5);
    y += random(-5,5);
    }
    for (int i = 0; points.size() > i;i++) {
      fill(0,poss[i],val,val2);
      fill(b,0,0,10);
     ((point2)points.get(i)).x += random(-5,5) / 100;
     
      if( lineCool(x,y,((point2)points.get(i)).x,((point2)points.get(i)).y,poss[i],speed[i])) {
        poss[i] = 0;
        speed[i] = random(0.01,1);
      }
      else {
        poss[i] += 1;
        speed[i] += 0.001;
      }
    }
    
    ellipse(x,y,5,5);
  }
 
}
boolean lineCool(float x, float y, float x2, float y2, int center,float speed) {
  PVector a = new PVector(x,y);
   PVector b = new PVector(x2,y2);
   b.sub(a).normalize();
   
   for (int i = center; 1+center > i; i++) {
       if ( abs(x+ (b.x*i*speed) -x2) > 1 && abs(y + (b.y*i*speed) -y2) >1) {  
         stroke(255,1);
         
         ellipse(x+ (b.x*i*speed),y + (b.y*i*speed),5,5);
       
       }
       else {
         return true;
       }
   }
   return false;
}
int size = 205;
point2[] a = new point2[size];
void setup() {
  size(800,800);
  for (int i = 0; size > i; i++) {
    a[i] = new point2(random(width), random(height));
  }
  for (int i = 0; size > i; i++) { 
    
    a[i].connect(a);
  }
  background(0);
}
float val = 100;
float val2 = 100;
float b = 0;
void draw() {
  if ((int) random(2000) == 1) {
    background(0);
    b += 50;
  for (int i = 0; size > i; i++) { 
    
    a[i].reset(a);
  }
  }
  
  val += random(-1,1);
  val2 += random(-10,10);
  for (int i = 0; size > i; i++) {
    a[i].show(val,val2);
  }
}