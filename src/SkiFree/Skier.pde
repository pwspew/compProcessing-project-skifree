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
    if (direction == -1) drawLeftCharacter();
    else if (direction == 1) drawRightCharacter();
    else drawStraightCharacter();

    popMatrix();
  }

  // ---------- Characters ----------
  void drawStraightCharacter() {
    fill(255, 0, 0); rect(-7, -10, 14, 20); // body
    fill(0, 0, 255); rect(-6, 10, 12, 15); // legs
    stroke(120, 60, 0); strokeWeight(3);
    line(-10, 10, -6, 45); line(10, 10, 6, 45); // skis
    noStroke(); fill(0); rect(-10, 25, 6, 10); rect(4, 25, 6, 10); // boots
    fill(255, 220, 180); ellipse(0, -17, 12, 12); // head
    fill(0); rect(-6, -26, 12, 3); fill(50, 50, 255); rect(-4, -31, 8, 5); // hat
    stroke(0); strokeWeight(1); line(-10, -5, -18, 25); line(10, -5, 18, 25); // poles
    stroke(1); strokeWeight(2); // face/buttons
    line(0,1,0,1); line(0,5,0,5); line(0,-4,0,-4);
    line(-3,-20,-3,-20); line(3,-20,3,-20);
  }

  void drawLeftCharacter() {
    fill(200, 50, 50); rect(-8, -10, 16, 22); // body
    fill(0, 0, 200); rect(-7, 10, 14, 16); // legs
    stroke(100, 50, 0); strokeWeight(3); line(-12, 10, -18, 48); line(12, 10, 6, 45); // skis
    noStroke(); fill(0); rect(-12, 25, 6, 12); rect(6, 25, 6, 12); // boots
    fill(255, 200, 150); ellipse(0, -18, 12, 12); // head
    fill(0); rect(-7, -27, 14, 3); fill(80, 80, 255); rect(-5, -32, 10, 5); // hat
    stroke(0); strokeWeight(1); line(-12, -5, -22, 28); line(12, -5, 14, 28); // poles
    stroke(1); strokeWeight(2); // head/buttons
    line(-3,1,-3,1); line(-3,5,-3,5); line(-3,-4,-3,-4);
    line(-4,-20,-4,-20); line(1,-20,1,-20);
  }

  void drawRightCharacter() {
    fill(255, 100, 100); rect(-6, -11, 12, 21); // body
    fill(0, 0, 150); rect(-6, 10, 12, 15); // legs
    stroke(150, 80, 0); strokeWeight(3); line(-10, 10, -6, 45); line(10, 10, 16, 48); // skis
    noStroke(); fill(0); rect(-10, 25, 6, 10); rect(4, 25, 6, 10); // boots
    fill(255, 220, 180); ellipse(0, -17, 12, 12); // head
    fill(0); rect(-6, -26, 12, 3); fill(50, 100, 255); rect(-4, -31, 8, 5); // hat
    stroke(0); strokeWeight(1); line(-10, -5, -16, 28); line(10, -5, 22, 28); // poles
    stroke(1); strokeWeight(2); // head/buttons
    line(3,1,3,1); line(3,5,3,5); line(3,-4,3,-4);
    line(4,-20,4,-20); line(-1,-20,-1,-20);
  }

  // ---------- Movement ----------
  void moveLeft() {
    dir = -1;
    direction = -1;
  }

  void moveRight() {
    dir = 1;
    direction = 1;
  }

  void moveStraight() {
    dir = 0;
    direction = 0;
  }
}
