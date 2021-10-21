class Clock {
  // clock hand angles wrap between -PI and PI
  float a1, a2;
  boolean a1Finished, a2Finished;
  PVector pos;
  Clock(float a1_, float a2_, float x, float y) {
    a1 = a1_;
    a2 = a2_;
    pos = new PVector(x, y);
  }

  
  void update(float a1Target, float a2Target) {
    // only update if not finished
    if(!a1Finished){
      if(a1Target < a1){
        a1 -= increment;
      } else {
        a1 += increment;
      }
    }
    wrap(a1);
    if(abs(a1Target - a1) < 0.01){
      a1Finished = true;
    }
    
        if(!a2Finished){
      if(a2Target < a2){
        a2 -= increment;
      } else {
        a2 += increment;
      }
    }
    wrap(a2);
    if(abs(a2Target - a2) < 0.01){
      a2Finished = true;
    }
  }

  void show() {
    noStroke();
    ellipse(pos.x, pos.y, 2*r, 2*r);
    stroke(0);
    line(pos.x, pos.y, pos.x + r*cos(a1), pos.y + r*sin(a1));
    line(pos.x, pos.y, pos.x + r*cos(a2), pos.y + r*sin(a2));
  }
  
  void wrap(float a){
    if(a < -PI){
      a += TWO_PI;
    } else if(a > PI){
      a -= TWO_PI;
    }
    
  }
}
