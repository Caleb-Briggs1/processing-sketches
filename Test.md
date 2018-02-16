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

In this example code, we show how to use those ffunctions to change the color of the screen.

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
  background(255);
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

