//Yetti code 
// Yetti Code 
Skier skier;
ArrayList<Obstacle> obstacles;
Yeti yeti;

float worldOffsetY = 0;
float verticalSpeed = 5;   
float distanceTravelled = 0;
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


//NOT FINISHED YET



