ArrayList pos = new ArrayList();
boolean[] keys = {false,false,false,false,false};
import java.awt.AWTException;
import java.awt.Robot;
Robot robot;
float change = 0;
float time = hour()*60 * 12 + minute()*60 + second();
//when you hit teh wall, you lose some sppeed forever, eg ic auses damage
//add jumps
//get back into car
float[] pos2 = {










 
 
147.0,172.0,0.0,152.0,172.0,0.0,174.0,172.0,0.0,194.0,173.0,0.0,209.0,176.0,0.0,225.0,179.0,0.0,240.0,181.0,0.0,257.0,184.0,0.0,282.0,188.0,0.0,303.0,188.0,0.0,317.0,188.0,0.0,329.0,189.0,0.0,338.0,189.0,0.0,349.0,192.0,0.0,356.0,197.0,0.0,356.0,200.0,0.0,356.0,208.0,0.0,358.0,215.0,0.0,361.0,228.0,0.0,366.0,248.0,0.0,372.0,271.0,0.0,373.0,284.0,0.0,373.0,296.0,0.0,371.0,313.0,0.0,371.0,320.0,0.0,374.0,328.0,0.0,379.0,337.0,0.0,388.0,354.0,0.0,392.0,360.0,0.0,399.0,366.0,0.0,399.0,366.0,0.0,418.0,380.0,0.0,435.0,391.0,0.0,443.0,394.0,0.0,455.0,399.0,0.0,467.0,402.0,0.0,479.0,403.0,0.0,490.0,403.0,0.0,502.0,402.0,0.0,508.0,401.0,0.0,520.0,400.0,0.0,533.0,394.0,0.0,539.0,388.0,0.0,539.0,388.0,0.0,553.0,378.0,0.0,566.0,367.0,0.0,576.0,362.0,0.0,581.0,359.0,0.0,592.0,354.0,0.0,600.0,351.0,0.0,610.0,351.0,0.0,623.0,356.0,0.0,630.0,361.0,0.0,640.0,368.0,0.0,653.0,375.0,0.0,668.0,382.0,0.0,668.0,382.0,0.0,673.0,383.0,0.0,697.0,395.0,0.0,713.0,407.0,0.0,723.0,414.0,0.0,726.0,417.0,0.0,735.0,423.0,0.0,748.0,427.0,0.0,763.0,432.0,0.0,775.0,433.0,0.0,789.0,433.0,0.0,802.0,431.0,0.0,817.0,423.0,0.0,829.0,416.0,0.0,840.0,409.0,0.0,846.0,394.0,0.0,847.0,383.0,0.0,848.0,366.0,0.0,848.0,355.0,0.0,842.0,342.0,0.0,836.0,336.0,0.0,827.0,323.0,0.0,820.0,309.0,0.0,818.0,307.0,0.0,810.0,290.0,0.0,803.0,281.0,0.0,797.0,274.0,0.0,792.0,268.0,0.0,789.0,263.0,0.0,787.0,250.0,0.0,791.0,234.0,0.0,802.0,225.0,0.0,815.0,222.0,0.0,831.0,231.0,0.0,846.0,249.0,0.0,855.0,260.0,0.0,866.0,267.0,0.0,881.0,279.0,0.0,891.0,291.0,0.0,900.0,310.0,0.0,905.0,319.0,0.0,905.0,319.0,0.0,910.0,341.0,0.0,913.0,350.0,0.0,916.0,365.0,0.0,918.0,377.0,0.0,917.0,389.0,0.0,913.0,401.0,0.0,911.0,409.0,0.0,905.0,416.0,0.0,900.0,421.0,0.0,895.0,428.0,0.0,889.0,435.0,0.0,881.0,439.0,0.0,872.0,442.0,0.0,865.0,448.0,0.0,853.0,455.0,0.0,844.0,463.0,0.0,833.0,473.0,0.0,829.0,479.0,0.0,822.0,487.0,0.0,815.0,494.0,0.0,804.0,499.0,0.0,796.0,501.0,0.0,785.0,505.0,0.0,771.0,513.0,0.0,767.0,516.0,0.0,757.0,519.0,0.0,746.0,521.0,0.0,737.0,522.0,0.0,726.0,525.0,0.0,706.0,536.0,0.0,697.0,544.0,0.0,696.0,545.0,0.0,696.0,545.0,0.0,686.0,558.0,0.0,680.0,565.0,0.0,674.0,578.0,0.0,667.0,589.0,0.0,662.0,605.0,0.0,662.0,612.0,0.0,666.0,625.0,0.0,668.0,636.0,0.0,673.0,654.0,0.0,676.0,660.0,0.0,676.0,660.0,0.0,690.0,676.0,0.0,698.0,684.0,0.0,706.0,691.0,0.0,716.0,696.0,0.0,724.0,699.0,0.0,734.0,703.0,0.0,746.0,709.0,0.0,759.0,712.0,0.0,768.0,715.0,0.0,775.0,716.0,0.0,789.0,717.0,0.0,796.0,717.0,0.0,796.0,717.0,0.0,798.0,713.0,0.0,798.0,704.0,0.0,798.0,691.0,0.0,799.0,681.0,0.0,800.0,678.0,0.0,800.0,677.0,0.0,800.0,673.0,0.0,800.0,673.0,0.0,787.0,672.0,0.0,774.0,671.0,0.0,767.0,667.0,0.0,756.0,661.0,0.0,746.0,658.0,0.0,739.0,655.0,0.0,733.0,652.0,0.0,727.0,648.0,0.0,721.0,642.0,0.0,715.0,632.0,0.0,714.0,615.0,0.0,723.0,596.0,0.0,732.0,586.0,0.0,746.0,577.0,0.0,758.0,570.0,0.0,774.0,563.0,0.0,791.0,557.0,0.0,811.0,550.0,0.0,832.0,533.0,0.0,848.0,530.0,0.0,861.0,528.0,0.0,886.0,526.0,0.0,894.0,526.0,0.0,894.0,525.0,0.0,925.0,487.0,0.0,935.0,474.0,0.0,941.0,466.0,0.0,947.0,458.0,0.0,955.0,446.0,0.0,959.0,436.0,0.0,961.0,420.0,0.0,956.0,436.0,0.0,934.0,470.0,0.0,922.0,488.0,0.0,911.0,500.0,0.0,904.0,512.0,0.0,907.0,508.0,0.0,932.0,478.0,0.0,946.0,456.0,0.0,955.0,439.0,0.0,963.0,417.0,0.0,966.0,397.0,0.0,964.0,391.0,0.0,964.0,383.0,0.0,962.0,364.0,0.0,958.0,350.0,0.0,958.0,343.0,0.0,957.0,336.0,0.0,954.0,328.0,0.0,953.0,320.0,0.0,950.0,307.0,0.0,945.0,293.0,0.0,935.0,274.0,0.0,925.0,255.0,0.0,921.0,254.0,0.0,911.0,254.0,0.0,904.0,254.0,0.0,904.0,254.0,0.0,904.0,244.0,0.0,899.0,237.0,0.0,890.0,227.0,0.0,885.0,221.0,0.0,875.0,207.0,0.0,867.0,200.0,0.0,850.0,190.0,0.0,830.0,184.0,0.0,821.0,182.0,0.0,810.0,181.0,0.0,803.0,182.0,0.0,791.0,187.0,0.0,779.0,191.0,0.0,767.0,200.0,0.0,748.0,211.0,0.0,739.0,222.0,0.0,736.0,231.0,0.0,735.0,242.0,0.0,740.0,259.0,0.0,745.0,273.0,0.0,749.0,286.0,0.0,760.0,301.0,0.0,767.0,312.0,0.0,780.0,330.0,0.0,789.0,342.0,0.0,796.0,355.0,0.0,803.0,367.0,0.0,804.0,384.0,0.0,804.0,384.0,0.0,797.0,386.0,0.0,785.0,387.0,0.0,766.0,387.0,0.0,752.0,386.0,0.0,739.0,378.0,0.0,727.0,370.0,0.0,716.0,358.0,0.0,703.0,344.0,0.0,688.0,326.0,0.0,670.0,309.0,0.0,655.0,303.0,0.0,638.0,296.0,0.0,613.0,296.0,0.0,600.0,297.0,0.0,582.0,303.0,0.0,562.0,313.0,0.0,549.0,318.0,0.0,526.0,329.0,0.0,515.0,342.0,0.0,515.0,342.0,0.0,488.0,344.0,0.0,466.0,343.0,0.0,452.0,335.0,0.0,443.0,327.0,0.0,437.0,318.0,0.0,433.0,297.0,0.0,433.0,280.0,0.0,430.0,258.0,0.0,430.0,258.0,0.0,427.0,227.0,0.0,421.0,206.0,0.0,416.0,191.0,0.0,410.0,179.0,0.0,393.0,164.0,0.0,376.0,156.0,0.0,355.0,146.0,0.0,333.0,139.0,0.0,321.0,137.0,0.0,304.0,136.0,0.0,278.0,136.0,0.0,243.0,137.0,0.0,217.0,135.0,0.0,196.0,135.0,0.0,178.0,135.0,0.0,164.0,134.0,0.0,170.0,134.0,0.0,191.0,134.0,0.0,206.0,135.0,0.0,225.0,135.0,0.0,245.0,136.0,0.0,258.0,136.0,0.0,278.0,136.0,0.0,294.0,139.0,0.0,312.0,140.0,0.0,325.0,140.0,0.0,341.0,141.0,0.0,360.0,148.0,0.0,380.0,159.0,0.0,396.0,171.0,0.0,409.0,184.0,0.0,417.0,197.0,0.0,427.0,220.0,0.0,431.0,235.0,0.0,431.0,253.0,0.0,432.0,269.0,0.0,161.0,126.0,0.0,161.0,126.0,0.0,157.0,126.0,0.0,138.0,129.0,0.0,137.0,132.0,0.0,134.0,134.0,0.0,123.0,146.0,0.0,127.0,152.0,0.0,133.0,163.0,0.0,135.0,171.0,0.0,142.0,172.0,0.0,147.0,173.0,0.0,816.0,679.0,0.0,817.0,679.0,0.0,825.0,679.0,0.0,830.0,679.0,0.0,837.0,679.0,0.0,847.0,679.0,0.0,853.0,679.0,0.0,862.0,679.0,0.0,870.0,679.0,0.0,877.0,679.0,0.0,883.0,680.0,0.0,887.0,681.0,0.0,893.0,681.0,0.0,899.0,682.0,0.0,906.0,682.0,0.0,919.0,681.0,0.0,921.0,679.0,0.0,928.0,679.0,0.0,936.0,679.0,0.0,941.0,679.0,0.0,947.0,679.0,0.0,955.0,678.0,0.0,962.0,678.0,0.0,969.0,679.0,0.0,976.0,679.0,0.0,982.0,680.0,0.0,985.0,686.0,0.0,986.0,699.0,0.0,986.0,707.0,0.0,986.0,716.0,0.0,986.0,721.0,0.0,982.0,723.0,0.0,971.0,723.0,0.0,966.0,723.0,0.0,960.0,723.0,0.0,951.0,725.0,0.0,947.0,727.0,0.0,938.0,728.0,0.0,933.0,728.0,0.0,920.0,731.0,0.0,906.0,731.0,0.0,897.0,728.0,0.0,883.0,723.0,0.0,880.0,722.0,0.0,864.0,720.0,0.0,852.0,718.0,0.0,840.0,718.0,0.0,826.0,717.0,0.0,809.0,717.0,0.0,797.0,717.0,0.0,796.0,717.0,0.0,};
float[] pos3 = { 
168.0,153.0,0.0,189.0,154.0,0.0,219.0,159.0,0.0,248.0,162.0,0.0,273.0,162.0,0.0,302.0,162.0,0.0,322.0,160.0,0.0,346.0,162.0,0.0,371.0,180.0,0.0,381.0,196.0,0.0,388.0,225.0,0.0,388.0,252.0,0.0,384.0,280.0,0.0,389.0,311.0,0.0,410.0,346.0,0.0,417.0,352.0,0.0,461.0,378.0,0.0,483.0,382.0,0.0,507.0,379.0,0.0,527.0,374.0,0.0,549.0,364.0,0.0,566.0,352.0,0.0,582.0,337.0,0.0,604.0,323.0,0.0,627.0,321.0,0.0,658.0,342.0,0.0,678.0,364.0,0.0,682.0,371.0,0.0,750.0,418.0,0.0,804.0,419.0,0.0,831.0,392.0,0.0,828.0,363.0,0.0,815.0,334.0,0.0,793.0,304.0,0.0,774.0,279.0,0.0,760.0,255.0,0.0,761.0,226.0,0.0,802.0,199.0,0.0,857.0,219.0,0.0,912.0,288.0,0.0,930.0,357.0,0.0,933.0,409.0,0.0,908.0,451.0,0.0,864.0,517.0,0.0,798.0,552.0,0.0,718.0,561.0,0.0,780.0,208.0,0.0,808.0,203.0,0.0,853.0,217.0,0.0,874.0,241.0,0.0,892.0,257.0,0.0,906.0,271.0,0.0,921.0,304.0,0.0,932.0,332.0,0.0,938.0,358.0,0.0,938.0,358.0,0.0,938.0,401.0,0.0,931.0,420.0,0.0,917.0,441.0,0.0,906.0,454.0,0.0,890.0,468.0,0.0,871.0,485.0,0.0,852.0,499.0,0.0,828.0,517.0,0.0,797.0,533.0,0.0,767.0,544.0,0.0,727.0,554.0,0.0,769.0,419.0,0.0,740.0,416.0,0.0,714.0,395.0,0.0,680.0,369.0,0.0,644.0,341.0,0.0,595.0,331.0,0.0,428.0,362.0,0.0,745.0,554.0,0.0,832.0,202.0,0.0,704.0,571.0,0.0,695.0,583.0,0.0,684.0,631.0,0.0,726.0,676.0,0.0,754.0,690.0,0.0,778.0,695.0,0.0,778.0,695.0,0.0,684.0,592.0,0.0,696.0,661.0,0.0,834.0,700.0,0.0,864.0,703.0,0.0,883.0,704.0,0.0,901.0,707.0,0.0,920.0,707.0,0.0,938.0,707.0,0.0,963.0,700.0,0.0,1004.0,705.0,0.0,1021.0,704.0,0.0,1041.0,702.0,0.0,1055.0,704.0,0.0,1069.0,704.0,0.0,1079.0,704.0,0.0,1137.0,641.0,-35.0,1137.0,654.0,-35.0,1139.0,670.0,-35.0,1141.0,690.0,-35.0,1141.0,710.0,-35.0,1139.0,733.0,-35.0,1138.0,751.0,-35.0,1138.0,765.0,-35.0,1214.0,692.0,-65.0,1230.0,691.0,-65.0,1249.0,691.0,-65.0,1269.0,691.0,-65.0,1282.0,691.0,-65.0,1301.0,691.0,-65.0,1319.0,691.0,-65.0,};
float[] pos4 = {};
//pos4 for inclines
//tracks are drwan to high, fix this
car b = new car();
ball Guy;
BATTLE you = new BATTLE(100,1,.1);
character TTest = new character(1043.0,-75.0,527.0 );
boolean incline = false;
void setup() {
size(displayWidth,displayHeight,P3D);
try { 
    robot = new Robot();
  } 
  catch (AWTException e) {
    e.printStackTrace();
  }
}
class carUpdate {
  boolean on = true;
  boolean guy = false;
  float mouse1 = width/2; //x
  float mouse2 = height/2; //y
  void run() {
      b.update();
   float offset1 = 0;
   camera(b.carLocationX-offset1,b.carLocationUp,b.carLocationY-offset1,b.carLocationX+(cos(b.carHeading))-offset1,b.carLocationUp,b.carLocationY+sin(b.carHeading)-offset1,0,1,0);
  perspective(PI/3.0 , width/height, .001, ((height/2.0) / tan(PI*60.0/360.0))*10.0);

  }
  
}
carUpdate GAME = new carUpdate();
void draw() {
   background(0);
  
  if(GAME.on) {
    GAME.run();
  }
  
  if(key == 'o' && abs(b.carSpeed) < .15 && GAME.on&& keyPressed) {
    GAME.on = false;
    Guy = new ball(b.carLocationX,b.carLocationUp,b.carLocationY);
    GAME.guy = true;
    robot.mouseMove(width/2, height/2);
    //key = 'i';
    delay(150);
  }
  else if(key == 'i' && dist(b.carLocationX,b.carLocationUp,b.carLocationY,Guy.x,Guy.y,Guy.z) < 30 && GAME.guy && keyPressed) {
    GAME.on = true;
    
    GAME.guy = false;
    key = 'i';
    delay(150);
  }
  
  if (GAME.guy){
    float offset = 0;
    
    
    //delay(1000);
      Guy.dir = ( ((GAME.mouse1-width/2.0)/width/2.0)*360*2);
    camera(Guy.x-0,Guy.y-offset,Guy.z-0,Guy.x+(cos(radians(Guy.dir)))  ,Guy.y+(GAME.mouse2/(height*.25))-offset,Guy.z+sin(radians(Guy.dir))-0,0,1,0);
    perspective(PI/3.0 , width/height, .001, ((height/2.0) / tan(PI*60.0/360.0))*10.0);
  GAME.mouse1 += mouseX-width/2.0 ;
    GAME.mouse2 += mouseY-height/2.0 + 45 ;
    
  robot.mouseMove(width/2, height/2);
    //println(Guy.dir);
    Guy.update();
     TTest.update(Guy.x,Guy.y,Guy.z);
  }
  else {
    TTest.show();
  }
  

 
  
 
 
  
  if (GAME.guy) {
    fill(50,60,90,210);
    pushMatrix();
  translate(b.carLocationX-10,b.carLocationUp,b.carLocationY);
  //Guy.x += 5;
  box(15);
  popMatrix();
  }
   fill(250);

/*
 pushMatrix();
 pushMatrix();
 translate(150,-10,150);
 rotateX(PI/4);
float curTime = hour()*60 * 12 + minute()*60 + second();
   text(curTime - time,0,0,0);
   popMatrix();
    popMatrix();
 */   
    

  


 boolean onTrack = false;
 int near  = 0;
for (int i = 0; pos3.length/3 - 1 > i; i++) {
   pushMatrix();
   pushMatrix();
    
  float above = 10;
    translate(pos3[i*3], pos3[i*3+2]+35/2+above,pos3[i*3+1]);
   if(dist(pos3[i*3], pos3[i*3+2]+35/2+above,pos3[i*3+1],b.carLocationX,b.carLocationUp,b.carLocationY) < 130 && abs(b.carLocationUp-pos3[i*3+2]+35/2+above) < 30) {
     fill(i*3,250,250 - i*6);
    
   }
   else {
     fill(150);
   }
   
     stroke(0);
     line(-35/2,-35/2-1,-35/2,35/2,-35/2-1,35/2);
     noStroke();
     
    box(35);
    popMatrix();
     popMatrix();
   if(GAME.on) {
       if (abs(b.carLocationX-pos3[i*3]) < 35/2 &&  abs(b.carLocationY-pos3[i*3+1]) < 35/2  && abs(b.carLocationUp-15-pos3[i*3+2]) < 35/2)  {
    onTrack = true;
        
       }
       
   }
       if(GAME.guy) {
       if (abs(Guy.x-pos3[i*3]) < 35/2 &&  abs(Guy.z-pos3[i*3+1]) < 35/2 && abs(Guy.y-pos3[i*3+2]-20) < 35/2)  {
    onTrack = true;
    Guy.velY = 0;
    
    if (keys[4]) {
      Guy.velY = -2;
    }
    
    
         //b.carLocationUp = pos3[i*3+2];
       }
       else {
        
      if (Guy.y > 0 && !onTrack) {
        
       //Guy.velY = 0;
      }
      
    
       }
   }
   
       
        
       
       
      
   
  
}
println(onTrack);
if (onTrack == false && GAME.on) {
  
         //b.carLocationUp += 1;
         }
if (GAME.on) {
    if (incline == false && onTrack == false && b.carLocationUp <0 ) {
             b.yVel += 2;
              
           }
           
  if (onTrack) {
    b.yVel = 0;
           b. carSpeed *= .993;
           
         }
         else {
           
            b. carSpeed *= .978;
         }
}
boolean all = false;     

for (int i = 0; pos4.length/3 - 1  > i; i++) {
  
  if (i % 2 == 0) {
  //pushMatrix();
  //translate(pos4[i*3],35 + pos4[i*3+2],pos4[i*3+1]);
  strokeWeight(35);
  
  for (int q = 0; 15 > q; q++) {
    pushMatrix();
    translate(0,0,3*q);
    stroke(0,0,250);
  line(pos4[i*3],35 + pos4[i*3+2],pos4[i*3+1],pos4[(i+1)*3],35 + pos4[(i+1)*3+2],pos4[(i+1)*3+1]);
  popMatrix();
  }
  for (int q = 0; 15 > q; q++) {
    pushMatrix();
    translate(3*q,0,0);
    stroke(0,0,250);
  line(pos4[i*3],35 + pos4[i*3+2],pos4[i*3+1],pos4[(i+1)*3],35 + pos4[(i+1)*3+2],pos4[(i+1)*3+1]);
  popMatrix();
  }
  strokeWeight(1);
  if(GAME.on) {
   if (dist(b.carLocationX,0,b.carLocationY,pos4[i*3],0,pos4[i*3+1]) < dist(pos4[i*3],0,pos4[i*3+1],pos4[(i+1)*3],0,pos4[(i+1)*3+1]) &&  dist(b.carLocationX,0,b.carLocationY,pos4[(i+1)*3],0,pos4[(i+1)*3+1]) < dist(pos4[i*3],0,pos4[i*3+1],pos4[(i+1)*3],0,pos4[(i+1)*3+1])  )  {
    //then on ramp
    //amoutn along is totalDistance and distance to item 2 thing
    float totalDistance = dist(pos4[i*3],0,pos4[i*3+1],pos4[(i+1)*3],0,pos4[(i+1)*3+1]);
    float distanceTraveled = dist(b.carLocationX,0,b.carLocationY,pos4[i*3],0,pos4[i*3+1]);
   
    float rampChange =  (pos4[(i+1)*3+2]-pos4[i*3+2]) ;
    change = (pos4[(i+1)*3+2]-pos4[i*3+2]);
   // b.carSpeed *= abs(rampChange)/100; //this should get fixed mkae firction based on steep ness
    //y = rampChange * totalDistance/distanceTraveled + pos4[i*3+1];
incline = true;
    b.carLocationUp= (rampChange * distanceTraveled/totalDistance) + pos4[i*3+2];
    all = true;
    //Up = firstPosition 
    //to calculate, 
    //y = heightDiff
    println(distanceTraveled/totalDistance);
       }
       
  }
  }
  if (all == false) {
    if (incline) {
     
      //then that means a jump
     if(GAME.on) {
      if (change < 0) {
       // println(b.carSpeed);
      b.yVel = ((change*b.carSpeed));
      
      }
     }
    
    }
  incline = false;
}
 
  
 
  
}
noStroke();
randomSeed(0);
  for (int i = 0; pos2.length/3 - 1 > i; i++) {
    boolean done = false;
    pushMatrix();
    translate(pos2[i*3],pos2[i*3+2],pos2[i*3+1]);
     fill(random(250),abs(pos2[i*3]),abs(pos2[i*3+1]));
     pushMatrix();
     translate(0,-15);
       box(15);
       popMatrix();
    box(15);
    popMatrix();
    if(GAME.on) {
    if (abs(b.carLocationX-pos2[i*3]) < 7.5 &&  abs(b.carLocationY-pos2[i*3+1]) < 7.5 &&  abs(b.carLocationUp-pos2[i*3+2]) < 7.5 &&!done)  {
 
     
      float frontWheelX = b.carLocationX + b.wheelBase/2 * cos(b.carHeading);
float frontWheelY =b. carLocationY + b.wheelBase/2 * sin(b.carHeading);

float backWheelX = b.carLocationX - b.wheelBase/2 * cos(b.carHeading );
float backWheelY = b.carLocationY - b.wheelBase/2 * sin(b.carHeading);
backWheelX += -b.carSpeed*1.1 *  cos(b.carHeading);
backWheelY += -b.carSpeed*1.1 * sin(b.carHeading);
 b.damage += abs(b.carSpeed)/40.0;
// b.damage = max(0.01,b.damage);
frontWheelX += -b.carSpeed*1.1 *  cos(b.carHeading+b.steerAngle);
frontWheelY +=- b.carSpeed *1.1*  sin(b.carHeading+b.steerAngle);
b.carSpeed = 0;
      b.carLocationX = (frontWheelX + backWheelX)/2 ;
      b.carLocationY = (frontWheelY + backWheelY)/2 ; 
      done = true;
      
      
    }
    
  }
  if (GAME.guy) {
    if (abs(Guy.x-pos2[i*3]) < 7.5 &&  abs(Guy.z-pos2[i*3+1]) < 7.5 &&  abs(Guy.y-pos2[i*3+2]) < 7.5 &&!done)  { //FIX THIS
       float yDist = abs(Guy.y- pos2[i*3+2]);
        float xDist = abs(Guy.x- pos2[i*3]);
        float zDist = abs(Guy.z- pos2[i*3+1]);
        println("red");
         done = true;
       
          
        float[] b = {yDist,xDist-5,zDist-5};
        if (Guy.greatest(b) == 0) {
          
        
        
           Guy.airBorn = false;
        if (keys[4]) {
          
          Guy.velY = -3;
          
           Guy.airBorn = true;
        }
       
        
        }
       if (Guy.greatest(b) == 1) {
          Guy.x -=Guy.velX;
        Guy.power *= 0;
         // dir += 180;
        
       }
       if (Guy.greatest(b) == 2) {
         Guy.z -= Guy.velZ;
         Guy.power *= 0;
     //   dir += 180;
         
       }
        
        
        
        //velX *= -1;
        //velZ *= -1;
        
       
        
       
        
        
      
    
    
  
  }
  /*
  if (true){
     for (int i = 0; pos.size() -1 > i; i++) {
        //line(((float[])pos.get(i))[0],((float[])pos.get(i))[1],((float[])pos.get(i+1))[0],((float[])pos.get(i+1))[1]);
    
    }
  }
  */
}
  }
}

