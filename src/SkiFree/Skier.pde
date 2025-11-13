class Skier {
  float x, y;
  float dir = 0;
  int direction = 0;

  Skier(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void update() {}

  void display() {

    if (direction == -2) draw90LeftCharacter();
    else if (direction == -1) drawLeftCharacter();
    else if (direction == 1) drawRightCharacter();
    else if (direction == 2) draw90RightCharacter();
    else drawStraightCharacter();

  }

  void drawStraightCharacter() {
    fill(255, 0, 0);
    ellipse(100, 100, 20, 20);
    
  }

  void drawLeftCharacter() {}
  void draw90LeftCharacter() {}
  void drawRightCharacter() {}
  void draw90RightCharacter() {}
}
