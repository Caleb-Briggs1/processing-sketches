int size = 5000;
int max_speed = 5;
//int size = (int)random(10000);
//int max_speed = (int)random(10);
Circle[] A = new Circle[size];

//and then to initialize like that
 float Height;
 float Width;
void setup() {
  
   size(800,850);
   Width =800; //needs to equal width
   Height = 850; //this needs to be equal to the height 
   for(int i = 0;i < size;i++){
   A[i] = new Circle();
}
   
}


void draw() {
  background(0);
  for(int i = 0;i < size ;i++){
   A[i].update();
  }
  //background(255);
  
}



class Circle {
  float x = random(Width);
    float y = 0;
    float z = random(1,max_speed);
    float x_size = random(30);
    float R = random(250);
    float G = random(250);
    float B = random(250);
    float last = random(250);
    

  void update() {
    noStroke();
    y = y+z;
    
    fill(0,G,0,last);
    //textSize( (x_size*last) / 200 );
    text((int) random(9),x,y);
    
    if (y > (Height + 50)) {
      z= random(1,max_speed);
      y = 0;
    }
  }
  
}