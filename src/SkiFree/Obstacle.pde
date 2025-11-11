class Obstacle {
  float x, y;
  int type;
  Obstacle(float x, float y, int type) {
    this.x = x;
    this.y = y;
    this.type =type;
  }

  void display() {
    fill(0, 150, 0);
    noStroke();
    ellipse(x, y, 20, 20);
  }
}
