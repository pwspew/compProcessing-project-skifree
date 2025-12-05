// SkiFree 25 — Full Main Sketch
// UI by Logan Bywater

color[] titleColors;
float colorTimer = 0;

char gameStateChar = 'M';   // M = Menu, G = Game, S = Stats, P = Pause, X = Settings
char gameDifficulty = 'E'; //E = Easy, M = Medium, H = Hard
float gameTimer = 0.00;
boolean gameTimerStarted = false;
float skierDistance = 0;
float skierSpeed = 0;
float skierHorizontalSpeed = 0;
PImage skierCrash, skier90, skier55, skier45, skierRight, skifreeLogo, skifreeLogo2;
float invincibleUntil = 0;

// Menu animation var
float z = 0, x = 0, a = 0, b = 0;
float speed = 2, speed2 = 2.1, speed3 = 2.2, speed4 = 2.3;

PFont title, title2, other;

Skier skier;
ArrayList<Obstacle> obstacles;

float D = 1.0;

void setup() {
  size(600, 900);

  textAlign(CENTER, CENTER);
  textSize(36);
  noStroke();

  title = createFont("Impacted.ttf", 15);
  other = createFont("theroblox.ttf", 7);
  title2 = createFont("impact.ttf", 8);

  titleColors = new color[] {
    color(180, 70, 70), color(190, 110, 70), color(200, 140, 70),
    color(210, 170, 70), color(190, 180, 80), color(140, 170, 100),
    color(100, 160, 120), color(90, 145, 160), color(100, 130, 180),
    color(130, 100, 170)
  };
  skifreeLogo = loadImage("skilogo2.png");
  skifreeLogo2 = loadImage("logo-1.png.png");
  skierCrash = loadImage("skiercrash.png");
  skier90 = loadImage("skier90fr.png");
  skier55 = loadImage("skier55.png");
  skier45 = loadImage("skier45fr.png");
  skierRight = loadImage("skierrightfr.png");

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
    statsscreen();
    break;

  case 'P':
    break;

  case 'X':
    break;
  }
}

