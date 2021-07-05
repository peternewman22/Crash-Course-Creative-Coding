/*
Circle in centre
 New circle is generated offset from the radius by the radius of the new circle
 
 */

float D, a, increment, steps;
boolean isScenario1;


void setup() {
  size(720, 720);
  D = 500;
  a = 0;
  increment = 0.015;
  steps = D/increment;
  isScenario1 = true;
  noStroke();
}

void draw() {
  background(255);
  pushMatrix();
  translate(width/2, height/2);
  if (isScenario1) {
    fill(255, 0, 0);
  } else {
    fill(0);
  }
  ellipse(0, 0, D, D);
  if (isScenario1) {
    fill(0);
  } else {
    fill(255, 0, 0);
  }
  float d = D*a/TWO_PI;
  ellipse((D/2-d/2)*cos(a-PI/2), (D/2 - d/2)*sin(a-PI/2), d, d);
  popMatrix();

  a += increment;
  if (a > TWO_PI) {
    a = 0;
    isScenario1 = !isScenario1;
  }
}
