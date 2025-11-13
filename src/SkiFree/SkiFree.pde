// Logan Bywater | SkiFree UI | 11/6/25
// Title screen 10-color fade animation

color[] titleColors;
float colorTimer = 0;

String gameState; // "TITLE" or "GAME"
float z = 0; //Title screen moving objects
float x = 0;
float a = 0;
float b = 0;
float speed = 2; //Title screen moving objects
float speed2 = 2.1;
float speed3 = 2.2;
float speed4 = 2.3;

//Game Objects
Skier skier;
//Yeti yeti;
ArrayList<Obstacle> obstacles;

//Main Setup
void setup() {
  size(600, 900);
  textAlign(CENTER, CENTER);
  textSize(36);
  noStroke();

  // Start at the title screen
  gameState = "TITLE";

  // Define 10 colors for the fade cycle
  titleColors = new color[] {
    color(255, 100, 100),   // red-pink
    color(255, 180, 80),    // orange
    color(255, 255, 100),   // yellow
    color(150, 255, 150),   // light green
    color(100, 200, 255),   // sky blue
    color(150, 100, 255),   // purple
    color(255, 120, 200),   // magenta
    color(80, 80, 255),     // deep blue
    color(100, 255, 200),   // teal
    color(192, 112, 224),   // lavender
  };
  
  // Initialize the ArrayList
  obstacles = new ArrayList<Obstacle>();
}

// Main Draw
void draw() {
  if (gameState.equals("TITLE")) {
    drawTitleScreen();
  } else if (gameState.equals("GAME")) {
    drawGameScreen();
  }
}

// Input Handling
void keyPressed() {
  // If we're on the TITLE screen and SPACE is pressed
  if (gameState.equals("TITLE") && (key == ' ' || keyCode == 32)) {
    // Change the state to GAME
    gameState = "GAME";
    setupGame();
  }
  
  // If we're in the GAME
  else if (gameState.equals("GAME")) {
    // 'R' to Reset
    if (key == 'r' || key == 'R') {
      gameState = "TITLE";
    }

    // 'S' to spawn Skier (if one doesn't exist)
    if (key == 's' || key == 'S') {
      if (skier == null) {
        skier = new Skier(width / 2, height / 2 + 50);
      }
    }

    // 'Y' to spawn Yeti (if one doesn't exist)
    //if (key == 'y' || key == 'Y') {
    //  if (yeti == null) {
    //    yeti = new Yeti(width / 2, 100);
    //  }
    //}

    // 'O' to spawn a new Obstacle
    if (key == 'o' || key == 'O') {
      float oX = random(width);
      float oY = random(150, height - 50);
      int oType = (int)random(2); // 0 for tree, 1 for rock
      obstacles.add(new Obstacle(oX, oY, oType));
    }
  }
}

//Game Setup Function
void setupGame() {
  skier = null;
  //yeti = null;
  obstacles.clear();
}

// Drawing Functions 

// Title screen fade animation
void drawTitleScreen() {
  colorTimer = millis() * 0.0002;
  int TC1 = int(colorTimer) % titleColors.length;
  int TC2 = (TC1 + 1) % titleColors.length;
  float blendColor = colorTimer - int(colorTimer);
  color c = lerpColor(titleColors[TC1], titleColors[TC2], blendColor);
  
  background(c);
  
  // --- Overlay ---
  fill(0, 120);
  rect(0, 0, width, height);

  // --- Moving rectangles ---
  fill(255); // reset fill to white so they show up
  noStroke();

  rect(z + 150, height/2 + 2, 20, 15, 5);
  z += speed;
  if (z > width/2 - 10 || z < -10) 
  speed *= -1;

  rect(x + 150, height/2 - 18, 20, 15, 5);
  x += speed2;
  if (x > width/2 - 10 || x < -10) 
  speed2 *= -1;

  rect(a + 150, height/2 - 78, 20, 15, 5);
  a += speed3;
  if (a > width/2 - 10 || a < -10) 
  speed3 *= -1;

  rect(b + 150, height/2 - 98, 20, 15, 5);
  b += speed4;
  if (b > width/2 - 10 || b < -10) 
  speed4 *= -1;
  
  // Title Text
  fill(255);
  textSize(48);
  text("SkiFree 2025", width/2, height/2 - 190);
  stroke(255);
  strokeWeight(5);
  line(width/4 - 15, height/2 - 90, 3 * width/4 +15, height/2 - 90);
  line(width/4 - 5, height/2 - 70, 3 * width/4 +5, height/2 - 70);
  line(width/4 - 5, height/2 - 10, 3 * width/4 +5, height/2 - 10);
  line(width/4 - 15, height/2 + 10, 3 * width/4 +15, height/2 + 10);

  strokeWeight(2);
  stroke(2);
  textSize(18);
  fill(255);
  noStroke();
  text("Press SPACE to Begin", width/2, height/2 - 40);

  // Footer
  textSize(14);
  fill(230);
  text("Developed by the goats a.k.a. Ollie, Jamie, Ethan, Logan, and Adam", width/2, height - 30);
}

// Game screen
void drawGameScreen() {
  background(245, 245, 255);

  for (Obstacle o : obstacles) {
    o.display();
  }

  //if (yeti != null) yeti.display();

  if (skier != null) {
    skier.display();
  }

  fill(0, 150);
  textSize(16);
  textAlign(CENTER, CENTER);
  noStroke();
  text("Press 'S' (Skier), 'Y' (Yeti), 'O' (Obstacle) | 'R' to Reset", width / 2, height - 25);
}
