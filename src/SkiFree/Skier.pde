// ollie made this class
// logan made all the sprites to work and stuff
class Skier {
  float x, y;
  int direction = -2;
  int crashSit = 1;
  PImage img;
  float hitRadius = 7; //Change this so that the skier fits the crash radius

  Skier(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void display() {
    if (crashSit == 1) {
      drawCrashSitCharacter();
    } else {
      if (direction == -3) drawLeftCharacter();
      else if (direction == -2) draw50LeftCharacter();
      else if (direction == -1) draw35LeftCharacter();
      else if (direction == 0) drawStraightCharacter();
      else if (direction == 1) draw35RightCharacter();
      else if (direction == 2) draw50RightCharacter();
      else if (direction == 3) drawRightCharacter();
    }
  }

  // Flipping logic
  void drawFlipped(PImage img, float x, float y, float w, float h) {
    pushMatrix();
    translate(x+20, y);  
    scale(-1, 1); 
    imageMode(CENTER); 
    image(img, 0, 0, w, h);
    popMatrix();
  }

  void drawCrashSitCharacter() {
    //img = loadImage("skiercrash.png");
    imageMode(CENTER);
    image(skierCrash, x, y, 50, 50);
  }

  void drawStraightCharacter() {
    //img = loadImage("skier90fr.png");
    imageMode(CENTER);
    image(skier90, x, y, 50, 50);
  }

  void draw35LeftCharacter() {
    //img = loadImage("skier55.png");
    drawFlipped(skier55, x - 40, y, 50, 50);
  }

  void draw50LeftCharacter() {
    //img = loadImage("skier45fr.png");
    drawFlipped(skier45, x - 40, y, 50, 50);
  }

  void drawLeftCharacter() {
    //img = loadImage("skierrightfr.png");
    drawFlipped(skierRight, x - 40, y, 50, 50);
  }

  void draw35RightCharacter() {
    //img = loadImage("skier55.png");
    imageMode(CENTER);
    image(skier55, x, y, 50, 50);
  }

  void draw50RightCharacter() {
    //img = loadImage("skier45fr.png");
    imageMode(CENTER);
    image(skier45, x, y, 50, 50);
  }

  void drawRightCharacter() {
    //img = loadImage("skierrightfr.png");
    imageMode(CENTER);
    image(skierRight, x, y, 50, 50);
  }
}
