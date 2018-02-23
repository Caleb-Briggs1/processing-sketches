# What is the Leap Motion?
The Leap Motion allows you to recognize up to two hands and get information about their position and gestures. 

For example: 
![alt text](https://i.imgur.com/vKRDXap.png)

For this tutorial we will be using Processing. We are assuming that you already have processing working on your computer and a leap motion as well as a working library.

The most basic code is this:
```javascript
import de.voidplus.leapmotion.*; //1
LeapMotion leap; //2
void setup() {
  size(800, 500); //3
  leap = new LeapMotion(this); //4
}
void draw() {
  background(255); //5
  for (Hand hand : leap.getHands ()) { //6
      hand.draw();     //7
  }
}
```
#### What this code does
1. Import the Leap Motion library
2. Create a new LeapMotion object named leap
3. Set the size of the sketch, both of these can be any numbers
4. Instansiate the leap as a new LeapMotion
5. Set the background to white
6. Repeats for each hand it finds
7. Draws the hands

The Leap Motion comes with various default functions that can regonize gestures, see movement, and find the positions.

# The Main loop

Describe the for each loop here

# Recoginizing hands

One of the simplest functions in the Leap Motion is the isLeft() function. It returns a boolean that is true if the current hand is the left hand, and false otherwise. The couterpart to this function is the isRight() function, which returns true if the current hand is the right hand, and false otherwise.

In this example code, we show how to use those functions to change the color of the screen.


```javascript
/* 
Owen Grimm
February 16, 2018
A tutorial on how hand recognition works with the leap motion
The background is purple with both hands
    It is red with just the left hand
    And green with just the right hand
*/

import de.voidplus.leapmotion.*; 
LeapMotion leap;
void setup() {
  size(800, 500);
  leap = new LeapMotion(this);
}
void draw() {
  background(255); //set the background to white to override the color it was before
  
  boolean handLeft = false; //we assume neither hands are there by default, so we set both hands to false
  
  boolean handRight = false;  
  
  for (Hand hand : leap.getHands ()) { //loops through each hand 
  
  if (hand.isLeft()) { //if we see the left hand, set the boolean to true
    handLeft = true; 
  }
  
  if (hand.isRight() ) { //if we see the right hand, set the boolean to true
    handRight = true; 
  }
  
  }
 //we check after the loop
  if (handRight && handLeft) { //if both hands have been found
      background (200, 0, 200); //set the screen purple     
 } 
  else if (handLeft == true) { //if we see just the left hand
      background(200, 0, 0); //set the screeen red
 } 
  else if (handRight == true) { //if we see just the right hand
      background (0, 200, 0); //set the screen green
 }

}
```
# Using hand motion

The Leap Motion has the ability to track the motion and time of hands. Some important functions are handPosition(), which returns a PVector the your hand's position. There is also getVelocity() to get the finger velocity, getTimeVisible() for the fingers.

This code displays how a green background if the hand is near the middle and a red background otherwise
```javascript

LeapMotion leap;

void setup() {

  size(800, 500);

  leap = new LeapMotion(this);

}

void draw() {

  background(255);

  for (Hand hand : leap.getHands ()) {

      hand.draw();

    int     handId             = hand.getId();

    PVector handStabilized     = hand.getStabilizedPosition();

    PVector handPosition       = hand.getPosition();

   

    if(handPosition.x >= 205 && handPosition.x <= 405){

      background(0,255,0);

    } else{

      background(255,0,0);

    }

    }

}
```
By using this function(hand.getTimeVisible). This code displays the time when leap motion recognizes your hands.

```javascript
import de.voidplus.leapmotion.*;
LeapMotion leap;
void setup() {
  size(1000, 1000);
  leap = new LeapMotion(this);
}
void draw() {
  background(255);
  for (Hand hand : leap.getHands ()) {
  	hand.draw();
   float lifetimeOfThisHandObject = hand.timeVisible();//get time
  }
}

```
The Leap Motion can also recognize indiviual fingers. In this example, of the pinky finger is farther than 50 pixels from the left side of the screen the background will be blue otherwise it will be white.
```javascript
/* 
Griffin Lovato

leap_motion_game_2

February 20, 2018

The code within our project for fingers uses finger position to determine the x value of the pinkie. 
If the pinkie moves to or beyond x=50, then the background becomes blue. If the pinkie is below x=50, 
then the background remains white. Finger position can be used for any of the 5 fingers, recognizing them from both the 
left and right hands.
*/

import de.voidplus.leapmotion.*; 

LeapMotion leap;

void setup() {

  size(800, 500);

}
    



void draw() {

  background(255);
   leap = new LeapMotion(this);
  for (Hand hand : leap.getHands ()) {
    
     Finger  fingerThumb        = hand.getThumb();
    // or                        hand.getFinger("thumb");
    // or                        hand.getFinger(0);

    Finger  fingerIndex        = hand.getIndexFinger();
    // or                        hand.getFinger("index");
    // or                        hand.getFinger(1);

    Finger  fingerMiddle       = hand.getMiddleFinger();
    // or                        hand.getFinger("middle");
    // or                        hand.getFinger(2);

    Finger  fingerRing         = hand.getRingFinger();
    // or                        hand.getFinger("ring");
    // or                        hand.getFinger(3);

    Finger  fingerPink         = hand.getPinkyFinger();
    // or                        hand.getFinger("pinky");
    // or                        hand.getFinger(4);
    if(fingerPink.getPosition().x > 50) {
      background(0,0,255);
    }
  }
}

```

# Using Gestures

The Leap Motion has the abliity to recogonize gestures. For example, you can recognize the grab of your hand with getHandGrab(). In this exmaple, we show how to use getPinchStrength(). 

This is what the sketch looks like when not pinching
![alt text](https://i.imgur.com/xCHFYUY.png)

This is what it looks like when pinching
![alt text](https://i.imgur.com/u7S4eHG.png)
```javascript
//This is an example of pinch strength//
/*
The function “hand.getPinchStrength();” measures if your hand is pinching on a scale from 0.0-1.0, 
in this case 1.0 is full contact. The example sketch changes the screen color with the strength of the pinch after 
reading the gesture and at the end it prints the value in the command line. First by setting up the base example code 
and then adding the variable for the pinch strength so it will be used correctly and then creating an if loop to 
change the color of the screen by the value of strength. 
*/
import de.voidplus.leapmotion.*;

LeapMotion leap;

void setup() {

  size(800, 500);

  leap = new LeapMotion(this);

}

void draw() {

  background(255);

  float handPinch=0;

  for (Hand hand : leap.getHands ()) {

      hand.draw();

      handPinch = hand.getPinchStrength();

      //below is where if the strength is greater than five then the screen goes from white to blue//

      if ( handPinch>=0.5) {

        background(0,0,255);

      }

      else { background(255,255,255);}

     

  }

  //this line was for testing if the sketch is reading the strength//

println(handPinch);

}

```

The leap motion can also recgonize things such as handYaw and handPitch. In this example we show how to use handYaw and handPitch.
```javascript
/*
Pitching and yawing are simple hand gestures that can be recognized in the LeapMotion. 
A pitch is a simple upward gesture with the hand, and a yaw is a similar, horizontal action. 
When you yaw your hand, the screen turns a shade of blue. When you pitch your hand, the screen turns pink. 


*/
import de.voidplus.leapmotion.*;

LeapMotion leap;

void setup() {
  strokeWeight(5);
  size(800, 500);
  leap = new LeapMotion(this);
}






void draw() {
  background(255);
  // ...

  int fps = leap.getFrameRate();
  for (Hand hand : leap.getHands ()) {

    float   handPitch          = hand.getPitch();
    float   handYaw            = hand.getYaw();
   

int yaw= round(handYaw*(1));
println(yaw);
if((yaw>-40)||(yaw>=-20)){
  background(0);
}

    

    
      


    
  
}
}
```
This example shows how to use handgrab to change the background color.
```javascript
// Tutorial on "handGrab"
/*-----------------------------------------
  handGrab is a leap motion variable that gives values between 0 - 1.
  When the hand is open the value of hangGrab is 0. When the hand
  creates a fist it gives the value of 1. In this sketch when the hand
  is closed the background is green, but if the hand isn't closed then 
  background is red.
*/
import de.voidplus.leapmotion.*;

LeapMotion leap;

void setup() {
  size(800, 500);
  leap = new LeapMotion(this);
}

void draw() {
  background(255);
  
  for (Hand hand : leap.getHands ()) {
    hand.draw();
  float handGrab    = hand.getGrabStrength();
  
    if (handGrab >= 0.5) {
    background(0,255,0);
  } else { 
    background(255,0,0);
  }
  }

}
```
This example shows how to use the handRoll to change the background color
```javascript
// handRoll tutorial
 /*------------------------------
   handRoll is a variable that gives a value between 0 and 1. handRoll
   measures the roll of your hand, for instance if your palm is facing
   down the variable is 0. And if your palm is facing up then it gives
   the value of 0.5. In this code if your hand is facing up then the
   screen will be green and if your hand is facing down the the screen
   will be red.
 */

import de.voidplus.leapmotion.*;

LeapMotion leap;

void setup() {
  size(800, 500);

  
  leap = new LeapMotion(this);
}

void draw() {
  background(255);
  
  for (Hand hand : leap.getHands ()) {
    hand.draw();
  float handRoll    = hand.getRoll();
  
    if (handRoll >= 0.25 && handRoll <= 0.75) {
    background(0,255,0);
  } else { 
    background(255,0,0);
  }
  }

}

```
