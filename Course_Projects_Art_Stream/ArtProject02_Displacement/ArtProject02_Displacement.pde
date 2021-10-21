float res;
int s;
int ratio;
int cpts;
float spacings;



void setup() {
  size(500, 500);
  s = 15;
  ratio = 3;
  cpts = s*ratio;

  res = (height-100)/s;
  spacings = res/ratio;

  stroke(0);
  strokeWeight(20);
  background(#F9FBFF);
  rect(0, 0, width, height);

  pushMatrix();
  translate(50, 50);

  strokeWeight(1);
  stroke(0);
  noFill();
  
  for (int eachRow = 0; eachRow < s; eachRow++) {
    beginShape();
    for (int eachLine = 0; eachLine < cpts; eachLine++) {
      //start with straight lines
      vertex((eachLine+0.5)*spacings, (eachRow+0.5)*res + (eachLine+1)/(0.8*cpts/(1.5*eachRow+5))*random(1) );
    }
    endShape();
  }
  popMatrix();
  save("ArtProject02_Displacement.png");
}

void draw() {
}
