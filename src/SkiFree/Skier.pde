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
