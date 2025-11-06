Skier skier;
ArrayList<Obstacle> obstacles;
float worldOffsetY = 0;
float verticalSpeed = 5; // how fast the world scrolls

void setup() {
  size(600, 800);
  skier = new Skier(width / 2, 150); // top-middle

  obstacles = new ArrayList<Obstacle>();
  // Create some obstacles for testing
  for (int i = 0; i < 50; i++) {
    obstacles.add(new Obstacle(random(50, width - 50), random(200, 5000)));
  }
}

void draw() {
  background(200, 255, 255);

  // Move world downwards to simulate skier going forward
  worldOffsetY += verticalSpeed;

  // Update skier horizontal position
  skier.update();

  // Draw obstacles relative to worldOffsetY
  for (Obstacle o : obstacles) {
    o.display(worldOffsetY);
  }

  // Draw skier on top
  skier.display();

  // Optional: remove obstacles that have passed
  obstacles.removeIf(o -> o.y - worldOffsetY > height + 50);
}

// Key controls
void keyPressed() {
  if (keyCode == LEFT) {
    skier.moveLeft();
  } else if (keyCode == RIGHT) {
    skier.moveRight();
  } else if (keyCode == DOWN) {
    skier.moveStraight();
  }
}
