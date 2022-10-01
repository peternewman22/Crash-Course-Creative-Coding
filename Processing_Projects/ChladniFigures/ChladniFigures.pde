// Interesting playing around with different ways of changing m and n
float n = 20;
float m = -10;
float epsilon = 0.1;
float res;
int count = 500;
float increment = 0.001;
String currentlyAdjusting = "n";
float nIncrement = 0.1;
float cIx = 0;
int cChangeRate = 2;
boolean start;
float displacement = 0.0;//2.0;


void setup() {
  size(500, 500);
  background(0);
  res = width/count;
  //stroke(255, 0, 0);
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  background(0);
  stroke(cIx, 100, 100);
  pushMatrix();
  translate(width/2, height/2);
  for (float row = -height/2; row < count; row++) {
    for (float col = -width/2; col < count; col++) {
      //if (abs(sin(n*PI*col*increment)*sin(m*PI*row*increment) - sin(m*PI*col*increment)*sin(n*PI*row*increment)) < epsilon) {
      if (abs(cos(n*PI*col*increment)*cos(m*PI*row*increment) - cos(m*PI*col*increment)*cos(n*PI*row*increment)) < epsilon) {
        point(col*res+random(-displacement,displacement), row*res+random(-displacement,displacement));
      }
    }
  }
  popMatrix();
  m += nIncrement;
  n -= nIncrement;
  if (frameCount%cChangeRate == 0) {
    cIx ++;
  }
}
