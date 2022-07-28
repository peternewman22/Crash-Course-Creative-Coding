class Tile {
  PVector pos;
  
  Tile(float xPos, float yPos, int rStart, int rEnd, int gStart, int gEnd, int bStart, int bEnd, int yStart, int yEnd) {
    pos = new PVector(xPos, yPos);

  }

  void show() {
    fill(0);
    noStroke();
    beginShape();
    for (int i = 0; i < 6; i++) {
      float x = pos.x +  R*cos(i*(TWO_PI/6));
      float y = pos.y + R*sin(i*(TWO_PI/6));
      vertex(x,y);
    }
    endShape(CLOSE);
    
  }
}
