PVector[] pts;

void setup() {
  size(500, 500);


  background(#F9FBFF);


  pts = new PVector[12];
  for (int i = 0; i < pts.length; i++) {
    pts[i] = new PVector(i*550/pts.length, random(100, 150)*sin(i*PI/2));
  }
}

void draw() {


  // the curve
  pushMatrix();
  translate(0, height/2);
  strokeWeight(2);
  stroke(0, 10);
  beginShape();
  noFill();
  for (int i = 0; i < pts.length; i++) {
    pts[i].y += random(-10, 10);
    curveVertex(pts[i].x, pts[i].y);
  }
  endShape();
  popMatrix();


  // the whitespace frame
  fill(#F9FBFF);
  noStroke();
  rect(0, 0, width, 50);
  rect(0, 0, 50, height);
  rect(0, height-50, width, 50);
  rect(width-50, 0, 50, height);

  //the frame
  stroke(0);
  strokeWeight(20);
  noFill();
  rect(0, 0, width, height);
}

void keyPressed() {
  if (keyCode == ' ') {
    save("ArtProject03_Curves-####.png");
    noLoop();
  }
}
