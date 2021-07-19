class Curve {
  boolean isDrawn;
  PVector[] cpts;
  int alpha;
  int stop;
  Curve(PVector[] cpts_) {
    cpts = cpts_;
    isDrawn = false;
    alpha = 255;
    stop = 1;
  }

  void update() {
    stop += 1;
    if (stop >= cpts.length - 1) {
      isDrawn = true;
      level = (level + 1)%4;
      println("Now progressing to level " + level);
      curves[level].stop = 1;
      curves[level].isDrawn = false;
    }
  }
  
  void drawPoints(){
    strokeWeight(4);
    stroke(0, 50);
    for(PVector p : cpts){
      point(p.x, p.y);
    }
  }

  void drawLine() {
    strokeWeight(2);
    if (isDrawn) {
      alpha = 25;
    } else {
      alpha = 255;
    }
    
    stroke(0, alpha);
    beginShape();
    for (int i = 0; i < stop; i++) {
      vertex(cpts[i].x, cpts[i].y);
    }
    endShape();
  }
}
