//ToDo
  //remove everything hardcoded
  //add mutation --Somewhat done
  //increase efficency
  //make it look more like a video game/ look more impressive
  //add different types of barriers
boolean within(float item1, float item2, float differance) {
  if (abs(item1 -item2) < differance) {
    return true;
  }
  return false;
}

ArrayList CreateBarriers(float startX, float startY) {
   Pos Test = new Pos();
    Test.Add(25,60,2,startX,startY,30);
   for (int i = 0; 45 > i;i++) {
     Test.Add(random(i*58+10,i*60),random(-5,50)+50,random(2,7),startX,startY,random(7,17)); //i * 35 part descides the diestance between, increase = increase diffulcty
   }
   return Test.getPos();
}

/* Code (unfinished) to generate specific level
ArrayList CreateBarriers(float startX, float startY) {
   Pos Test = new Pos();
    Test.Add(15,60,2,startX,startY,10);
    Test.Add(60,10,4,0,0,15);
    Test.Add(85,80,4,0,0,10);
    
   for (int i = 0; 45 > i;i++) {
     Test.Add(random(i*58+10,i*70),random(-5,50)+50,random(2,7),startX,startY,random(7,17)); //i * 35 part descides the diestance between, increase = increase diffulcty
   }
   
   return Test.getPos();
}
*/