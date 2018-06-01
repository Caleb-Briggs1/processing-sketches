game d = new game();


void draw() {
  
 d.run();
}
void mousePressed() {
  d.b.createObject();
  
}
void keyPressed() {
  
  d.Char.keyPres();
  d.b.key();
  if (key == 's') {
    String[] val = new String[d.b.items.size()];
    for (int i = 0; d.b.items.size() > i; i++) {
      float[] val2 = d.b.items.get(i);
      val[i] = val2[0] + "," + val2[1] + "," + val2[2] + "," + val2[3] + "," + val2[4]; 
    }
    saveStrings("map.txt",val);
  }
  if (key == 'r' ) {
    /*
    String[] loadString = loadStrings("map.txt");
    d.b.items = new ArrayList();
    for (int i = 0;loadString.length > i; i++) {
      String[] val = split(loadString[i],",");
      float[] val2 = {float(val[0]),float(val[1]),float(val[2]),float(val[3]),float(val[4])};
      d.b.items.add(val2);
    }
    */
  }
  if (key == 'd') {
    String[] b = {};
    saveStrings("map.txt",b);
  }
}
void keyReleased() {
  d.Char.keyRel();
}
void reset() {
  d.Char.x = d.newX;
  d.Char.y = d.newY;
  d.Char.vel.y = 0;
  d.Char.vel.x = 0;
}