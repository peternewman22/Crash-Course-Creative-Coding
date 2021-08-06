class Hex {
  float rx, ry, t;
  PVector c;
  PVector[] vTops, vBots;
  Hex(float x, float y, float r_, float t_) {
    c = new PVector(x, y);
    rx = r_;
    ry = r_/2;
    t = t_;
    vTops = new PVector[6];
    vBots = new PVector[6];
    findVertices();
  }

  void findVertices() {
    for (int i = 0; i < 6; i++) {
      float a = i*TWO_PI/6;
      vTops[i] = new PVector(c.x + rx*cos(-a), c.y + ry*sin(-a));
      vBots[i] = new PVector(c.x + rx*cos(-a), c.y + ry*sin(-a) + t);
    }
  }

  void show() {
    fill(0);
    stroke(255);
    // draw bottom
    beginShape();
    for (int i = 0; i < 6; i++) {
      vertex(vBots[i].x, vBots[i].y);
    }
    endShape(CLOSE);

    //// draw sides
    for (int i = 0; i < 6; i++) {
      int start = i;
      int end = (i+1)%6;
      beginShape();
        vertex(vTops[start].x, vTops[start].y);
        vertex(vBots[start].x, vBots[start].y);
        vertex(vBots[end].x, vBots[end].y);
        vertex(vTops[end].x, vTops[end].y);
      endShape(CLOSE);
    }


    // draw top
    beginShape();
    for (int i = 0; i < 6; i++) {
      vertex(vTops[i].x, vTops[i].y);
    }
    endShape(CLOSE);

    // label vertices
    fill(255);
    for (int i = 0; i < 6; i++) {
      text(i, vTops[i].x, vTops[i].y-20);
    }
  }
}
