class not_on_shrooms { //just to be clear, I am not on shrooms
  float x,y;
  PImage the_good_stuff;
  float get_away_speed = 0.5; //speed at which the cops travel
  float the_draw = 0;
  String status = "hidden in the shadows"; //
   not_on_shrooms(float x_, float y_) { //and yet everything looks funny
     x = x_;
     y = y_;
     the_good_stuff = loadImage("drugs.png"); //its not what it looks like
     //just a side note: "Winners don't do drugs"
   }
   void run(mapEdit jiomlk, float where_the_cops_lookin_x, float where_the_cops_lookin_y, float charX,float charY) { //woawoow the wall is melting
     imageMode(CENTER);
     
     image(the_good_stuff,x+ where_the_cops_lookin_x + width/2,y+ where_the_cops_lookin_y + height/2, 15,15); 
     the_draw += 0.1; //always gettin stronger
     x += get_away_speed;
     y += the_draw;
     for (int i = 0; jiomlk.items.size() > i; i++) {
    float[] al = jiomlk.items.get(i);
    if ( abs((al[0] - (x))) < al[2]/2 + 15/2  && abs(al[1] - (y + the_draw)) < al[2]/2 + 15/2) {
     the_draw = -0.1;
     if (al[4] == 4) {
       status = "The cops got you";
     }
     if (al[1] - (y + the_draw ) < 15/2) {
        get_away_speed *= -1;
      }
      }
    
   
 }
 if ( abs(x -charX ) < 15 &&  abs(y - charY) < 15) {
   status = "Gottem good";
 }
 println(x - charX,y + where_the_cops_lookin_y);
  
   }
}