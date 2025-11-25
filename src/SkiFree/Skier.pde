// SkiFree 25 — Full Main Sketch
// UI by Logan Bywater

color[] titleColors;
float colorTimer = 0;

char gameStateChar = 'M';   // M = Menu, G = Game, S = Stats, P = Pause, X = Settings
float gameTimer = 0.00;
boolean gameTimerStarted = false;
float skierDistance = 0;
float skierSpeed = 0;

// Menu animation var
float z = 0, x = 0, a = 0, b = 0;
float speed = 2, speed2 = 2.1, speed3 = 2.2, speed4 = 2.3;

PFont title, title2, other;

Skier skier;
ArrayList<Obstacle> obstacles;

void setup() {
  size(600, 900);

  textAlign(CENTER, CENTER);
  textSize(36);
  noStroke();

  title = createFont("Impacted.ttf", 15);
  other = createFont("cityburn-⌐.ttf", 7);
  title2 = createFont("impact.ttf", 8);

  titleColors = new color[] {
    color(180, 70, 70), color(190, 110, 70), color(200, 140, 70),
    color(210, 170, 70), color(190, 180, 80), color(140, 170, 100),
    color(100, 160, 120), color(90, 145, 160), color(100, 130, 180),
    color(130, 100, 170)
  };

  obstacles = new ArrayList<Obstacle>();
}

void draw() {
  switch (gameStateChar) {
  case 'M':
    titlescreen();
    break;

  case 'G':
    Gamestart();
    break;

  case 'S':
    break;

  case 'P':
    break;

  case 'X':
    break;
  }
}

void keyPressed() {
  
  if (gameStateChar == 'M' && (key == ' ' || keyCode == 32)) {
    gameStateChar = 'G';
    restartgame();
  } else if (gameStateChar == 'G') {

    if (key == 'r' || key == 'R') {
      gameStateChar = 'M';
    }

if (key == 'o' || key == 'O') {
  obstacles.add(
    new Obstacle(
      (float)random(50, width - 50),    // random X inside screen
      (float)random(50, height - 50),   // random Y inside screen
      int(random(0, 4))                 // random type 0–3
    )
  );
}
  
    // Skier movement
    if (keyCode == RIGHT) {
      skier.direction++;
      if (skier.direction > 3) skier.direction = 3;   // clamp max turn
      skier.crashSit = 0;
    }

    if (keyCode == LEFT) {
      skier.direction--;
      if (skier.direction < -3) skier.direction = -3; // clamp max turn
      skier.crashSit = 0;
    }

    if (keyCode == DOWN) {
      skier.direction = 0;
      skier.crashSit = 0;
    }
  }
  if (!gameTimerStarted && (keyCode == DOWN || keyCode == LEFT || keyCode == RIGHT)) {
    gameTimerStarted = true;
  }

  if (skier.direction == 0) {
    skierSpeed = 18;
  } else if (skier.direction == -1) {
    skierSpeed = 13;
  } else if (skier.direction == -2) {
    skierSpeed = 6;
  }
}

void restartgame() {
  skier = new Skier(width/2, height/2 + 50);  // Spawn skier automatically
  obstacles.clear();
  gameTimer = 0.00;
  gameTimerStarted = false;
}

void titlescreen() {
  colorTimer = millis() * 0.0002;
  int TC1 = int(colorTimer) % titleColors.length;
  int TC2 = (TC1 + 1) % titleColors.length;
  float blend = colorTimer - int(colorTimer);
  color c = lerpColor(titleColors[TC1], titleColors[TC2], blend);

  background(c);

  fill(255);
  noStroke();
  rectMode(CORNER);

  rect(z+150, height/2+2, 20, 15, 5);
  z += speed;
  if (z > width/2 - 10 || z < -10) speed *= -1;

  rect(x+150, height/2-18, 20, 15, 5);
  x += speed2;
  if (x > width/2 - 10 || x < -10) speed2 *= -1;

  rect(a+150, height/2-78, 20, 15, 5);
  a += speed3;
  if (a > width/2 - 10 || a < -10) speed3 *= -1;

  rect(b+150, height/2-98, 20, 15, 5);
  b += speed4;
  if (b > width/2 - 10 || b < -10) speed4 *= -1;

  fill(c);
  rectMode(CENTER);
  rect(width/2, height/2 - 185, 480, 100);

  textFont(title2);
  textSize(65);
  fill(255);
  text("SkiFree 25", width/2, height/2 - 190);

  stroke(255);
  line(width/4 - 15, height/2 - 90, 3*width/4 + 15, height/2 - 90);
  line(width/4 - 5, height/2 - 70, 3*width/4 + 5, height/2 - 70);
  line(width/4 - 5, height/2 - 10, 3*width/4 + 5, height/2 - 10);
  line(width/4 - 15, height/2 + 10, 3*width/4 + 15, height/2 + 10);

  textFont(other);
  noStroke();
  textSize(23);
  text("Press space to Begin", width/2, height/2 - 40);

  textSize(14);
  fill(230);
  text("Developed by Ollie, Jamie, Ethan, Logan, and Adam", width/2, height - 30);
}

void Gamestart() {
  background(245, 245, 255);

  if (gameTimerStarted) {
    gameTimer += 1.0 / frameRate; // adds time in seconds
  }

  fill(200);

  // Display obstacles (but do not spawn new ones yet)
  for (Obstacle o : obstacles) {
    o.display();
  }

  rect(470, 100, 270, 130, 10);

  fill(0);
  textSize(30);
  text("Time: " + nf(gameTimer, 0, 2) + "s", 440, 55);
  text("Distance: " + skierDistance + "m", 445, 95);
  text("Speed: " + skierSpeed + "m/s", 445, 135);

  if (skier != null) {
    skier.display();
  }

  fill(0, 150);
  textSize(16);
  text("Use arrow keys to move | 'R' to Reset",
    width/2, height - 25);
}
