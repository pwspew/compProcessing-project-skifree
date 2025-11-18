class Skier {
  float x, y;
  float dir = 0;
  int direction = 3;
  PImage img; // image for the obstacle

  Skier(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void update() {}

  void display() {
    if (direction == -3) drawLeftCharacter();
    else if (direction == -2) draw75LeftCharacter();
    else if (direction == -1) draw35LeftCharacter();
    else if (direction == 0) drawStraightCharacter();
    else if (direction == 1) draw35RightCharacter();
    else if (direction == 2) draw75RightCharacter();
    else if (direction == 3) drawRightCharacter();
  }

  void drawStraightCharacter() {
    img = loadImage("skier90fr.png");
    imageMode(CENTER);
    image(img, x, y, 75, 75);
  }

  void draw35LeftCharacter() {
    img = loadImage("skier55.png");
    imageMode(CENTER);
    image(img, x, y, -75, 75);  
  }

  void draw75LeftCharacter() {
    img = loadImage("skier45fr.png");
    imageMode(CENTER);
    image(img, x, y, -75, 75);  
  }

  void drawLeftCharacter() {
    img = loadImage("skierrightfr.png");
    imageMode(CENTER);
    image(img, x, y, -75, 75);  
  }
  void draw35RightCharacter() {
    img = loadImage("skier55.png");
    imageMode(CENTER);
    image(img, x, y, 75, 75);
  }

  void draw75RightCharacter() {
    img = loadImage("skier45.png");
    imageMode(CENTER);
    image(img, x, y, 75, 75);
  }

  void drawRightCharacter() {
    img = loadImage("skierrightfr.png");
    imageMode(CENTER);
    image(img, x, y, 75, 75);
  }
}
