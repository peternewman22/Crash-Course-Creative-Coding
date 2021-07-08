class Circle {

  float d;
  color col;
  float t;
  int multiplier;
  boolean isFinished;

  Circle(color col_,int multiplier_) {
    col = col_;
    isFinished = false;
    multiplier = multiplier_;
  }

  void show() {
    fill(col);
    // stop updating once finished
    if(!isFinished){
      d = D*t/period; 
    }
    
    
    ellipse(0.5*(D-d)*cos(multiplier*t), 0.5*(D-d)*sin(multiplier*t), d, d);
    t += increment;
    if(t > period){
      isFinished = true;
    }
  }
}
