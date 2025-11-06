class Obstacle {
  float x, y;

  Obstacle(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void display(float offsetY) {
    fill(0, 150, 0);
    noStroke();
    ellipse(x, y - offsetY, 20, 20); // adjust size or shape as needed
  }
}
