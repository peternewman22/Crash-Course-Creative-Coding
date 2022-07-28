class Wall {
  PVector c;
  float a;
  float xOff, yOff;
  boolean isShifting;
  boolean isLeft;
  float d;
  float colD;
  int colour;
  Wall(float x, float y, float a_) {
    c = new PVector(x, y);
    a = a_;
    isLeft = a > 0;
    isShifting = false;
    d = maxDist;
    colD = PVector.dist(centre, c);
    colour = int(map(colD, 0, maxDist/2, 0, 360));
  }

  void update() {
    d = PVector.dist(c, l.p);
    
    if (isShifting) {
      if (isLeft) {
        a -= HALF_PI/animSteps;
        if (a <= -QUARTER_PI) {
          isShifting = false;
          isLeft = !isLeft;
        }
      } else {
        a += HALF_PI/animSteps;
        if (a >= QUARTER_PI) {
          isShifting = false;
          isLeft = !isLeft;
        }
      }
    } else {
      isShifting = random(1) < 0.0001;
    }
  }

  void show() {
    int alpha = int(map(d, 0, maxDist/2, 255, 0));
    stroke(colour, 255, 255, alpha);
    //stroke(255);
    //point(c.x, c.y);
    line(c.x - res/2*cos(a), c.y - res/2*sin(a), c.x + res/2*cos(a), c.y + res/2*sin(a));
  }
}
