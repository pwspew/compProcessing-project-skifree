class Skier {
  float x, y;
  float dir = 0;
  int direction = 0;
  PImage img; // image for the obstacle

  Skier(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void update() {}

  void display() {
    if (direction == -3) drawLeftCharacter();
    if (direction == -2) draw75LeftCharacter();
    else if (direction == -1) draw35LeftCharacter();
    else if (direction == 0) drawStraightCharacter();
    else if (direction == 1) draw35RightCharacter();
    else if (direction == 2) draw75RightCharacter();
    else if (direction == 3) drawRightCharacter();
  }

  void drawStraightCharacter() {
    img = loadImage("skier90fr.png");
          imageMode(CENTER);
      image(img, x, y, 75, 75); // draw skier
  }
  void drawLeftCharacter() {
  
  }
  void draw90LeftCharacter() {
      img = loadImage("skier90fr.png");
          imageMode(CENTER);
      image(img, x, y, 50, 50); // draw skier
  }
  void drawRightCharacter() {
      img = loadImage("skier55.png");
          imageMode(CENTER);
      image(img, x, y, 75, 75); // draw skier
  }
  void draw90RightCharacter() {
      img = loadImage("skierrightfr.png");
          imageMode(CENTER);
      image(img, x, y, 50, 50); // draw skier
  }
}
