// Obstacle code by Jamie Duersch
class Obstacle {
  float x, y;
  int type;
  PImage img; // image for the obstacle

  // Constructor
  Obstacle(float x, float y, int type) {
    this.x = x;
    this.y = y;
    this.type =type;
  }


  void display() {
    
    y -= skierSpeed * 0.5;
    x -= skierHorizontalSpeed * 0.5;

    // load obstacle images
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
    if (img != null) {
      imageMode(CENTER);
      image(img, x, y, 50, 50); // draw tree and rock images
    } else {
      // fallback in case image fails to load
      fill(0, 150, 0);
      noStroke();
      ellipse(x, y, 20, 20);
    }
  }
}
