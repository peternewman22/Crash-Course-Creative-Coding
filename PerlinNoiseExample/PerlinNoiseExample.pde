float r;
float xOff;
float a;
int ptCount;
void setup() {
  size(1000, 1000);
  r = 500;
  //xOff = random(1000);
  a = 0;
  noStroke();
  background(0);
  stroke(255, 20);
  noFill();
  ptCount = 360;
}

void draw() {
  pushMatrix();
  translate(width/2, height/2);
  beginShape();
  for (int i=0; i<ptCount; i++) {
    float noiseFactor = noise(i*0.02, xOff);
    float x = r*cos(i*TWO_PI/ptCount)*noiseFactor;
    float y = r*sin(i*TWO_PI/ptCount)*noiseFactor;
    curveVertex(x, y);
  }
  endShape(CLOSE);
  popMatrix();
  r -= 1;
  if (r == 0) {
    save("AwesomeSauce.png");
    noLoop();
    
  }
  xOff+=0.02;
}
