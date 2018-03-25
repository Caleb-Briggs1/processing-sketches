import processing.video.*;

  

class movie { //eg init with movie.init(this,"name.mov")
Movie myMovie;
void init(Movie movie) {
  
  background(0);
  myMovie = movie;
  myMovie.loop();
  myMovie.play();
}

void run() {
  
  image(myMovie, width/2, height/2);
 
  
}
boolean done() {
  if (myMovie.time() >= myMovie.duration()-0.1) {
    
    return true;
    
  }
  return false;
}//should call fade after this



}
// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}