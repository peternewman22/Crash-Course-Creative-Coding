PVector a1, a2, cp1, cp2;

void setup() {
  size(500, 500);
  a1 = new PVector(width/3, height/2);
  a2 = new PVector(2*width/3, height/2);
  cp1 = new PVector(width/3, 0.75*height);
  cp2 = new PVector(2*width/3, 0.75*height);
}

void draw() {
  background(0);

  // draw the curve
  stroke(255);
  strokeWeight(5);
  noFill();
  bezier(a1.x,a1.y,cp1.x,cp1.y,cp2.x,cp2.y,a2.x,a2.y);
  
  strokeWeight(1);
  line(a1.x,a1.y,cp1.x,cp1.y);
  line(a2.x,a2.y,cp2.x,cp2.y);

  // draw the anchors and control points
  noStroke();
  fill(255, 25, 25);
  ellipse(a1.x, a1.y, 10, 10);
  ellipse(a2.x, a2.y, 10, 10);
  fill(25, 255, 25);
  ellipse(cp1.x, cp1.y, 10, 10);
  ellipse(cp2.x, cp2.y, 10, 10);
}
