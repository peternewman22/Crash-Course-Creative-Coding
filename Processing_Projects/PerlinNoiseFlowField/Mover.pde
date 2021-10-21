class Mover {
  PVector p;
  PVector v;
  PVector a;
  int ix;


  Mover(float x, float y, int ix_) {
    p = new PVector(x, y);
    ix = ix_;
    v = PVector.random2D();
    a = new PVector(0, 0);

  }

  void applyForce(PVector f) {
    a.add(f);
  }

  void follow() {
    PVector desired = field.lookup(p);
    desired.mult(maxSpeed);
    PVector steer = PVector.sub(desired, v);
    steer.limit(maxForce);
    applyForce(steer);
  }


  void update() {
     //wrapping around in the x direction
    //if (p.x < 0) {
    //  p.x = width;
    //} else if (p.x > width) {
    //  p.x = 0;
    //}
    //wrapping around in the y direction
    if (p.y < 0) {
      p.y = height;
    } else if (p.y > height) {
      p.y = 0;
    }

    follow();
    v.add(a);
    //heading = v.heading();
    p.add(v);
    a.mult(0);
  }


  void show() {
    stroke(255);
    noFill();
    //ellipse(p.x, p.y, r, r);
     //check the other movers
    for (int i = 0; i < movers.length; i++) {
      // don't self check
      if (movers[i].ix != ix) {
        float d = PVector.dist(p, movers[i].p);
        if (d < 2 * r) {
          // map the grayscale
          int tint = int(map(d, r/4, 2 * r, 255, 50));
          stroke(tint);
          line(p.x, p.y, movers[i].p.x, movers[i].p.y);
          //PVector c2c = PVector.sub(movers[i].p,p);
          //PVector midPt = PVector.add(c2c.div(2),p);
          //line(midPt.x + 0.5*d*cos(heading + HALF_PI), midPt.y + 0.5*d*sin(heading + HALF_PI), midPt.x - 0.5*d*cos(heading + HALF_PI), midPt.y - 0.5*d*sin(heading + HALF_PI));
        }
      }
    }
  }
}
