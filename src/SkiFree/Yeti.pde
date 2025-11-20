// Yeti Code | Adam Fredrick | NOV 11 2025

class Yeti {
  float x, y;
  float speed = 2;

  Yeti(float startX, float startY) {
    x = startX;
    y = startY;
  }

  void update() {
    y += speed;
    if (y > height + 100) {
      y = -100;
      x = random(100, width - 100);
    }
  }

  void display(float offsetY) {
    float drawY = y - offsetY;

    pushMatrix();
    translate(x, drawY);
    stroke(1);

    fill(255);
    ellipse(0, 40, 60, 60); // body
    ellipse(0, 0, 40, 40);  // head


    fill(0);
    ellipse(-10, -5, 8, 8);
    ellipse(10, -5, 8, 8);

    popMatrix();
  }
}
