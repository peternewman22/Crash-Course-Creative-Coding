Tile t;
float R;
float r;
float wideD;
float wideR;
float[] endHeadings ={-2*TWO_PI/3, -PI, -TWO_PI/3, -PI/3, 0, PI/3};
float[] startHeadings = {-PI/3, 0, PI/3, TWO_PI/3, PI, 4*TWO_PI/3};



void setup() {
  size(500, 500);
  R = 150;
  r = R*cos(PI/6);
  wideD = 2*r;
  wideR = wideD*cos(PI/6);
  int[][] tSides = {
    {2, 3}, // r
    {0, 0}, // g
    {4, 5}, // b
    {0, 1} // y
  }; 
  t = new Tile(0, 0, tSides);
}

void draw() {
  background(255);
  translate(width/2, height/2);
  t.show();
}
