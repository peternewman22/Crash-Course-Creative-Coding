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
    /*strokeWeight(1);
    beginShape();
    for(int i = 0; i < 6; i ++){
       vertex(rM*cos(PI/6 +i*TWO_PI/6), rM*sin(PI/6 + i*TWO_PI/6));
    }
    endShape(CLOSE);
    */
    //strokeWeight(10);
    // draw the pattern
    
    switch(state){
      case 0:
        line(r*cos(-THIRD_PI), r*sin(-THIRD_PI), -r*cos(-THIRD_PI), -r*sin(-THIRD_PI));
        arc(rM*cos(PI/6), rM*sin(PI/6),rM, rM, 5*PI/6, 3*HALF_PI);
        arc(-rM*cos(PI/6), -rM*sin(PI/6),rM, rM, -PI/6, HALF_PI);
        break;
      case 1:
        line(r*cos(-THIRD_PI), r*sin(-THIRD_PI), -r*cos(-THIRD_PI), -r*sin(-THIRD_PI));
         arc(2*r*cos(-THIRD_PI), 2*r*sin(-THIRD_PI),3.5*r, 3.5*r, HALF_PI, 5*PI/6);
         arc(2*r*cos(4*PI/6), 2*r*sin(4*PI/6),3.5*r, 3.5*r, -HALF_PI, -PI/6);      
        break;
      case 2:
        arc(rM*cos(-HALF_PI), rM*sin(-HALF_PI), rM, rM, PI/6, 5*PI/6);
        arc(2*r*cos(THIRD_PI), 2*r*sin(THIRD_PI),3.5*r, 3.5*r, 7*PI/6, 3*HALF_PI);
        arc(2*r*cos(2*THIRD_PI), 2*r*sin(2*THIRD_PI),3.5*r, 3.5*r, -HALF_PI, -PI/6);
        break;
      case 3:
        arc(rM*cos(-HALF_PI), rM*sin(-HALF_PI), rM, rM, PI/6, 5*PI/6);
        arc(rM*cos(PI/6), rM*sin(PI/6), rM, rM, 5*PI/6, 3*HALF_PI);
        arc(rM*cos(5*PI/6), rM*sin(5*PI/6), rM, rM, -HALF_PI, PI/6);
      
        break;
    }
    
    
    popMatrix();
  }
}
