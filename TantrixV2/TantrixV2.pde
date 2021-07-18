Tile t;
float R;
float r;
float wideD;


void setup() {
  size(500, 500);
  R = 150;
  r = R*cos(PI/6);
  wideD = 2*r;
  
  
  
  t = new Tile(0, 0, 3, 5, 0, 0, 4, 2, 0, 1);
}

void draw() {
  background(255);
  translate(width/2, height/2);
  t.show();
}
