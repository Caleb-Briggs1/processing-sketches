
void setup() {
  size(displayWidth,displayHeight);
  d.setup();
  
}
class game {
  public float newX = 0;
public float newY = 0;
public mapEdit b;
public character Char ;
public ArrayList<we_be_hoopin> hoopers = new ArrayList();
public ArrayList<back_in_NAM> eaters = new ArrayList();
public ArrayList<not_on_shrooms> unmarked_ojects = new ArrayList(); //not sketchy
public float camX = 0;
public float camY = 0;

void setup() {
  
   b = new mapEdit();
  Char = new character(0,0);
  //size(displayWidth,displayHeight);
  
}
void run() {
  println(frameRate);
  scale(2);
 translate(-width/4,-height/4);
 
  background(0);
  
  colorMode(RGB);
  fill(0,250,0);
  frameRate(200);
  if (key != ' ') {
    camX += -((Char.x+camX)/24) ;
    camY += -((Char.y+camY)/24) ;
    
   Char.draw(camX,camY);
   
  }
  for (int i = 0; eaters.size() > i; i++) {
  eaters.get(i).run(camX,camY);
  if (eaters.get(i).hit(Char.x,Char.y)){
    reset();
    //Char.y = eaters.get(i).y - eaters.get(i).yPlus -12.5;
    //Char.vel.y = 0;
  }
  }
  for (int i = 0; unmarked_ojects.size() > i; i++) {
    unmarked_ojects.get(i).run(b,camX,camY,Char.x,Char.y);
    if ( unmarked_ojects.get(i).status.equals("The cops got you")) {
      unmarked_ojects.remove(i);
    }
    else if (unmarked_ojects.get(i).status.equals("Gottem good")) {
      unmarked_ojects.remove(i);
      println("gottem");
      Char.x += 20;
    }
  }
  
  
  for (int i = 0; hoopers.size() > i; i++) { 
    hoopers.get(i).draw(b,camX,camY);
    if (hoopers.get(i).hitHead(Char.x,Char.y) && Char.vel.y > 1) {
    hoopers.remove(i);
    Char.vel.y *= -1;
    //this equals die
    }
    else if (hoopers.get(i).hitBody(Char.x,Char.y)) {
      reset();
    }
  }
  
  
  rectMode(CENTER);
  for (int i = 0; b.items.size() > i; i++) {
    float[] al = b.items.get(i);
    if (al[4] == 3) {
          if (al[3] < 15) {
            al[3] += (15 - al[3] )/8.0;
            
          }
    }
    if ( abs((al[0] - (Char.x+Char.vel.x))) < al[2]/2 + 7 && abs(al[1] - (Char.y+Char.vel.y)) < al[2]/2 + 7) {
      //create and statements, becuas right now
      if (al[4] == 4) {
        reset();
      }
      else if (al[4] == 5) {
        println("test");
         newX = new Integer(int(al[0]));
         newY = new Integer(int(al[1])) -15;
      }
      if ( Char.x-0.01 > al[0] + al[2]/2 + 7 || Char.x+.01 < al[0] - al[2]/2 - 7) {
        Char.vel.x = 0;
      }
      else if ( Char.y > al[1] + 15/2 + 7) {
        
        
          Char.vel.y = 0;
        
        
        if (al[4] == 1) {
        b.items.remove(i);
        }
        if (al[4] == 2) {
         //change look
         
         if (al[3] != 15.1) {
           al[3] = 15.1;
           unmarked_ojects.add(new not_on_shrooms(al[0],al[1]-15.5));
           //do stuff
           
         }
        }
        
      }
      else if (Char.y -1.5 < al[1] - 15/2 - 7) {
        fill(0,250,250);
        if (al[4] == 1 && Char.keys[3] && abs(Char.vel.y) > 1.5) { 
            b.items.remove(i);
            
         }
         else if (al[4] == 3 && abs(Char.vel.y) > .3) { //THIS IS BOUNCE TILE
          al[3] -= (Char.y+Char.vel.y) - ( al[1]- al[3] );
          
          Char.y = (al[1] - al[3] - 1)- Char.vel.y  ; //fix this
          
          
          
          Char.vel.y *= -1;
          
          
          
          
        
        
        }
         
        else {
         
        Char.y = al[1] - al[3]/2 - 7 -1.5;
        Char.hit();
        }
       
      }
      
    }
    
  }
  
  
  b.run(camX,camY);
}

  //
}