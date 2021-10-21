class Petal{
  PVector c;
  float s;
  Petal(float x, float y){
    c = new PVector(x,y);
    s = 10;
  }
  
  void show(){
    fill(50, 255, 50);
    stroke(0);
    //bezier(c.x - s, c.y, c.x - s/2, c.y - s/2, c.x + s/2, c.y - s/2, c.x + s, c.y);
    bezier(-s,0  ,-s/2,-s/2,  s/2,-s/2,   s,0);
    stroke(255);
    //bezier(c.x - s, c.y, c.x - s/2, c.y + s/2, c.x + s/2, c.y + s/2, c.x + s, c.y);
    bezier(-s,0  ,-s/2,+s/2,  s/2,+s/2,   s,0);
  }
}
