// Logan Bywater | SkiFree UI | 11/6/25
// Title screen 10-color fade animation

color[] titleColors;
float colorTimer = 0;

String gameState; // "TITLE" or "GAME"

// --- Game Objects ---
// These will be "called into existence" by key presses
Skier skier;
//Yeti yeti;
// Use an ArrayList, which is perfect for adding unknown number of objects
ArrayList<Obstacle> obstacles;


// --- Main Setup ---
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
    color(192, 112, 224),   // Lavender
  };
  
  // Initialize the ArrayList
  obstacles = new ArrayList<Obstacle>();
}


// --- Main Draw Loop (State Router) ---
// This function checks the game state and calls the correct drawing function
void draw() {
  if (gameState.equals("TITLE")) {
    drawTitleScreen();
  } else if (gameState.equals("GAME")) {
    drawGameScreen();
  }
}

// --- Input Handling ---
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
  text("SkiFree 2025", width/2, height/2 - 190);
  stroke(255);
  strokeWeight(5);
  line(width/4 - 15, height/2 - 90, 3 * width/4 +15, height/2 - 90);
  line(width/4 - 5, height/2 - 70, 3 * width/4 +5, height/2 - 70);
  line(width/4 - 5, height/2 - 10, 3 * width/4 +5, height/2 - 10);
  line(width/4 - 15, height/2 + 10, 3 * width/4 +15, height/2 + 10);
  line(width/2 - 125, height/2 - 90, width/2 - 125, height/2 - 140 ); // Tree trunk
  line(175, 310, 165, 325); // Leaves #1
  line(175, 310, 185, 325);
  line(175, 325, 165, 340);
  line(175, 325, 185, 340);
  line(225, 300, 225, 209); // Tree trunk
  line(150, 140, 160, 160); // Leaves #2
  line(150, 140, 140, 160);
  line(150, 160, 160, 180);
  line(150, 160, 140, 180);
  line(200, 160, 200, 209); // Tree trunk
  line(200, 161, 210, 175); // Leaves #3
  line(200, 161, 190, 175);
  line(200, 176, 210, 190);
  line(200, 176, 190, 190);
  line(250, 140, 250, 209); // Tree trunk
  line(250, 140, 260, 160); // Leaves #4
  line(250, 140, 240, 160);
  line(250, 160, 260, 180);
  line(250, 160, 240, 180);
  line(300, 160, 300, 209); // Tree trunk
  line(300, 161, 310, 175); // Leaves #5
  line(300, 161, 290, 175);
  line(300, 176, 310, 190);
  line(300, 176, 290, 190);
  strokeWeight(2);
  stroke(2);

  textSize(18);
  fill(255); // Reset fill color for text
  noStroke(); // Reset stroke for text
  text("Press SPACE to  Begin", width/2, height/2 - 40);

  // --- Animated prompt glow ---
    //float glow = abs(sin(millis() * 0.060)) * 255;
    //fill(255, glow);
    //text("Press SPACE to Begin", width/2, height/2 - 40);

  // --- Footer ---
  textSize(14);
  fill(230);
  text("Developed by the goats a.k.a. Ollie, Jamie, Ethan, Logan, and Adam", width/2, height - 30);
}

// This is the new game screen function
void drawGameScreen() {
  // Draw a white "snow" background
  background(245, 245, 255);

  // --- Draw all game objects ---
  // We "call" them by telling them to display themselves
  
  // Draw all the obstacles
  // Iterate over the ArrayList
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

  // --- UI Text ---
  fill(0, 150);
  textSize(16);
  textAlign(CENTER, CENTER);
  noStroke(); // Make sure text isn't stroked
  text("Press 'S' (Skier), 'Y' (Yeti), 'O' (Obstacle) | 'R' to Reset", width / 2, height - 25);
}
