// Yetti Code 
Skier skier;
ArrayList<Obstacle> obstacles;
Yeti yeti;

float worldOffsetY = 0;
float verticalSpeed = 5;     // how fast the world scrolls
float distanceTravelled = 0; // track how far skier has gone
boolean gameOver = false;
boolean yetiAppeared = false;

void setup() {
  size(600, 800);
  skier = new Skier(width / 2, height - 150);

  obstacles = new ArrayList<Obstacle>();
  for (int i = 0; i < 60; i++) {
    float ox = random(50, width - 50);
    float oy = random(200, 6000);
    obstacles.add(new Obstacle(ox, oy));
  }

  yeti = new Yeti(width / 2, -200);
}

void draw() {
  background(200, 255, 255);

  if (!gameOver) {
    worldOffsetY += verticalSpeed;
    distanceTravelled += verticalSpeed;

    skier.update();

    // Draw obstacles relative to world offset
    for (Obstacle o : obstacles) {
      o.display(worldOffsetY);
    }

    // Spawn Yeti
    if (!yetiAppeared && distanceTravelled > 3000) {
      yetiAppeared = true;
      yeti.y = -200; // start above screen
      yeti.x = random(100, width - 100);
    }

    // Update and display Yeti
    if (yetiAppeared) {
      yeti.update(skier, worldOffsetY);
      yeti.display(worldOffsetY);

      // Check if Yeti catches skier
      if (yeti.hits(skier, worldOffsetY)) {
        gameOver = true;
      }
    }

    skier.display();

    // HUD
    fill(0);
    textSize(16);
    text("Distance: " + int(distanceTravelled), 20, 30);
  } else {
    textAlign(CENTER);
    textSize(32);
    fill(0);
    text("The Yeti Got You", width / 2, height / 2);
  }
}

// Controls
void keyPressed() {
  if (keyCode == LEFT) {
    skier.moveLeft();
  } else if (keyCode == RIGHT) {
    skier.moveRight();
  } else if (keyCode == DOWN) {
    skier.moveStraight();
  } else if (key == 'r' || key == 'R') {
    restart();
  }
}

void restart() {
  worldOffsetY = 0;
  distanceTravelled = 0;
  yetiAppeared = false;
  gameOver = false;
  skier = new Skier(width / 2, height - 150);
  yeti = new Yeti(width / 2, -200);
}


class Skier {
  float x, y;
  float speedX = 0;
  float maxSpeed = 6;

  Skier(float startX, float startY) {
    x = startX;
    y = startY;
  }

  void update() {
    x += speedX;
    x = constrain(x, 20, width - 20);
  }

  void moveLeft() { speedX = -maxSpeed; }
  void moveRight() { speedX = maxSpeed; }
  void moveStraight() { speedX = 0; }

  void display() {
    pushMatrix();
    translate(x, y);
    noStroke();
    fill(255, 50, 50);
    ellipse(0, 0, 20, 20);
    fill(0);
    rect(-15, 8, 30, 3); // skis
    popMatrix();
  }
}

class Obstacle {
  float x, y;
  float size;

  Obstacle(float x_, float y_) {
    x = x_;
    y = y_;
    size = random(20, 40);
  }

  void display(float offsetY) {
    float drawY = y - offsetY;
    if (drawY > -50 && drawY < height + 50) {
      fill(0, 150, 0);
      triangle(x, drawY - size, x - size/2, drawY, x + size/2, drawY);
    }
  }
}

class Yeti {
  float x, y;
  float speed = 2;
  boolean active = false;

  Yeti(float startX, float startY) {
    x = startX;
    y = startY;
  }

  void update(Skier s, float offsetY) {
    active = true;
    // Chase player
    float targetX = s.x;
    x += (targetX - x) * 0.02;
    y += speed;
  }

  void display(float offsetY) {
    float draw
}


