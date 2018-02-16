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
