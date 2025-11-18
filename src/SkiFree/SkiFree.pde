//UI by Logan Bywater

color[] titleColors;
float colorTimer = 0;
char gameStateChar = 'M'; //M = Menu, G = Game, S = Stats, P = Pause, X = Settings (Hard, Easy, medium)/speed
float gameTimer = 0.00;
float skierDistance = 00;
float skierSpeed = 00;

float z = 0;
float x = 0;
float a = 0;
float b = 0;
float speed = 2;
float speed2 = 2.1;
float speed3 = 2.2;
float speed4 = 2.3;
PFont title, title2, other;
Skier skier;
//Yeti yeti;
ArrayList<Obstacle> obstacles;

//thanks daFont.com for all the cool fonts and stuff
void setup() {
  size(600, 900);
  
  textAlign(CENTER, CENTER);
  textSize(36);
  noStroke();
  
  title = createFont("Impacted.ttf", 15);
  other = createFont("cityburn-⌐.ttf", 7);
  title2 =createFont("impact.ttf", 8);

  titleColors = new color[] {
  color(180, 70, 70),    // muted red
  color(190, 110, 70),   // muted red-orange
  color(200, 140, 70),   // muted orange
  color(210, 170, 70),   // muted yellow-orange
  color(190, 180, 80),   // muted yellow
  color(140, 170, 100),  // muted yellow-green
  color(100, 160, 120),  // muted green
  color(90, 145, 160),   // muted teal / cyan
  color(100, 130, 180),  // muted blue
  color(130, 100, 170)   // muted purple
  };

  obstacles = new ArrayList<Obstacle>();
}

void draw() {
  switch (gameStateChar) {
  
    case 'M': // Menu
    titlescreen();
    break;
    
    case 'G': //Running Game
    Gamestart();
    break;
    
    case 'S': // Stats (needed)
    //statsScreen();
    break;
    
    case 'P':   // Pause (if you add one later)
      // pauseScreen();
      break;

    case 'X':   // Settings
      // settingsScreen();
      break;
  }
}
  
void keyPressed() {

  if (gameStateChar == 'M' && (key == ' ' || keyCode == 32)) {

    gameStateChar = 'G';
    restartgame();
  }


  else if (gameStateChar == 'G') {

    if (key == 'r' || key == 'R') {
      gameStateChar = 'M';
    }


    if (key == 's' || key == 'S') {
      if (skier == null) {
        skier = new Skier(width / 2, height / 2 + 50);
      }
    }

    if (key == 'o' || key == 'O') {
      float oX = random(width);
      float oY = random(150, height - 50);
      int oType = (int)random(4); 
      obstacles.add(new Obstacle(oX, oY, oType));
    }
  }
}


void restartgame() {
  skier = null;
  obstacles.clear();
}




void titlescreen() {
  colorTimer = millis() * 0.0002;
  int TC1 = int(colorTimer) % titleColors.length;
  int TC2 = (TC1 + 1) % titleColors.length;
  float blendColor = colorTimer - int(colorTimer);
  color c = lerpColor(titleColors[TC1], titleColors[TC2], blendColor);

  background(c);
  
  fill(255);
  noStroke();
 rectMode(CORNER);
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
  fill(c);
    noStroke();
    rectMode(CENTER);
    rect(width/2, height/2 - 185, 480, 100);
    fill(255);
textAlign(CENTER, CENTER);
  textFont(title2);
  textSize(65);
  fill(255);
  text("SkiFree 25", width/2  , height/2 - 190);
  textFont(title);
   textSize(80);
  
  //text("FREE", width/2  , height/2 - 194);
  stroke(255);
  strokeWeight(2);
  line(width/4 - 15, height/2 - 90, 3 * width/4 +15, height/2 - 90);
  line(width/4 - 5, height/2 - 70, 3 * width/4 +5, height/2 - 70);
  line(width/4 - 5, height/2 - 10, 3 * width/4 +5, height/2 - 10);
  line(width/4 - 15, height/2 + 10, 3 * width/4 +15, height/2 + 10);

  textFont(other);
  strokeWeight(2);
  stroke(2);
  textSize(23);
  fill(255);
  noStroke();
  text("Press space to Begin", width/2, height/2 - 40);


  textSize(14);
  fill(230);
  text("Developed by Ollie, Jamie, Ethan, Logan, and Adam", width/2, height - 30);

}

// Game screen
void Gamestart() {
  background(245, 245, 255);
  fill(200);
  rect(470,100,200,130);
  fill(0);
  textSize(30);
  text("Time: " + gameTimer, 430,55);
  text("Distance: " + skierDistance + "m", 465, 95);
  text("Speed: " + skierSpeed + "m/s", 465, 135);
  
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
