class image {
  PImage[] images = { new PImage(), new PImage(), new PImage(),new PImage(), new PImage(), new PImage(),new PImage(), new PImage(),new PImage(), new PImage(), new PImage()};
  //32 by 32
  void init() {
    images[0] = loadImage("m_skelcave.png");
    images[1] = loadImage("m_icecave.png");
    images[2] = loadImage("m_fairy.png");
    images[3] = loadImage("m_sanc.png");
    images[4] = loadImage("m_sand.png");
    images[5] = loadImage("m_volc.png");
    images[6] = loadImage("at_skelcave01.png");
    images[7] = loadImage("at_volc01.png");
    images[8] = loadImage("at_volc02.png");
    images[9] = loadImage("forest.png");
    images[10] = loadImage("statues.png");
    
    
    
  }
  
  PImage getImage(int image, int numX, int numY) { //iamges are 256 by 256 eg 8 by 8
    if (image > images.length-1 || image < 0) {
      println("out of bounds!");
      println(image);
      image = 0;
    }
    else{
      if (image != 9) {
    return images[image].get(numX * 32,numY*32,32,32);
      }
      else if (image == 9) {
         return images[image].get(numX * 30 + 1,numY*30 + 1,30,30);
      }
    }
    return new PImage();
    
  }
  void drawCostume(float x, float y, int size, int cost, int cost2) {
    imageMode(CENTER);
    if (cost2 != 9) {
    image(this.getImage(cost2,cost%8,cost/8),x,y,size,size);
    }
    else if (cost2 == 9) {
      image(this.getImage(cost2,cost%16,cost/16),x,y,size,size);
    }
   
    
    
   
   
   
  }
  
  
}