class Curve {
  PVector parentPos;
  color col;
  int type;
  int start, end;
  PVector[] lookup;
  float a;

  Curve(PVector parentPos_, int start_, int end_, color col_) {
    parentPos = parentPos_.copy();
    col = col_;
    start = 0;//start_;
    end = end_;
    type = 2; // end - start;
    lookup = new PVector[6];
    a = start*TWO_PI/6;
    lookup[0] = new PVector(2*THIRD_PI, PI+ THIRD_PI);
    lookup[1] = new PVector(PI, 5*THIRD_PI);
    lookup[2] = new PVector(4*THIRD_PI, TWO_PI);
    lookup[3] = new PVector(-THIRD_PI, THIRD_PI);
    lookup[4] = new PVector(0, 2*THIRD_PI);
    lookup[5] = new PVector(THIRD_PI, PI);
  }

  void show() {
    noFill();
    stroke(col);
    strokeWeight(30);
    switch(type) {
    case 0:
      break;
    case 1:
      PVector shortC = PVector.add(parentPos, new PVector(R*cos(a), R*sin(a)));
      arc(shortC.x, shortC.y, R, R, lookup[start].x, lookup[start].y, OPEN);
      break;
    case 2:
      float wideR = 2*R*cos(PI/6);
      float wideA = PI/2;
      PVector longC = PVector.add(parentPos, new PVector(wideR*cos(wideA), wideR*(sin(wideA))));
      ellipse(longC.x, longC.y, 10, 10);
      arc(longC.x, longC.y, 2*wideR*cos(PI/6), 2*wideR*cos(PI/6), 4*THIRD_PI, 5*THIRD_PI, OPEN);
      arc(longC.x, -longC.y, 2*wideR*cos(PI/6), 2*wideR*cos(PI/6), THIRD_PI, 2*THIRD_PI, OPEN);     
      break;
    case 3:
      float sR = R*cos(PI/6); 
    }
  }
}
