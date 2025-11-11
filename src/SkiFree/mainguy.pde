// Madeline H fabricated this class
class mainguy {
  PVector position, volocity;
  int health, x, y, speed;
  boolean moveL, moveR, moveU, moveD;
  //Pimage
 
  //Constructor
  mainguy() {
    x = width/2;
    y = height/2;
    health = 1;
    speed = 5;
    moveL = false;
    moveR = false;
    moveU = false;
    moveD = false;
    //image
  }
  
  void display() {
    //Pimage goes here once thats made
    rect(x, y, 20, 20);
  }
  
  void jump() {
    
  }
  
  //Cred: Chris Whitmire Lessons
  //Vid: Getting a Player to move Left and Right in Processing (v=jgr31WIYWdk)
  void move() {
    if (moveL == true) {
      x -= speed;
    }
    if (moveR == true) {
      x += speed;
    }
    if (moveU == true) {
      y -= speed;
    }
    if (moveD == true) {
      y += speed;
    }
  }
  
  void attack() {
    
  }
  
  void intersect() {
    
  }
  
}
