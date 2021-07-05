/*
Circle in centre
 New circle is generated offset from the radius by the radius of the new circle
 https://cre8math.com/2017/10/02/creating-animated-gifs-in-processing/ 
 
 Choose from
 Red   (255,  0,  0);
 Green (0,  255,  0);
 Blue  (0,  0,  255);
 Yellow (255,  255,  0);
 Cyan  (0,  255,  255);
 Magenta  (255,  0,  255);
   
 */

float D, a, increment, steps;
boolean isScenario1;
float period, offset;
ArrayList<Circle> circles;


void setup() {
  size(720, 720);
  D = 500;
  a = 0;
  increment = 0.03;
  steps = D/increment;
  isScenario1 = true;
  period = 4*TWO_PI;
  offset = PI/2;
  circles = new ArrayList<Circle>();
  
  // load the first circle
  Circle first = new Circle(color(255,0,0));
  first.d = D;
  first.isFinished = true;
  circles.add(first);
  
  // load the second circle
  circles.add(new Circle(color(0,0,0)));
  
  
  noStroke();
}

void draw() {
  background(255);
  
  pushMatrix();
  translate(width/2, height/2);
  circles.get(0).show(D);
  circles.get(1).show(circles.get(0).d);
  popMatrix();
  
  a += increment;
  
}

void renderV1(){
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
  float d = D*a/period;
  ellipse((D/2-d/2)*cos(-a-offset), (D/2 - d/2)*sin(-a-offset), d, d);
  popMatrix();

  a += increment;
  if (a > period) {
    a = 0;
    isScenario1 = !isScenario1;
  }
}
