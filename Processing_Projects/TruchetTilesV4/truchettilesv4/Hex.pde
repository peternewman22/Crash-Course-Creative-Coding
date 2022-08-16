class Hex{
  PVector pos;
  int state;
  Hex(float x, float y, int state_){
    pos = new PVector(x,y);
    //state = int(random(4));
    state = state_;
    //a = int(random(6))*TWO_PI/6;
  }
  
  void drawHex(color c){
    fill(c);
    //stroke(c);
    beginShape();
        for(int i = 0; i < 6; i ++){
          vertex(rM*cos(i*THIRD_PI), rM*sin(i*THIRD_PI));
        }
    endShape(CLOSE);
  }
  
  void drawArcAtCorners(int[] corners, color c){
    fill(c);
    //stroke(c);
    for(int i : corners){
      pushMatrix();
      rotate(i*THIRD_PI);
      arc(-rM,0,s, s, -THIRD_PI, THIRD_PI); 
      popMatrix();
    }
  }
  
  void drawMainTile(){
    drawHex(fg);
    fill(bg);
    // front cover
    beginShape();
      vertex(0,-r);
      for(int i = 0; i < 3; i++){
        vertex(rM*cos(i*THIRD_PI - THIRD_PI), rM*sin(i*THIRD_PI - THIRD_PI));
      }
      vertex(0,r);
    endShape(CLOSE);
    // final arc
    int[] bCorners = {0};
    int[] wCorners = {3};
    drawArcAtCorners(bCorners, bg);
    drawArcAtCorners(wCorners, fg);
  }
  
  void show(){  
    pushMatrix();
    translate(pos.x, pos.y);
    
    switch(state){
      case 0: // main tile
        // background hex
        drawMainTile();
        break;
      case 1: // all tight arcs
        rotate(TWO_PI/3);
        drawMainTile();
        break;
       case 2: // crossing loose arcs, one tight arc
         rotate(2*TWO_PI/3);
         drawMainTile();
         break;
       case 3: // two loose, one straight
         drawHex(fg);
         int[] state1Corners = {0,2,4};
         drawArcAtCorners(state1Corners, bg);
         break;
       case 4:
        drawHex(bg);
        int[] state2Corners = {1,3,5};
        drawArcAtCorners(state2Corners, fg);
        break;
    }
    popMatrix();
  }
}
