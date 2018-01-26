int s = second();
int m = minute();
int h = hour();
void setup() {
  size(500,500);
}
void draw() {

 
  background(0);
  fill(250);

  float sec =(( s + m*60 + h*3600)+ millis()/1000.0) * .87 ;
  String stri = str(int( (sec%(25*25*120) - (sec%(25*25))  ))/625 % 60) + ":" + str(int(sec%(25*25) - sec % 25 )/25 ) + ":" + str(int(sec % 25) );
  textAlign(CENTER);
  text(stri,width/2,height/5);
    stroke(50,50,90);
    fill(0);
  ellipseMode(CENTER);
  textSize(40);
strokeWeight(12);
  ellipse(width/2,height/2,280,280);
  float a= width/2;
  float b =height/2;
  fill(0);
 
  stroke(250,0,0);
  float z = radians((sec % 25)/25.0 *360)+ PI+ PI/2;
  line(a,b, a+cos(  z)*120, b+sin(  z)*120);
  stroke(150);

    z = radians(( ((sec%(25.0*25) - sec % 25 )/625.0) *360))+ PI+ PI/2;
  line(a,b, a+cos(  z)*83, b+sin(  z)*83);
stroke(250);
   z = radians((( (sec%(25.0*25*120) - (sec%(25*25))  ))/(625*120.0))*720) + PI+ PI/2;
  line(a,b, a+cos(  z)*36, b+sin(  z)*36);
}