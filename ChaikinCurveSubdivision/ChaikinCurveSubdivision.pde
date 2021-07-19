// music from https://audionautix.com/free-music/meditative
import processing.sound.*;


SoundFile file;
int ptCount, stop;
PVector[] cpts0;
int everyXFrames;
int level;
Curve[] curves;
boolean isStopped;

void setup() {
  size(1000, 500);
  file = new SoundFile(this, "RunningWaters.wav");
  isStopped = true;
  ptCount = 50;
  level = 0;
  everyXFrames = 2;
  cpts0 = new PVector[ptCount];
  for (int i = 0; i < cpts0.length; i++) {
    cpts0[i] = new PVector(i*(width/ptCount)+random(-10, 10), random(-100, 100));
  }
  curves = new Curve[4];
  curves[0] = new Curve(cpts0);
  curves[1] = new Curve(subdivide(curves[0].cpts));
  curves[2] = new Curve(subdivide(curves[1].cpts));
  curves[3] = new Curve(subdivide(curves[2].cpts));

  // the current drawing level
  level = 0;
  
  // load the soundfile

  
  strokeWeight(1);
  noFill();
  noLoop();
  
  
}

void draw(){

  background(#f5f5f5);
  translate(15, height/2);
  
  curves[level].drawPoints();
  
  // draw all the other lines also
  for(int i = 0; i < level+1; i++){
    curves[i].drawLine();
  }
  
  if(frameCount%5 == 0){
    curves[level].update();
  }
}



// The Algorithm!
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

void keyPressed(){
  if(keyCode == ' '){
    file.play();
    loop();
  }
}


// old draw
/*
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
*/
