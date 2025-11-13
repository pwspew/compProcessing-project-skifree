//This code is not compatible with the SkiFree main class
//The class following is compatible
//class Skier {
//  float x, y;
//  float dir = 0;
//  int direction = 0;

//  Skier(float x, float y) {
//    this.x = x;
//    this.y = y;
//  }

//  void update() {}

//  void display() {
//    pushMatrix();
//    translate(x, y);
//    if (direction == -2) draw90LeftCharacter();
//    else if (direction == -1) drawLeftCharacter();
//    else if (direction == 1) drawRightCharacter();
//    else if (direction == 2) draw90RightCharacter();
//    else drawStraightCharacter();
//    popMatrix();
//  }

//  void drawStraightCharacter() {
//    fill(255, 0, 0);
//    ellipse(0, 0, 20, 20);
//  }

//  void drawLeftCharacter() {}
//  void draw90LeftCharacter() {}
//  void drawRightCharacter() {}
//  void draw90RightCharacter() {}
//}
class Skier {
  float x, y;
  float dir = 0;      // -1 = left, 0 = straight, 1 = right
  int direction = 0;  // -1 = left, 0 = straight, 1 = right

  Skier(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void update(){}

  void display() {
    pushMatrix();
    translate(x, y);

    // Swap entire character depending on direction
    if (direction == -2) draw90LeftCharacter();
    else if (direction == -1) drawLeftCharacter();
    else if (direction == 1) drawRightCharacter();
    else if (direction == 2) draw90RightCharacter();
    else drawStraightCharacter();

    popMatrix();
  }

  // ---------- Characters ----------
  void drawStraightCharacter() {}

  void drawLeftCharacter() {}
  
  void draw90LeftCharacter() {}

  void drawRightCharacter() {}
  
  void draw90RightCharacter() {}
