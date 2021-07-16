PVector a1, a2, cp1, cp2, mousePos;
PVector[] cpts;
boolean horizontalReflectionMode, verticalReflectionMode;

void setup() {
  size(500, 500);
  a1 = new PVector(width/3, height/3);
  a2 = new PVector(2*width/3, height/3);
  cp1 = new PVector(width/3, 0.75*height);
  cp2 = new PVector(2*width/3, 0.75*height);
  mousePos = new PVector(mouseX, mouseY);
  cpts = new PVector[2];
  cpts[0] = cp1;
  cpts[1] = cp2;
  horizontalReflectionMode = false;
  verticalReflectionMode = false;
  textAlign(CENTER);
}

void draw() {
  background(0);
  mousePos.set(mouseX, mouseY);

  // draw the curve
  stroke(255);
  strokeWeight(5);
  noFill();
  bezier(a1.x, a1.y, cp1.x, cp1.y, cp2.x, cp2.y, a2.x, a2.y);

  // also the handles
  line(a1.x, a1.y, cp1.x, cp1.y);
  line(a2.x, a2.y, cp2.x, cp2.y);

  // draw the anchors and control points
  noStroke();
  fill(255, 25, 25);
  ellipse(a1.x, a1.y, 10, 10);
  ellipse(a2.x, a2.y, 10, 10);
  fill(25, 255, 25);
  ellipse(cp1.x, cp1.y, 10, 10);
  ellipse(cp2.x, cp2.y, 10, 10);

  // overlay
  fill(255);
  text("Horizontal Reflection Mode: " + horizontalReflectionMode, width/2, height - 40);
  text("Vertical Reflection Mode: " + verticalReflectionMode, width/2, height - 20);

}

void keyPressed() {
  if (keyCode == LEFT) {
    horizontalReflectionMode = !horizontalReflectionMode;
  } else if (keyCode == UP) {
    verticalReflectionMode = !verticalReflectionMode;
  }
}

void mouseDragged() {
  for (int i = 0; i < cpts.length; i++) {
    if (PVector.dist(mousePos, cpts[i]) < 20) {
      // find the vector pointing to the mouse
      PVector move = PVector.sub(mousePos, cpts[i]);
      // move in that direction
      cpts[i].add(move);
      if (horizontalReflectionMode) {
        cpts[(i+1)%2].x -= move.x;
      }
      if (verticalReflectionMode) {
        cpts[(i+1)%2].y -= move.y;
      }
    }
  }
}
