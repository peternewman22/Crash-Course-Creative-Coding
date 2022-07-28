class Hex{
  PVector pos;
  float a;
  int state;
  Hex(float x, float y){
    pos = new PVector(x,y);
    a = int(random(6)) * TWO_PI/6;
    //a = 0;
    state = int(random(4));
    //state = 3;
  }
  
  void show(){
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(a);
    
    // draw the hex
    strokeWeight(1);
    beginShape();
    for(int i = 0; i < 6; i ++){
       vertex(rMajor*cos(PI/6 +i*TWO_PI/6), rMajor*sin(PI/6 + i*TWO_PI/6));
    }
    endShape(CLOSE);
    
    strokeWeight(10);
    // draw the pattern
    
    switch(state){
      case 0:
        line(rMinor*cos(-THIRD_PI), rMinor*sin(-THIRD_PI), -rMinor*cos(-THIRD_PI), -rMinor*sin(-THIRD_PI));
        arc(rMajor*cos(PI/6), rMajor*sin(PI/6),rMajor, rMajor, 5*PI/6, 3*HALF_PI);
        arc(-rMajor*cos(PI/6), -rMajor*sin(PI/6),rMajor, rMajor, -PI/6, HALF_PI);
        break;
      case 1:
        line(rMinor*cos(-THIRD_PI), rMinor*sin(-THIRD_PI), -rMinor*cos(-THIRD_PI), -rMinor*sin(-THIRD_PI));
         arc(2*rMinor*cos(-THIRD_PI), 2*rMinor*sin(-THIRD_PI),3.5*rMinor, 3.5*rMinor, HALF_PI, 5*PI/6);
         arc(2*rMinor*cos(4*PI/6), 2*rMinor*sin(4*PI/6),3.5*rMinor, 3.5*rMinor, -HALF_PI, -PI/6);      
        break;
      case 2:
        arc(rMajor*cos(-HALF_PI), rMajor*sin(-HALF_PI), rMajor, rMajor, PI/6, 5*PI/6);
        arc(2*rMinor*cos(THIRD_PI), 2*rMinor*sin(THIRD_PI),3.5*rMinor, 3.5*rMinor, 7*PI/6, 3*HALF_PI);
        arc(2*rMinor*cos(2*THIRD_PI), 2*rMinor*sin(2*THIRD_PI),3.5*rMinor, 3.5*rMinor, -HALF_PI, -PI/6);
        break;
      case 3:
        arc(rMajor*cos(-HALF_PI), rMajor*sin(-HALF_PI), rMajor, rMajor, PI/6, 5*PI/6);
        arc(rMajor*cos(PI/6), rMajor*sin(PI/6), rMajor, rMajor, 5*PI/6, 3*HALF_PI);
        arc(rMajor*cos(5*PI/6), rMajor*sin(5*PI/6), rMajor, rMajor, -HALF_PI, PI/6);
      
        break;
    }
    
    
    popMatrix();
  }
}
