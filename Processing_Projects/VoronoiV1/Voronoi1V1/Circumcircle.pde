class Circumcircle{
  float x1, x2, x3, y1, y2, y3;
  float d;
  PVector c;
  Circumcircle(PVector p1, PVector p2, PVector p3){
    x1 = p1.x;
    y1 = p1.y;
    x2 = p2.x;
    y2 = p2.y;
    x3 = p3.x;
    y3 = p3.y;
    c = getCentre();
    d = 2*dist(x1,y1,c.x, c.y);
  }
  
  PVector getCentre(){
    float x = (x1 + x2 + x3)/3.0;
    float y = (y1 + y2 + y3)/3.0;
    return new PVector(x,y);
  }
  
  void show(){
    stroke(255, 100);
    strokeWeight(5);
    point(c.x, c.y);
    strokeWeight(1);
    ellipse(c.x, c.y, d, d);
  }
  
  
}
