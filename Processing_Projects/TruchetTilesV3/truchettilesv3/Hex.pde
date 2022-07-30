class Hex{
  PVector pos;
  int state;
  float a;
  Hex(float x, float y){
    pos = new PVector(x,y);
    state = int(random(4));
    a = int(random(6))*TWO_PI/6;
  }
  
  void show(){
    
    //beginShape();
    //  for(int i = 0; i < 6; i ++){
    //    vertex(pos.x + rM*cos(i*TWO_PI/6), pos.y + rM*sin(i*TWO_PI/6)); 
    //  }
    //endShape(CLOSE);
    
    
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(a);
    switch(state){
      case 0: // one straight, two tight arcs
        line(0, -r, 0, r);
        arc(rM, 0, tightArcSize, tightArcSize, TWO_PI/3, 2*TWO_PI/3);
        arc(-rM, 0, tightArcSize, tightArcSize, -THIRD_PI, THIRD_PI);
        break;
      case 1: // all tight arcs
        for(int i = 0; i < 3; i++){
          pushMatrix();
            rotate(i*TWO_PI/3);
            arc(-rM, 0, tightArcSize, tightArcSize, -THIRD_PI, THIRD_PI);
          popMatrix();
        }
        break;
       case 2: // crossing loose arcs, one tight arc
         arc(- rM, 0, tightArcSize, tightArcSize, -THIRD_PI, THIRD_PI);
         arc(1.5*s, -r, looseArcSize, looseArcSize, 2*PI/3, PI);
         arc(1.5*s, r, looseArcSize, looseArcSize, PI, 2*TWO_PI/3);
         break;
       case 3: // two loose, one straight
         line(r*cos(-PI/6),r*sin(-PI/6),r*cos(5*PI/6), r*sin(5*PI/6));
         arc(1.5*s, -r, looseArcSize, looseArcSize, 2*THIRD_PI, PI);
         arc(-1.5*s, r, looseArcSize, looseArcSize, -THIRD_PI, 0);
         break;
    }
    popMatrix();
  }
}
