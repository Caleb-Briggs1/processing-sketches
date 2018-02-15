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
  for (Hand hand : leap.getHands ()) {
      hand.draw();     //6
  }
}
```
#### What this code does


