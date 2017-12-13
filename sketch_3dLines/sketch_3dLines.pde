class point2 {
  ArrayList points = new ArrayList();
  float x, y,z;
  int pos = 0;
  int[] poss = new int[size];
  float[] speed = new float[size];
  point2 (float x_, float y_,float z_) {
    x = x_;
    y = y_;
    z = z_;
  }
  void connect(point2[] places) {
    for (int i = 0; places.length > i;i++) {
      if ( abs(places[i].x - x)  < 200 && abs(places[i].y - y) < 200  ) {
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
    
    for (int i = 0; points.size() > i;i++) {
      
      
     //((point2)points.get(i)).x += random(-5,5) / 100;
    stroke(i*50,250-i*50,10);
       line(x,y,z,((point2)points.get(i)).x,((point2)points.get(i)).y,((point2)points.get(i)).z); 
      pushMatrix();
    translate(x,y,z);   
    box(5);
    popMatrix();
    
  }
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
int size = 105;
point2[] a = new point2[size];
void setup() {
  size(800,800,P3D);
  for (int i = 0; size > i; i++) {
    a[i] = new point2(random(width*2), random(height*2),random(-200,200));
  }
  for (int i = 0; size > i; i++) { 
    
    a[i].connect(a);
  }
  background(0);
}
float val = 100;
float val2 = 100;
float b = 0;
float r = 0;
float y = 0;
float z = 1;
float siz = 1;
void draw() {
  
 translate(width/2-r,height/2-y,siz);
  rotateX(radians(mouseY));
   rotateY(radians(mouseX));
   rotateZ(radians(z));
   if (mousePressed) {
     siz += 5;
   }
   if (keyCode == RIGHT) {
     r+=1;
   }
   if (keyCode == LEFT) {
     r-=1;
   }
   if (keyCode == UP) {
     y-=1;
   }
   if (keyCode == DOWN) {
     y+=1;
   }
   if (key == ' ' && keyPressed) {
     z++;
   }
    background(255);
 
 
  
  
  val += random(-1,1);
  val2 += random(-10,10);
  for (int i = 0; size > i; i++) {
    a[i].show(val,val2);
  }
}