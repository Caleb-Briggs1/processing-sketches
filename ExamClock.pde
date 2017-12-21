//fixed version of exam clock
void setup() {
  size(500,500);
}
void draw() {
 scale(5);
  background(255);
  ellipseMode(CENTER);
  
  ellipse(60,60,50,50);
  
  stroke(250,0,0);
  float z = radians((second()/60.0)*360)+ PI+ PI/2;
  line(60,60, 60+cos(  z)*15, 60+sin(  z)*15);
  
    float s = radians((minute()/60.0)*360)+ PI+ PI/2;
  line(60,60, 60+cos(  s)*9, 60+sin(  s)*9);
   float d = radians((hour()%12/12.0)*360) + PI+ PI/2;
  line(60,60, 60+cos(  d)*5, 60+sin(  d)*5);
  
  
  
  float totalSeconds = second() + (minute()*60) + (hour()*60*60);
  
  float x = radians( (totalSeconds% (100/1.157)/(100/1.157)*360))+ PI+ PI/2;
   stroke(0,250,0);
  line(60,60, 60+cos( x)*15,60+  (sin(x)*15));
     x = radians( ( (totalSeconds% ((100/1.157)*100)/((100/1.157)*100))*360))+ PI+ PI/2;
    line(60,60, 60+cos( x)*7,60+  (sin(x)*7));
      x = radians( ( (totalSeconds% ((100/1.157)*1000)/((100/1.157)*1000))*360))+ PI+ PI/2;
    line(60,60, 60+cos( x)*3,60+  (sin(x)*3));
    
    
  
  //delay(1000);
  
}
