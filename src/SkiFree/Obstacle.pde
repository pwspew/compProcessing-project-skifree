// Obstacle code by Jamie Duersch
class Obstacle {
  float x, y; // position of obstacle
  int type;   // which obstacle image to use
  PImage img; // image for the obstacle
  float hitRadius;

  // Constructor 
  Obstacle(float x, float y, int type) {
    this.x = x;
    this.y = y;
    this.type =type
    this.hitRadius = 20;
  }

   // load obstacle images (moved so that it doesn't read the data every frame)
    if (type == 4) {
      img = loadImage("RampObstacle.png");
      }
    if (type == 3) {
      img = loadImage("RockObstacle.png");
    }
    if (type == 2) {
      img = loadImage("TreeObstacle.png");
    }
    if (type == 1) {
      img = loadImage("TreeObstacle2.png");
    }
    if (type == 0) {
      img = loadImage("RockObstacle2.png");
    }

  void display() {

    // Move obstacle relative to skier speed
    y -= skierSpeed * 0.5;
    x -= skierHorizontalSpeed * 0.5;

    if (img != null) {
      imageMode(CENTER);
      image(img, x, y, 50, 50); // draw obstacle images
    } else {
      // fallback in case image fails to load
      fill(0, 150, 0);
      noStroke();
      ellipse(x, y, 20, 20);
    }
  }
}
