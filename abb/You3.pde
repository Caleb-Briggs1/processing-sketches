class You2 extends YOU_temp {
  float ang;
  int TextMeme = round(random(1, 5));
  character YOU;
  character retChar() {
    return YOU;
  }
  You2 () {
    YOU = new character(width/2, height/2, 10);
  }
  void run(map MAP) {//Avalible functions, part allowed to change
    this.calc();
    ArrayList<float[]> info = MAP.infoSight(YOU).get(0);


    float speed = 1; //dont do drugs kids
    float goalx;
    float goaly;
    float distance;
    ang = -1;

    if (ang == -1) {
      ang = atan2(width/2-YOU.x, height/2-YOU.y);
      strokeWeight(0.5);
      stroke(255, 0, 0);
      //line(YOU.x, YOU.y, width/2, height/2);
    }


    for (int i = 0; (info.size()) > i; i++) { //repeat for each item
      ////main loop
      //ang = -1;
      goalx = info.get(0)[0];
      goaly = info.get(0)[1];
      ang = atan2(goalx-YOU.x, goaly-YOU.y);

      strokeWeight(0.5);
      stroke(255, 0, 0);
      line(YOU.x, YOU.y, goalx, goaly);

      println(goalx, goaly);

      if (ang == -1) {
        strokeWeight(0.5);
        stroke(255, 0, 0);
        line(YOU.x, YOU.y, width/2, height/2);
      }
    }





    // ang = atan2(goal[0]-YOU.x,goal[1]-YOU.y); //points towards function
    if (YOU.hit(MAP, YOU.x+sin(ang), YOU.y+cos(ang))) {
      if (TextMeme == 1) {
        textAlign(CENTER);
        fill(255, 0, 125);
        textSize(12);
        text("CAN'T HANDLE THESE DODGES BOIIIII", YOU.x, YOU.y-10);
      }
      if (TextMeme == 2) {
        textAlign(CENTER);
        fill(215, 125, 0);
        textSize(24);
        text("SKRRT", YOU.x, YOU.y-10);
      }
      if (TextMeme == 3) {
        textAlign(CENTER);
        fill(0, 0, 255);
        textSize(16);
        text("DRIFT GAME TOO STRONG", YOU.x, YOU.y-10);
      }
      if (TextMeme == 4) {
        textAlign(CENTER);
        fill(255, 0, 0);
        textSize(30);
        text("ZOOM", YOU.x, YOU.y-10);
      }
      if (TextMeme == 5) {
        textAlign(CENTER);
        fill(0, 200, 0);
        textSize(16);
        text("2DODGY4U", YOU.x, YOU.y-10);
      }


      //BEST CODE RIGHT HERE
      if (YOU.hit(MAP, YOU.x+sin(ang), YOU.y+cos(ang))) {
        goalx = YOU.x-30; //Go Left
        goaly = YOU.y;
        ang = atan2(goalx-YOU.x, goaly-YOU.y);
        if (YOU.hit(MAP, YOU.x+sin(ang), YOU.y+cos(ang))) {
          goaly = YOU.y-30; //Go Up
          goalx = YOU.x;
          ang = atan2(goalx-YOU.x, goaly-YOU.y);
          if (YOU.hit(MAP, YOU.x+sin(ang), YOU.y+cos(ang))) {
            goalx = YOU.x+30; //Go Right
            goaly = YOU.y;
            ang = atan2(goalx-YOU.x, goaly-YOU.y);
            if (YOU.hit(MAP, YOU.x+sin(ang), YOU.y+cos(ang))) {
              goaly = YOU.y+30; //Go Down
              goalx = YOU.x;
              ang = atan2(goalx-YOU.x, goaly-YOU.y);
            }
          }
        }
      }

      //   YOU.x += random(-1, 1);
      //   YOU.y += random(-1, 1);
      //if hitting against wall
    }
    if (YOU.evolveReady()) { //if ready to evolve
      MAP.evolve(YOU, 0); //then evolve with choice of path 0
    }

    ////
    this.calc2(MAP, ang, speed); //mandatory, makes you moves, takes angle of movement, and speed as input
  }


  void calc() {
    YOU.view();
    YOU.run();
  }
  void calc2(map map, float ang, float speed) {
    YOU.move(map, ang, min(YOU.maxSpeed, speed) ); //max speed of maxSpeed
    map.eatan(YOU);
  }
}