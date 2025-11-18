class Skier {
  float x, y;
  int direction = -2;
  PImage img;

  Skier(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void display() {
    if (direction == -3) drawLeftCharacter();
    else if (direction == -2) draw75LeftCharacter();
    else if (direction == -1) draw35LeftCharacter();
    else if (direction == 0) drawStraightCharacter();
    else if (direction == 1) draw35RightCharacter();
    else if (direction == 2) draw75RightCharacter();
    else if (direction == 3) drawRightCharacter();
  }

  // Flipping logic
  void drawFlipped(PImage img, float x, float y, float w, float h) {
    pushMatrix();
    translate(x, y);
    scale(-1, 1);  // mirror horizontally
    imageMode(CENTER);
    image(img, 0, 0, w, h);
    popMatrix();
  }
  
  void drawStraightCharacter() {
    img = loadImage("skier90fr.png");
    imageMode(CENTER);
    image(img, x, y, 75, 75);
  }
  void draw35LeftCharacter() {
    img = loadImage("skier55.png");
    drawFlipped(img, x, y, 75, 75);
  }

  void draw75LeftCharacter() {
    img = loadImage("skier45fr.png");
    drawFlipped(img, x, y, 75, 75);
  }

  void drawLeftCharacter() {
    img = loadImage("skierrightfr.png");
    drawFlipped(img, x, y, 75, 75);
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
