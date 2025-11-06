// Logan Bywater | SkiFree UI | 11/6/25
// Title screen with smooth 10-color fade animation

color[] titleColors;
float colorTimer = 0;

void setup() {
  size(400, 600);
  textAlign(CENTER, CENTER);
  textSize(36);
  noStroke();

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
    color(255, 0, 0),       // red
  };
}

void draw() {
  drawTitleScreen();
}

void drawTitleScreen() {
  // --- Fade logic between colors ---
  colorTimer = millis() * 0.0005;          // adjust to control fade speed
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
  text("|| SkiFree ||️", width/2, height/2 - 120);
  stroke(2);

  textSize(18);
  text("Press SPACE to Begin", width/2, height/2 - 40);

  // --- Animated prompt glow ---
  float glow = abs(sin(millis() * 0.004)) * 255;
  fill(255, glow);
  text("Press SPACE to Begin", width/2, height/2 - 40);

  // --- Footer ---
  textSize(14);
  fill(230);
  text("Developed by: The SkiFree Group © (2025)", width/2, height - 30);
}
