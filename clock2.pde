void setup() {
  size(500,500);
}
void draw() {
 
  background(255);
  ellipseMode(CENTER);
  textSize(40);
strokeWeight(12);
  ellipse(width/2,height/2,280,280);
  float a= width/2;
  float b =height/2;
  fill(0);
  text(str(hour()%12) + ":" + str(minute()) + ":" + str(second()),a-75,b-200);
  stroke(250,0,0);
  float z = radians((second()/60.0)*360)+ PI+ PI/2;
  line(a,b, a+cos(  z)*120, b+sin(  z)*120);
  
    float s = radians((minute()/60.0)*360)+ PI+ PI/2;
  line(a,b, a+cos(  s)*83, b+sin(  s)*83);
   float d = radians((hour()%12/12.0)*360) + PI+ PI/2;
  line(a,b, a+cos(  d)*36, b+sin(  d)*36);
 
  
  
  
  
  //delay(1000);
  
}