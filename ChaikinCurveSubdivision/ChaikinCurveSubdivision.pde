int ptCount, stop;
PVector[] cpts0, cpts1, cpts2, cpts3;
int everyXFrames;
int level;

void setup() {
  size(1000, 500);
  ptCount = 50;
  level = 0;
  everyXFrames = 2;
  cpts0 = new PVector[ptCount];
  for (int i = 0; i < cpts0.length; i++) {
    cpts0[i] = new PVector(i*(width/ptCount)+random(-10, 10), random(-100, 100));
  }
  cpts1 = subdivide(cpts0);
  cpts2 = subdivide(cpts1);
  cpts3 = subdivide(cpts2);
  
  int[] lengths = {cpts0.length, cpts1.length, cpts2.length, cpts3.length};
  level = 0;
  
  strokeWeight(1);
}

void draw() {
  background(#f5f5f5);
  translate(15, height/2);
  noFill();

   //always draw the points
  for (PVector p : cpts0) {
    point(p.x, p.y);
  }

  // original line
  stroke(0, 50);
  beginShape();
  for (int i = 0; i < cpts0.length; i++) {
    vertex(cpts0[i].x, cpts0[i].y);
  }
  endShape();

  // iteration 1
  stroke(0, 50);
  beginShape();
  for (int i = 0; i < cpts1.length; i++) {
    vertex(cpts1[i].x, cpts1[i].y);
  }
  endShape();

  //iteration 2
  stroke(0, 50);
  beginShape();
  for (int i = 0; i < cpts2.length; i++) {
    vertex(cpts2[i].x, cpts2[i].y);
  }
  endShape();

  //iteration 3
  stroke(0);
  beginShape();
  for (int i = 0; i < stop; i++) {
    vertex(cpts3[i].x, cpts3[i].y);
  }
  endShape();

  if (frameCount % everyXFrames == 0) {
    stop += 1;
  }
  if (stop >= cpts3.length) {
    noLoop();
  }
}



PVector[] subdivide(PVector[] cpts) {
  // divide the thing into 3 sections: 25%, 50%, 25% or cumulatively 25%, 75%, 100%
  PVector[] newCpts = new PVector[cpts.length*2];
  for (int i = 0; i < cpts.length-1; i++) {
    PVector original = PVector.sub(cpts[i+1], cpts[i]);
    float l = original.mag();
    PVector start = PVector.add(cpts[i], original.copy().normalize().setMag(0.25*l));
    PVector end = PVector.add(cpts[i], original.copy().normalize().setMag(0.75*l));
    newCpts[2*i] = start;
    newCpts[2*i + 1] = end;
  }
  newCpts[newCpts.length -1] = cpts[cpts.length - 1];
  newCpts[newCpts.length - 2] = cpts[cpts.length - 1];
  return newCpts;
}
