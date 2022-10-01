float n = 10;
float m = 1;
float epsilon = 0.1;
float res;
int count = 720;
float increment = 0.001;
String currentlyAdjusting = "n";
float nIncrement = 0.1;

void setup() {
  size(720, 720);
  background(0);
  res = width/count;
  stroke(255, 0, 0);
}

void draw() {
  background(0);
  pushMatrix();
  translate(width/2, height/2);
  for (float row = -height/2; row < count; row++) {
    for (float col = -width/2; col < count; col++) {
      if (abs(sin(n*PI*col*increment)*sin(m*PI*row*increment) - sin(m*PI*col*increment)*sin(n*PI*row*increment)) < epsilon) {
        point(col*res, row*res);
      }
    }
  }
  popMatrix();
  m += nIncrement;
}

void keyPressed() {
  if (key == 'n') {
    currentlyAdjusting = "n";
  } else if (key == 'm') {
    currentlyAdjusting = "m";
  } else if (keyCode == UP) {
    switch(currentlyAdjusting) {
    case "m":
      m ++;
      break;
    case "n":
      n ++;
      break;
    }
  } else if (keyCode == DOWN) {
    switch(currentlyAdjusting) {
    case "m":
      m --;
      break;
    case "n":
      n --;
      break;
    }
  }
  println("currently adjusting: " + currentlyAdjusting);
  println("n = " + n + ", m = " + m);
}
