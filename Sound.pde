import processing.sound.*;
SinOsc sine;
void setup() {
sine = new SinOsc(this);
sine.play();
size(900,100);
}
float freq = 100;
float beta = .9;
void draw() {
  
  //beta += random(sin(frameCount));
  freq += (random(sin(radians(frameCount))) -random(sin(radians(frameCount)))) * 40 ;
  println(freq,sin(frameCount));
  point(frameCount % 900,50+ freq/30.0);
  sine.freq(freq);
}
