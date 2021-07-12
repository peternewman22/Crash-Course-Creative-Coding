float L;

void setup() {
  size(1000, 1000);
  stroke(255);
  strokeWeight(5);
  noFill();
  L = width/8;
}

void draw() {
  background(0);
  pushMatrix();
  translate(width/4, height/2);
  //drawStraightLines();
  translate(width/4, 0);
  drawCurvedLines();
  translate(width/4, 0);
  drawCurvedAndStraightLines();

  popMatrix();
}

void drawStraightLines() {
  beginShape();
  vertex(-L, L);
  vertex(-L, -L);
  vertex(L, -L);
  vertex(L, L);
  endShape(CLOSE);
}
void drawCurvedLines() {
  beginShape();
  curveVertex(-L, L);
  curveVertex(-L, -L);
  curveVertex(L, -L);
  curveVertex(L, L);
  endShape();
}
void drawCurvedAndStraightLines() {
  beginShape();
  endShape();
}
