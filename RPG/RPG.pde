import processing.video.*;

//make dante 2 have differnt id
//get ome sound track and stuff, noise for when you clicking the buttons
//taking about 110 CPU, needs to increase its speed, find some way to compile iamge
//main problem was GC dumps (garbage collections)
//need to hash more things
//path should be to the left ot symbolize that hell is all about going left
//toDO:
  //work on dante speech
  //finish options for text
  //allow you  to lead dante into hell.
  //add some noise for when seeing the bveasts
void setup() {
 size(700,640); //dont change size any more, 700 by 640
 fill(0);
 
 init();
 //delay(1000); 
}
void draw() {

  run();
}