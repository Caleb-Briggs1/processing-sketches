ArrayList pos;
void setup() {
  size(900,900,P3D);
 rectMode(CENTER);



  
}
float x = 1;
float y = 1;
float r = 0;
float y2 = 0;
float siz = 1;
void draw() {
   translate(width/2-r,height/2-y2,siz);
   if (mousePressed) {
     siz += 5;
   }
   if (key == ' ') {
     siz -= 5;
   }
 if (keyCode == RIGHT) {
     r+=10;
   }
   if (keyCode == LEFT) {
     r-=10;
   }
   if (keyCode == UP) {
     y2-=10;
   }
   if (keyCode == DOWN) {
     y2+=10;
   }
  background(255);
  y+=frameCount/9.7;
  //noStroke();
// translate(-y,-y);
 
 x*=1.01;
 translate(width/2,height/2);
  rotateX(radians(mouseY));
  rotateY(radians(mouseX));
 //print((ArrayList)pos2.get(0));
 //scale(x);
translate(0,0,555);
  
  
    pos = centerSqr(0,0,height/3.2);
  ArrayList posTemp = new ArrayList();
  for (int i = 0; pos.size() > i;i++) {
    float[] val = ((float[])pos.get(i));
   // print(pos.size());
    fill(0,35);
    posTemp.add(centerSqr(val[0]-val[2],val[1]-val[2],(val[2]) ));
 }
  for (int i = 0; 1 > i;i++) {
  posTemp = generate(posTemp);
  }
  

  rotateX(radians(90));
 
  
    pos = centerSqr(0,0,height/3.2);
  posTemp = new ArrayList();
  for (int i = 0; pos.size() > i;i++) {
    float[] val = ((float[])pos.get(i));
   // print(pos.size());
    fill(0,35);
    posTemp.add(centerSqr(val[0]-val[2],val[1]-val[2],(val[2]) ));
 }
  for (int i = 0; 1 > i;i++) {
  posTemp = generate(posTemp);
  }
  translate(100,0,0);
  rotateY(radians(90));

  
    pos = centerSqr(0,0,height/3.2);
  posTemp = new ArrayList();
  for (int i = 0; pos.size() > i;i++) {
    float[] val = ((float[])pos.get(i));
   // print(pos.size());
    fill(0,35);
    posTemp.add(centerSqr(val[0]-val[2],val[1]-val[2],(val[2]) ));
 }
  for (int i = 0; 1 > i;i++) {
  posTemp = generate(posTemp);
  }
  translate(00,000,750);
  

  
    pos = centerSqr(0,0,height/3.2);
  posTemp = new ArrayList();
  for (int i = 0; pos.size() > i;i++) {
    float[] val = ((float[])pos.get(i));
   // print(pos.size());
    fill(0,35);
    posTemp.add(centerSqr(val[0]-val[2],val[1]-val[2],(val[2]) ));
 }
  for (int i = 0; 1 > i;i++) {
  posTemp = generate(posTemp);
  }
  rotateX(radians(180));
  rotateY(radians(90));
   translate(-700,-700-50,800);
  
   
  
    pos = centerSqr(0,0,height/3.2);
  posTemp = new ArrayList();
  for (int i = 0; pos.size() > i;i++) {
    float[] val = ((float[])pos.get(i));
   // print(pos.size());
    fill(0,35);
    posTemp.add(centerSqr(val[0]-val[2],val[1]-val[2],(val[2]) ));
 }
  for (int i = 0; 1 > i;i++) {
  posTemp = generate(posTemp);
  }
  //noLoop();
 
 
 
 
 
 
}
//float[][] 
void centerSqrs(float x, float y_, float size) {
  
  float y = y_;
 for (int i =0 ; 9> i; i++) {
 if (i %3 == 0 && i != 0) {
   y+=size;
 }
  if(i !=4) { 
  centerSqr( (i%3)*size + x ,y,size/3);
  }
  
  
  
 }
}
ArrayList generate(ArrayList list) {
  ArrayList res = new ArrayList();
   for (int i = 0; list.size() > i;i++) {
   for (int j = 0; ( (ArrayList)list.get(i)).size() > j; j++) {
     float[] val = ( (float[])((ArrayList)list.get(i)).get(j)) ;
     // print(pos.size());
    
    
    fill( random(0,50)+i*40,j*45 + random(-10,10),res.size()/130,45+random(-5,5));
    res.add(centerSqr(val[0]-val[2],val[1]-val[2],(val[2]) ));
   }
 }
 return res;
}
ArrayList centerSqr(float x, float y, float size) {
  ArrayList res = new ArrayList();
  float x2 = 0;
  float y2 = 0;
  for (int i = 0; 3 > i; i++) { //y row
     for (int j = 0; 3 > j; j++) { //x row
     
     if (i != 1 || j != 1) {
       //fill(0);
       pushMatrix();
       translate(x+x2,y+y2);
       box(size/2);
       popMatrix();
       float[] res2 = {x+x2+size/3,y+y2+size/3,size/3};
      res.add((res2));
     }
     else {
      // fill(255);
      //rect(x+x2,y+y2,size,size);  
     }
     x2+=size;
     
  }
   x2 +=-size*3;
   y2 +=size;
}
return res;
}