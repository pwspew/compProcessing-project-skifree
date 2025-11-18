// Ethan Shafran | Nov 11 2025 | SkierTricks
class SkierTricks {
  float x, y;
  float vy = 0;
  float gravity = 0.6;
  float jumpForce = -12;
  boolean isOnGround = true;

  SkierTricks(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void update() {
    // Apply gravity
    vy += gravity;
    y += vy;

    // Check ground collision (simple ground plane near bottom)
    if (y > height / 2 + 50) {
      y = height / 2 + 50;
      vy = 0;
      isOnGround = true;
    }
  }

  void jump() {
    if (isOnGround) {
      vy = jumpForce;
      isOnGround = false;
    }
  }

  void display () {
    update();

    // Simple skier: a circle
    fill(0, 100, 255);
    ellipse(x, y, 30, 30);

    // Optional: add skies
    stroke(0);
    line(x - 10, y + 15, x + 10, y + 15);
  
}
}
