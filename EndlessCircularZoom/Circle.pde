class Circle {

  float d;
  color col;
  float t;
  boolean isFinished;

  Circle(color col_) {
    col = col_;
    isFinished = false;
  }

  void show() {
    fill(col);
    // stop updating once finished
    if(!isFinished){
      d = D*t/period; 
    }
    
    
    ellipse(0.5*(D-d)*cos(t), 0.5*(D-d)*sin(t), d, d);
    t += increment;
    if(t > period){
      isFinished = true;
    }
  }
}