void keyPressed() {
  // If stats screen is open, only allow 'R' to resume
  if (gameStateChar == 'S') {
    if (keyCode == 49 || keyCode == 97) {
    D = 1.0;
    }
    
    if (keyCode == 50 || keyCode == 98) {
    D = 1.5;
    }
    
    if (keyCode == 51 || keyCode == 99) {
    D = 2.0;
    }
    
    if (key == 'r' || key == 'R') {
      gameStateChar = 'G';   // resume
    }
    return;   // block all other keys
  }



  if (key == 's' || key == 'S') {
    if (gameStateChar == 'G') {
      gameStateChar = 'S';
    }
  }

  if (gameStateChar == 'S' && (key == 'r' || key == 'R')) {
    gameStateChar = 'G';
  }

  //if (gameStateChar) {}

  if (gameStateChar == 'M' && (key == ' ' || keyCode == 32)) {
    gameStateChar = 'G';
    restartgame();
  } else if (gameStateChar == 'G') {

    if (key == 'r' || key == 'R') {
      gameStateChar = 'M';
    }

    if (skier.crashSit == 0 && skierSpeed > 0 && random(1) < 1) {   // 1% chance per frame
      obstacles.add(
        new Obstacle(
        (float)random(50, width - 50),
        height + 100,
        int(random(0, 4))
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
    skierSpeed = 18 * D;
    skierHorizontalSpeed = 0 * D;
  } else if (skier.direction == -1) {
    skierSpeed = 13 * D;
    skierHorizontalSpeed = 3 * D;
  } else if (skier.direction == -2) {
    skierSpeed = 6 * D;
    skierHorizontalSpeed = 7 * D;
  } else if (skier.direction == -3) {
    skierSpeed = 0 * D;
    skierHorizontalSpeed = 0 * D;
  } else if (skier.direction == 3) {
    skierSpeed = 0 * D;
    skierHorizontalSpeed = 0 * D;
  } else if (skier.direction == 2) {
    skierSpeed = 6 * D;
    skierHorizontalSpeed = 7 * D;
  } else if (skier.direction == 1) {
    skierSpeed = 13 * D;
    skierHorizontalSpeed = 3 * D;
  }
  if (skier.crashSit == 1) {
    skierSpeed = 0 * D;
  }
  if (skier.direction < 0) {
    skierHorizontalSpeed = -abs(skierHorizontalSpeed); // skier leaning LEFT
  } else if (skier.direction > 0) {
    skierHorizontalSpeed = abs(skierHorizontalSpeed);  // skier leaning RIGHT
  }
  if (skier.crashSit == 1) {
    skierSpeed = 0 * D;
    skierHorizontalSpeed = 0 * D;
  }

  // --- If skier crashed, only allow recovery ---
  if (skier.crashSit == 1) {
    if (keyCode == LEFT || keyCode == RIGHT || keyCode == DOWN) {
      skier.crashSit = 0;
      skier.direction = 0;

      // PROTECTION STARTS HERE instead
      invincibleUntil = millis() + 2000;
    }
    return;
  }
}

void restartgame() {
  skier = new Skier(width/2, height/2 + 50);  // Spawn skier automatically
  obstacles.clear();
  gameTimer = 0.00;
  gameTimerStarted = false;
  skierDistance = 0;
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


  fill(c);
  rectMode(CENTER);
  rect(width/2, height/2 - 185, 480, 100);
  imageMode(CENTER);
  image(skifreeLogo, width/2, height/2 - 200);
  image(skifreeLogo2, width/2, height/2 + 125);
  skifreeLogo2.resize(400,200);
  textFont(title2);
  textSize(50);
  fill(255);
  //text("SkiFree 25", width/2, height/2 - 190);

  stroke(255);

  textFont(other);
  noStroke();
  textSize(30);
  text("Press space to Begin", width/2, height/2 - 40);

  textSize(22);
  fill(230);
  text("Ollie, Jamie, Ethan, Logan, Adam", width/2, height - 30);
}

void Gamestart() {
  background(230);

  if (gameTimerStarted) {
    gameTimer += 1.0 / frameRate; // adds time in seconds
  }

  skierDistance +=  (skierSpeed * (1.0 / frameRate));

  fill(200);

  // Display obstacles (but do not spawn new ones yet)
  if (skier.crashSit == 0 && skierSpeed > 0) {

    if (random(1) < 0.02 * D) {
      obstacles.add(new Obstacle(random(50, width-50), height+50, int(random(0, 4))));
    }

    if (skierHorizontalSpeed > 0 && random(1) < 0.02) {
      obstacles.add(new Obstacle(-50, random(50, height-50), int(random(0, 4))));
    }

    if (skierHorizontalSpeed < 0 && random(1) < 0.02) {
      obstacles.add(new Obstacle(width+50, random(50, height-50), int(random(0, 4))));
    }
  }

  // displaying the obstacles
  // displaying the obstacles and checking for crashes
  for (Obstacle o : obstacles) {
    o.display();

    // --- START CIRCULAR CRASH DETECTION ---

    float distance = dist(skier.x, skier.y, o.x, o.y);

    // Only collide if NOT invincible
    if (millis() > invincibleUntil) {
      if (distance < skier.hitRadius + o.hitRadius) {

        skier.crashSit = 1;
        skierSpeed = 0;
        skierHorizontalSpeed = 0;

        // Start 2-second protection AFTER recovery
        invincibleUntil = millis() + 500;  // 2000 ms = 2 seconds
      }
    }
  }

  // Removing off-screen obstacles to prevent memory problems
  for (int i = obstacles.size() - 1; i >= 0; i--) {
    Obstacle o = obstacles.get(i);
    if (o.y < -50 || o.y > height + 100 || o.x < -100 || o.x > width + 100) {
      obstacles.remove(i);
    }
  }

  rect(470, 100, 370, 130, 5);

  fill(0);
  textSize(20);
  text("Time: " + nf(gameTimer, 0, 2) + "s", 440, 55);
  text("Distance: " + nf(skierDistance, 0, 1) + "m", 445, 95);
  text("Speed: " + skierSpeed + "m/s", 445, 135);

  if (skier != null) {
    skier.display();
  }

  fill(0, 150);
  textSize(14);
  text("Use arrow keys to move | 'R' to Reset \n 'S' for Stats & Settings",
    width/2, height - 25);
}
void statsscreen() {
  background(50, 50, 80);
  fill(255);
  textSize(36);
  textAlign(CENTER, CENTER);
  text("Stats Screen", width/2, height/2 - 50);
  textSize(24);
  text("Time: " + nf(gameTimer, 0, 2) + "s", width/2, height/2);
  text("Distance: " + skierDistance + "m", width/2, height/2 + 40);
  text("Press 'R' to return", width/2, height - 50);
  text("Press 1 - Easy \n Press 2 - Medium \n Press 3 - Hard", width/2, height - 220);
}
