ArrayList pos;
void setup() {
  size(900,900);
 



  
}
float x = 1;
void draw() {
 
 x*=1.003;
 //print((ArrayList)pos2.get(0));
 scale(x);
  pos = centerSqr(0,0,height/3.2);
  
 
 ArrayList posTemp = new ArrayList();
  for (int i = 0; pos.size() > i;i++) {
    float[] val = ((float[])pos.get(i));
   // print(pos.size());
    fill(255);
    posTemp.add(centerSqr(val[0]-val[2],val[1]-val[2],(val[2]) ));
 }
 ArrayList pos2 = new ArrayList();
 for (int i = 0; posTemp.size() > i;i++) {
   for (int j = 0; ( (ArrayList)posTemp.get(i)).size() > j; j++) {
     float[] val = ( (float[])((ArrayList)posTemp.get(i)).get(j)) ;
     // print(pos.size());
    fill(255);
    pos2.add(centerSqr(val[0]-val[2],val[1]-val[2],(val[2]) ));
   }
 }
 ArrayList pos4 = new ArrayList();
 for (int i = 0; pos2.size() > i;i++) {
   for (int j = 0; ( (ArrayList)pos2.get(i)).size() > j; j++) {
     float[] val = ( (float[])((ArrayList)pos2.get(i)).get(j)) ;
     // print(pos.size());
   // fill(50);
    pos4.add(centerSqr(val[0]-val[2],val[1]-val[2],(val[2]) ));
   }
 }
 ArrayList pos5 = new ArrayList();
 for (int i = 0; pos4.size() > i;i++) {
   for (int j = 0; ( (ArrayList)pos4.get(i)).size() > j; j++) {
     float[] val = ( (float[])((ArrayList)pos4.get(i)).get(j)) ;
     // print(pos.size());
   // fill(50);
    pos5.add(centerSqr(val[0]-val[2],val[1]-val[2],(val[2]) ));
   }
 }
 
 
 
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
   // fill(50);
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
       fill(0);
       rect(x+x2,y+y2,size,size);
       float[] res2 = {x+x2+size/3,y+y2+size/3,size/3};
      res.add((res2));
     }
     else {
       fill(255);
      rect(x+x2,y+y2,size,size);  
     }
     x2+=size;
     
  }
   x2 +=-size*3;
   y2 +=size;
}
return res;
}