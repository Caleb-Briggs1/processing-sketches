class chunk {
  image images = new image();
  ArrayList<ArrayList<ArrayList<int[]>>> info = new ArrayList();
  //TODO
  //ArrayList<ArrayList<int[]>> grabWIthing 
    //grab chunks iwthin distance
  //boolean chunks within
    //checks if chunks within distance
  void init() {
   info.add(createChunk(576/2,576/2, "chunk3.txt"));
   info.add(createChunk(576/2,576/2-576, "chunk4.txt"));
     info.add(createChunk(576/2 - 576,576/2, "chunk5.txt"));
   //info.add(createChunk(576,0, "chunk3.txt"));
   //info.add
   //...
   images.init();
  }
  
  ArrayList<ArrayList<int[]>> createChunk(int x, int y, String fileName) {
    ArrayList<int[]> data = read(fileName);
    
    ArrayList<ArrayList<int[]>> res = new ArrayList();
    ArrayList<int[]> loc = new ArrayList();
    int[] temp = {x,y};
    loc.add(temp);
    res.add(loc);
    res.add(data);
    return res;
  }
  boolean hit(int id, int x, int y) { //if hitting something
    ArrayList<int[]> curChunk = info.get(id).get(1); 
    int[] loc = info.get(id).get(0).get(0);
    for (int i = 0; curChunk.size() > i; i++) {
      int[] vals = curChunk.get(i);
      int xPos = (loc[0] - x) + vals[0];
      int yPos = (loc[1] - y) + vals[1];
      //were assuming both object and char are 32 by 32
      if ( abs(xPos-width/2) < vals[2]-4.5 && abs(yPos-height/2) < vals[2]-4.5) {
        
        if (vals[5] == 1) {
          return true;
        }
      }
      
      //distance from width/2, height/2 
      //
    }
    return false;
  }
  
  ArrayList<int[]> drawChunk(int id, int x, int y) {
    ArrayList<int[]> curChunk = info.get(id).get(1); 
    int[] loc = info.get(id).get(0).get(0);
    ArrayList<int[]> drawLater = new ArrayList();
    for (int i = 0; curChunk.size() > i; i++) {
      int[] vals = curChunk.get(i);
      int xPos =  -x + vals[0]+ loc[0];
      int yPos = -y + vals[1] + loc[1];
      int[] copy = new int[vals.length];
      for (int j = 0; vals.length > j; j++) {
        if (j == 0) {
          copy[0] = xPos;
        }
        else if (j == 1) {
          copy[1] = yPos;
        }
        else {
          copy[j] = vals[j];
        }
      }
      
      if (vals[8] == 1) {
        drawLater.add(copy);
      }
      else {
        images.drawCostume( xPos, yPos, vals[2], vals[4], vals[7]);
      }
      
    }
   
    
    
    return drawLater;
    
    //returns everythign that should be drew laters
    //THIS NEEDS TO BE FINISHED
    
  }
  void drawChunk(ArrayList<int[]> laterChunk) {
    ArrayList<int[]> curChunk = laterChunk; 
   
   
    for (int i = 0; curChunk.size() > i; i++) {
      int[] vals = curChunk.get(i);
      
      images.drawCostume( vals[0], vals[1], vals[2], vals[4], vals[7]); 
      
    }
  }
  void teleport(int id) {
    if (id == 0) {
    info = new ArrayList();
    info.add(createChunk(1500,1500,"chunk2.txt"));
    You.x = 1500;
    You.y = 1500;
    
    }  
  }
  
  
  
  
  
  
  
  //helper funcs
  ArrayList<int[]> read(String textFile) {
      
      String[] res = split(loadStrings(textFile)[0],"}");
      
      ArrayList<int[]> result = new ArrayList();
      for (int i = 0; res.length > i; i++) {
        
        String[] temp = split(res[i],",");
        
        int[] a = new int[temp.length];
        for (int j = 0; temp.length > j; j++) {
          
          a[j] = int(temp[j]);
        }
        
        
        result.add(a);
 
      }
      
      return result;
      
  }
 
  
}