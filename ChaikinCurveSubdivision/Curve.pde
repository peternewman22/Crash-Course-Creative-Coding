class Curve {
  boolean isDrawn;
  PVector[] cpts;
  int alpha;
  Curve(PVector[] cpts_) {
    cpts = cpts_;
    isDrawn = false;
    alpha = 0;
  }

  void drawLine(int stop) {
    if(isDrawn){
      alpha = 50;
    }
    stroke(0, alpha);
    beginShape();
    for (int i = 0; i < stop; i++) {
      vertex(cpts[i].x, cpts[i].y);
    }
    endShape();
  }
}
