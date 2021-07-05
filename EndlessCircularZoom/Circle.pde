class Circle {

  float x, y, d;
  color col;
  boolean isFinished;

  Circle(color col_) {
    col = col_;
    isFinished = false;
  }

  void show(float parentD) {
    if(!isFinished){
      d = parentD*a/period; // stop updating once finished
    }
    fill(col);
    ellipse((parentD/2-d/2)*cos(-a-offset), (parentD/2 - d/2)*sin(-a-offset), d, d);
  }
}
