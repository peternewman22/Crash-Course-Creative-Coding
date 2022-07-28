float r;
float D;
int count;
Arch[][] arches;

void setup() {
  size(500, 500);
  background(255);

  r = 50;
  D = 2*r;
  count = int((height/cos(QUARTER_PI))/r);

  arches = new Arch[count][count*2];

  noFill();


  for (int i = 0; i < count; i++) {
    for (int j = 0; j< count*2; j++) {
      arches[i][j] = new Arch(i*D, j*r/2);
    }
  }
}


void draw() {
  background(#e4e0d5);
  //pushMatrix();
  //rotate(-QUARTER_PI);
  //translate(-width,0);
    for (int i = 0; i < count; i++) {
    for (int j = 0; j< count; j++) {
      arches[i][j].show();
    }
  }
  
  //popMatrix();
}


/*no rotation
 
 for (int i = 0; i < count; i++) {
 arc(i*r*cos(PI/4) - r*cos(PI/4), i*r*sin(PI/4)+r*cos(PI/4), D, D, -QUARTER_PI, 3*QUARTER_PI, OPEN);
 arc(i*r*cos(PI/4) + r*cos(PI/4), i*r*sin(PI/4)-r*cos(PI/4), D, D, -QUARTER_PI, 3*QUARTER_PI, OPEN);
 }
 */
