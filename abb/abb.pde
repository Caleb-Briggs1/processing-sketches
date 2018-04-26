  
import processing.video.*;
Movie myMovie;

map b= new map();
You ME ;
You1 team1;
You2 team2;
divineJustice GOD;
//majority of time spend on drawing bbactaria, change them to a rect to run faster
commentator larry = new commentator();
int haxor = 0;
void setup() {
  size(576,576);
  myMovie = new Movie(this, "nuke.mov");
  myMovie.play();
 myMovie.loop();
  b.INIT();
  ME = new You();
  team1 = new You1();
  team2 = new You2();
  GOD = new divineJustice();
  frameRate(100);


}
boolean[] life = {true,true,true};
boolean haxxor = false;
boolean justice = false;
int val = 0;
void draw() {
  background(255);
  if (!haxxor) {
  if (larry.speech > 2) {
     fill(250,0,0);
    team1.YOU.show();
    if (larry.seeMode) {
      team1.YOU.show2(team1.ang);
    }
  }
  if (larry.speech > 3) {
     fill(0,250,0);
    team2.YOU.show();
    if (larry.seeMode) {
      team2.YOU.show2(team2.ang);
    }
  }
  if (larry.speech > 4) {
     fill(0,0,250);
    ME.YOU.show();
    if (larry.seeMode) {
      ME.YOU.show2(ME.ang);
    }
  }
 if (larry.start == true) { 
   ellipseMode(CENTER);
   rectMode(CENTER);
   b.RUN();

    GOD.heavenlyAim();
   if (ME.YOU.energy > 0) {
    
    ME.run(b);
    if(GOD.heavenlySmite(0)) {
      ME.YOU.energy -= 15;
      image(loadImage("GOD.png"),0,0,width,height);
      text("HAXXOR BE GONE!",width/2,0);
       haxxor = true;
       val = 0;
       haxor = 0;
       
    }
   }
   else {
     ME.YOU.x = 99999;
     if(life[0] == true) {
       life[0] = false;
       larry.dead(0);
       int val = 0;
       int id = 0;
       for (int i = 0; life.length > i; i++) {
         val += int(life[i]);
         if (life[i] == true) {
           id = i;
         }
       }
       if (val == 1) {
         larry.winner(id);
       }
     }
   }
  
   if (team1.YOU.energy > 0) {
    team1.run(b);
    if(GOD.heavenlySmite(1)) {
      team1.YOU.energy -= 15;
      image(loadImage("GOD.png"),0,0,width,height);
      text("HAXXOR BE GONE!",width/2,0);
        haxxor = true;
        val = 0;
       
        haxor = 1;
    }
   }
    else {
      team1.YOU.x = 99999;
      if(life[1] == true) {
       life[1] = false;
       larry.dead(1);
       int val = 0;
       int id = 0;
       for (int i = 0; life.length > i; i++) {
         val += int(life[i]);
         if (life[i] == true) {
           id = i;
         }
       }
       if (val == 1) {
         larry.winner(id);
       }
     }
   }
  
   if (team2.YOU.energy > 0) {
    team2.run(b);
    if(GOD.heavenlySmite(2)) {
      team2.YOU.energy -= 15;
      image(loadImage("GOD.png"),0,0,width,height);
      text("HAXXOR BE GONE!",width/2,0);
      haxxor = true;
      val = 0;
      haxor = 2;
    }
   }
   else {
     team2.YOU.x = 99999;
     if(life[2] == true) {
       life[2] = false;
       larry.dead(2);
       int val = 0;
       int id = 0;
       for (int i = 0; life.length > i; i++) {
         val += int(life[i]);
         if (life[i] == true) {
           id = i;
         }
       }
       if (val == 1) {
         larry.winner(id);
       }
     }
   }
    
   stroke(0,250,250);
 }
  larry.run(b);
  }
  else {
     rotate(radians(random(-1,1)));
     translate(random(-5,5),random(-5,5));
     tint(val,0,0);
     image(loadImage("GOD.png"),0,0,width,height);
     imageMode(CORNER);
     
    
     strokeWeight(3);
     for (int i = 0; 50 > i; i++) {
       float ang = radians(random(360));
       stroke(200 + random(-50,50),0,0);
       line(260,120,260 + cos(ang)*random(250) , 120 + sin(ang) * random(250));
        line(360,120,360 + cos(ang)*random(250) , 120 + sin(ang) * random(250));
     }
     textSize(60);
     fill(250);
     text("HAXXOR \n BE GONE!",width/2,70);
      textSize(15);
     if (val < 350) {
    val += 10;
    
     }
     else {
       haxxor = false;
       justice = true;
     }
     
  }
  if( justice) {
    noTint();
    imageMode(CENTER);
    println(haxor);
    if (haxor == 0) {
       image(myMovie, ME.YOU.x, ME.YOU.y,50,50);
    }
    if (haxor == 1) {
       image(myMovie, team1.YOU.x, team1.YOU.y,50,50);
    }
    if (haxor == 2) {
       image(myMovie, team2.YOU.x, team2.YOU.y,50,50);
    }
   
    imageMode(CORNER);
     }
   
 
}
void movieEvent(Movie m) {
  m.read();
}