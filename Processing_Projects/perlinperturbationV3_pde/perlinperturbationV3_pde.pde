float rMin, rMax;
float noiseMax = 1.5;
int n = 24;
float xOff;
float yOff;
float tOff = 0;
float tInc = 0.02;
float yPos;
float a, r, x, y;
float ellipseRatio = 0.25;
float twistRate = 0.05;
float twist = 0;

void setup() {
  size(360, 720);
  rMin = width/12;
  rMax = width/3;
  yPos = -rMax;
  background(0);
  stroke(255,40);
  noFill();
}

void draw() {
  beginShape();
  for (int i = 0; i < n; i++) {
    a = i*TWO_PI/n;
    xOff = map(cos(a), -1, 1, 0, noiseMax);
    yOff = map(sin(a), -1, 1, 0, noiseMax);
    r = map(noise(xOff, yOff, tOff), 0, 1, rMin, rMax);
    x = r*cos(a + twist) + width/2;
    y = ellipseRatio*r*sin(a + twist) + yPos;
    vertex(x, y);
  }
  endShape(CLOSE);
  tOff += tInc;
  yPos ++;
  twist += twistRate;
  if (yPos > height + rMax) {
    println("FINISHED!");
    saveFrame("PerlinPerturbation" + " " + String.valueOf(year()) + "-" + String.valueOf(month()) + "-" + String.valueOf(day()) + " " + String.valueOf(hour()) + "_" + String.valueOf(minute()) + "_" + String.valueOf(second()) + ".png");
    noLoop();
  }
}
