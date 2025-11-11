// Logan Bywater | SkiFree UI | 11/6/25
// Title screen 10-color fade animation

color[] titleColors;
float colorTimer = 0;

String gameState; // "TITLE" or "GAME"
Skier skier;
ArrayList<Obstacle> obstacles;

void setup() {
  size(600, 900);
  textAlign(CENTER, CENTER);
  textSize(36);
  noStroke();

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
    color(192, 112, 224),   // Lavender
  };
  
  obstacles = new ArrayList<Obstacle>();
}

void draw() {
  if (gameState.equals("TITLE")) {
    drawTitleScreen();
  } else if (gameState.equals("GAME")) {
    drawGameScreen();
  }
}

void keyPressed() {
  // If we're on the TITLE screen and SPACE is pressed
  if (gameState.equals("TITLE") && (key == ' ' || keyCode == 32)) {
    // Change the state to GAME
    gameState = "GAME";
    // And "call into existence" all the game objects
    setupGame();
  }
  // If we're in the GAME
  else if (gameState.equals("GAME")) {
    
    // 'R' to Reset
    if (key == 'r' || key == 'R') {
      // Reset back to the TITLE screen
      gameState = "TITLE";
    }
    
    // --- This is your new logic ---
    
    // 'S' to spawn Skier (if one doesn't exist)
    if (key == 's' || key == 'S') {
      if (skier == null) { // Only add one skier
        skier = new Skier(width / 2, height / 2 + 50);
      }
    }
    
    // 'Y' to spawn Yeti (if one doesn't exist)
    //if (key == 'y' || key == 'Y') {
    //   if (yeti == null) { // Only add one yeti
    //    yeti = new Yeti(width / 2, 100);
    //   }
    }
    
    // 'O' to spawn a new Obstacle
    if (key == 'o' || key == 'O') {
      // "Call" a new obstacle into existence
      float oX = random(width);
      float oY = random(150, height - 50); // Spawn them below yeti's typical area
      int oType = (int)random(2); // 0 for tree, 1 for rock
      obstacles.add(new Obstacle(oX, oY, oType));
    }
  }


// --- Game Setup Function ---
// This is called ONCE when you press SPACE from the title screen
void setupGame() {
  // "Call into existence" the Skier, Yeti, and Obstacles by instantiating them
  
  // Start with no objects
  skier = null;
  //yeti = null;
  
  // Clear any old obstacles from the previous game
  obstacles.clear();
}


// --- Drawing Functions ---

// This is your NEW title screen function
void drawTitleScreen() {
  // --- Fade logic between colors ---
  colorTimer = millis() * 0.0002;         // adjust to control fade speed
  int idx1 = int(colorTimer) % titleColors.length;
  int idx2 = (idx1 + 1) % titleColors.length;
  float blendAmt = colorTimer - int(colorTimer);
  color c = lerpColor(titleColors[idx1], titleColors[idx2], blendAmt);

  // --- Background ---
  background(c);

  // --- Overlay for contrast ---
  fill(0, 120);
  rect(0, 0, width, height);

  // --- Title Text ---
  fill(255);
  textSize(48);
  text("SkiFree 2025", width/2, height/2 - 200);
  stroke(255);
  strokeWeight(5);
  line(width/4 - 15, height/2 - 90, 3 * width/4 +15, height/2 - 90);
  line(width/4 - 5, height/2 - 70, 3 * width/4 +5, height/2 - 70);
  line(width/4 - 5, height/2 - 10, 3 * width/4 +5, height/2 - 10);
  line(width/4 - 15, height/2 + 10, 3 * width/4 +15, height/2 + 10);
  line(200, 260, 200, 309); // Tree trunk
  line(200, 261, 210, 275); // Leaves #1
  line(200, 261, 190, 275);
  line(200, 276, 210, 290);
  line(200, 276, 190, 290);
  line(250, 240, 250, 309); // Tree trunk
  line(250, 240, 260, 260); // Leaves #2
  line(250, 240, 240, 260);
  line(250, 260, 260, 280);
  line(250, 260, 240, 280);
  line(300, 260, 300, 309); // Tree trunk
  line(300, 261, 310, 275); // Leaves #3
  line(300, 261, 290, 275);
  line(300, 276, 310, 290);
  line(300, 276, 290, 290);
  line(350, 240, 350, 309); // Tree trunk
  line(350, 240, 360, 260); // Leaves #4
  line(350, 240, 340, 260);
  line(350, 260, 360, 280);
  line(350, 260, 340, 280);
  line(400, 310, 400, 359); // Tree trunk
  line(400, 311, 410, 325); // Leaves #5
  line(400, 311, 390, 325);
  line(400, 326, 410, 340);
  line(400, 326, 390, 340);
  strokeWeight(2);
  stroke(2);

  textSize(18);
  fill(255); 
  noStroke(); 
  text("Press SPACE to start", width/2, height/2 - 40);


  // --- Footer ---
  textSize(14);
  fill(230);
  text("Developed by the goats a.k.a. Ollie, Jamie, Ethan, Logan, and Adam", width/2, height - 30);
}

void drawGameScreen() {
  background(245, 245, 255);
  for (Obstacle o : obstacles) {
    o.display();
  }
  
  // Draw the Yeti 
  //if (yeti != null) {
  //  yeti.display();
  //}
  
  // Draw the Skier
  if (skier != null) {
    skier.display();
  }

  fill(0, 150);
  textSize(16);
  textAlign(CENTER, CENTER);
  noStroke(); // Make sure text isn't stroked
  text("Press 'S' (Skier), 'Y' (Yeti), 'O' (Obstacle) | 'R' to Reset", width / 2, height - 25);
}