class car {
float damage = 1;
float carLocationY = 150;
float carLocationX = 150;
float yVel = 0;
float carHeading = 0;
float carSpeed = 0;
float steerAngle = 0;
float carLocationUp = 0;
float wheelBase = 5;
  void update() {
   

float frontWheelX = carLocationX + wheelBase/2 * cos(carHeading);
float frontWheelY = carLocationY + wheelBase/2 * sin(carHeading);

float backWheelX = carLocationX - wheelBase/2 * cos(carHeading);
float backWheelY = carLocationY - wheelBase/2 * sin(carHeading);

backWheelX += carSpeed * 1 * cos(carHeading);
backWheelY += carSpeed * 1 * sin(carHeading);

frontWheelX += carSpeed * 1 * cos(carHeading+steerAngle);
frontWheelY += carSpeed * 1 * sin(carHeading+steerAngle);

carLocationX = (frontWheelX + backWheelX) / 2;
carLocationY = (frontWheelY + backWheelY) / 2;
//carLocationUp += yVel/50.0; ignore for now

carHeading = atan2( frontWheelY - backWheelY , frontWheelX - backWheelX );
    
    if (keys[0]) {
    carSpeed += .05;
    }
    if (keys[1]) {
      if (carSpeed > .1) {
carSpeed *= .97;
      }
      else {
        carSpeed -= .02;
      }
    }
    if (keys[3]) {
 carHeading += .04/damage;
    }
    if (keys[2]) {
 carHeading -= .04/damage;
    }
   

    pushMatrix();
    translate(carLocationX,0,carLocationY);
   // box(15);
    popMatrix();
    /*
    ellipse(backWheelX,backWheelY,5,5);
     ellipse(frontWheelX,frontWheelY,5,5);
     ellipse(carLocationX,carLocationY,5,5);
     */
     
  }
  
}
void keyPressed() {
  if (key == 'w') {
    keys[0] = true;
  }
  if (key == 's') {
    keys[1] = true;
  }
   if (key == 'a') {
    keys[2] = true;
  }
  if (key == 'd') {
    keys[3] = true;
  }
  
  if (key == ' ') {
    keys[4] = true;
  }
  
}
void keyReleased() {
 if (key == 'w') {
    keys[0] = false;
  }
  if (key == 's') {
    keys[1] = false;
  }
  if (key == 'a') {
    keys[2] = false;
  }
  if (key == 'd') {
    keys[3] = false;
  }
 
  if (key == ' ') {
    keys[4] = false;
  }
}


