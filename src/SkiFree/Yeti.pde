// Yeti Code | Adam Fredrick

Yeti yeti;
float worldOffsetY = 0;
float verticalSpeed = 2;

void setup() {
  size(600, 900);
  yeti = new Yeti(width / 2, -100);
}

void draw() {
  background(#D6D6D6);

  worldOffsetY += verticalSpeed;

  yeti.update();
  yeti.display(worldOffsetY);
}

// Yeti class
class Yeti {
  float x, y;
  float speed = 2;

  Yeti(float startX, float startY) {
    x = startX;
    y = startY;
  }

  void update() {
    y += speed; // moves down the screen
    if (y > height + 100) {
      y = -100;           
      x = random(100, width - 100); // randomize position
    }
  }

  void display(float offsetY) {
    float drawY = y - offsetY;
    pushMatrix();
    translate(x, drawY);
    noStroke();
    fill(255);
    ellipse(0, 0, 40, 40);   // head
    ellipse(0, 40, 60, 60);  // body
    fill(0);
    ellipse(-10, -5, 8, 8);  // eyes
    ellipse(10, -5, 8, 8);
    popMatrix();
  }
}

