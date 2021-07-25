class Spark{
  PVector p;
  float w;
  float h;
  float a;
  int colIx;
  Spark(float x, float y, float a_){
    p = new PVector(x,y);
    h = res/sqrt(2);
    w = 1.6*h/4;
    a = a_;
  }
  
  void show(){
    noStroke();
    colIx = int(map(a,0,TWO_PI,180,300));
    fill(colIx,255, 255);
    ellipse(p.x, p.y, res, res);
    pushMatrix();
    translate(p.x, p.y);
    rotate(a);
    fill(60, 255, 255, 255);
    beginShape();
      vertex(-1/16*w,-h/2);
      vertex(-1/16*w,-h/16);
      vertex(w/2,-h/8);
      vertex(0,h/2);
      vertex(w/16,h/16);
      vertex(-w/2,h/8);
    endShape(CLOSE);
    popMatrix();
    
    
  }
}
