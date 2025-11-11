//Ellie Jacobsen (she also made the cool king art)
class king {
  int x, y;
  PImage king;
  
  void King() {
    x=10;
    y=10;
    king = loadImage("king.png");
  }

  void display() {
    image(king, x, y);
  }
  void move() {
  }
}
