class Spark {
  PVector p;
  float w;
  float h;
  float a;
  float colA;
  int brightIx;
  Spark(float x, float y, float a_) {
    p = new PVector(x, y);
    h = res/sqrt(2);
    w = 1.6*h/4;
    a = a_;
  }

  void show() {
    noStroke();
    colA = map(a, 0, TWO_PI, 180, 360);
    brightIx = int(map(colA, 180, 360, 100, 255));
    fill(int(colA),255,brightIx);
    //colIx = int(map(a,0,TWO_PI,180,300));
    //brightIx = int(255 + 100*sin(map(a,0,TWO_PI,180,300)));
    //if (abs(colA - 240) < 20) {
    //  fill(int(colA), 255, 150);
    //} else {
    //  fill(int(colA), 255, 255);
    //}

    ellipse(p.x, p.y, res, res);
    pushMatrix();
    translate(p.x, p.y);
    rotate(a);
    fill(60, 255, 255, 255);
    beginShape();
    vertex(-1/16*w, -h/2);
    vertex(-1/16*w, -h/16);
    vertex(w/2, -h/8);
    vertex(0, h/2);
    vertex(w/16, h/16);
    vertex(-w/2, h/8);
    endShape(CLOSE);
    popMatrix();
  }
}
