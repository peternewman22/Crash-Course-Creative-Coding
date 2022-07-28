class Planet {
  PVector loc;
  PVector moonLoc;
  float a;
  float phase;
  float period;
  Planet(int col, int row) {
    loc = new PVector((col+0.5)*res, (row +0.5)*res);
    period = 1;
    phase = 0;
    moonLoc = new PVector(loc.x + 0.5*res*cos(period*a + phase), loc.y + 0.5*res*sin(period*a + phase));
  }

  void update() {
    a += 0.02;
    moonLoc.set(loc.x + 0.5*res*cos(period*a + phase), loc.y + 0.5*res*sin(period*a + phase));
  }

  void show() {
    ellipse(loc.x, loc.y, dotSize, dotSize);
    ellipse(moonLoc.x, moonLoc.y, dotSize, dotSize);
  }
}