class ball {
  float x,y,z;
  float dir = 0;  //use dir and power instead
  float power = 0;
  float velX,velY,velZ;
  float size = 10;
  float velZ2 = 0;
  boolean airBorn =false;
  ball (float x_, float y_,float z_) {
    x = x_;
    y = y_;
    z = z_;
    velX = 0;
    velY = -1;
    velZ = 0;
  }
  int greatest(float[] items) { 
    float high = items[0];
    int cur = 0;
    for (int i = 0; items.length > i; i++) {
      if (items[i] > high) {
        cur = i;
        high = items[i];
      }
    }
    return cur;
  }
  void update() {
    key();
    ArrayList pos = new ArrayList();
    //dir = mouseX;
     
       //((float[])pos.get(i))[3]/2
      
       
        
        
    //velY = 0; //REMOVE THIS
    
    velX = cos(radians(dir)) *power;
    velZ = sin(radians(dir)) * power;
    x += velX;
    //y is special for jumping
    z += velZ + velZ2;
    velZ2 = min(velZ2,1);
    y += velY;
    velY += .075;
   
    power *= .92; //NO FFRICTION
    
    pushMatrix();
    translate(x,y,z);
   
    stroke(0,255,0);
    
    stroke(255);
    popMatrix();
   
    if (y > 0) {
      //y = 0;
     // velY = 0;
    }
   
  
  }
  void key() {
    
     if (keys[2]) {
    //velZ2 -= .05;
  }
  if (keys[3]) {
    //velZ2 += .05;
  }
    if (keys[0]) {
      power = 1;
    }
    if (keys[1]) {
       power = -1;
    }
    
    
  }
}
class character {
  float x,y,z;
  BATTLE fight = new BATTLE(100,10,.05);
  String[] talk = {"hi","My name is James","Welcome to this game"};
  int talkVal = 0;
  character(float x_, float y_, float z_) {
    x = x_;
    y = y_;
    z = z_;
  }
  void show() {
     pushMatrix();
    translate(x,y,z);
    fill(250,0,0);
    box(15);
    noStroke();
    textSize(10);
    textAlign(CENTER);
    popMatrix();
    
  }
  void update(float X, float Y, float Z) {
    if (key == 't' && keyPressed) {
      if (talkVal+1 != talk.length ) {
      talkVal += 1;
      }
      
      key = '0';
    }
    show();
    
      if (dist(X,Y,Z,x,y,z) < 50) {
        text(talk[talkVal],x,y-40,z);
        you.fight(fight);
      }
      
      
  }
}
class BATTLE {
  float hp;
  float maxHp;
  float attack;
  float resistance = .1; //percent of damage blocked
  BATTLE(float hp_,float attack_,float res) {
    hp = hp_;
    maxHp = hp;
    attack = attack_;
    resistance = res;
  }
  void battleRound(BATTLE oppon) {
    oppon.hp -= attack * (1-oppon.resistance);
    hp -= oppon.attack* (1-resistance);
  }
  void fight(BATTLE oppon) {
    while(oppon.hp > 0 && hp > 0) {
      battleRound(oppon);
    }
  }
  boolean isDead(BATTLE oppon) {
     if(oppon.hp > 0 && hp > 0) {
      return true;
    }
    return false;
  }
  //take variables for char hp, attack, defence, etc
  //have function for battle that takes the opponent hp, etc.
}