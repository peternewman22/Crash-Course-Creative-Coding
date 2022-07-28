class Arch {
  PVector c;
  Petal[] petals;
  Arch(float x, float y) {
    c = new PVector(x, y);
    petals = new Petal[5];
    for (int i = 0; i < 5; i++) {

      float px = c.x - r + r*cos(i*PI/6);
      float py = c.y - r + r*sin(i*PI/6);
      petals[i] = new Petal(px, py);
    }
  }

  void show() {
    noFill();
    //arc(c.x+r, c.y, D, D, 0, PI, OPEN);
    //arc(c.x-r, c.y, D, D, 0, PI, OPEN);
    for (Petal p : petals) {
      float a = PVector.sub(p.c, c).heading();
      pushMatrix();
      translate(p.c.x, p.c.y);
      rotate(a*2);
      p.show();
      popMatrix();
    }
  }
}
