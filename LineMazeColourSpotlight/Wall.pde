class Wall {
  PVector p;
  boolean isLefttoRight;
  Wall(float x, float y) {
    p = new PVector(x, y);
    isLefttoRight = random(1) < 0.5;
  }

  void show() {
    //stroke(0,255, 255);
    float d = PVector.dist(mouse, p);
    int col = int(map(d,0,maxDist,1,360));
    stroke(col, 255, 255);
    if (isLefttoRight) {
      line(p.x, p.y, p.x + res, p.y + res);
    } else {
      line(p.x + res, p.y, p.x, p.y + res );
    }
  }
}
