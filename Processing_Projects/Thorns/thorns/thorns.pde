Thorn[] crown;
float decayRate = 0.25;
//color[] colours = {#fbf8cc, #fde4cf, #ffcfd2, #f1c0e8, #cfbaf0, #a3c4f3, #90dbf4, #8eecf5, #98f5e1, #b9fbc0};
color[] colours = {#10002b, #240046, #3c096c, #5a189a, #7b2cbf, #9d4edd, #c77dff, #e0aaff};
color[] lerpCols;
int lerpSteps = 5;
int n = 720;
float max = 25;
float min = 5;
float R;
void setup(){
  size(720, 720);
  fill(255);
  noStroke();
  background(0);
  lerpCols = new color[(colours.length-1)*lerpSteps];
  R = width/3;
  crown = new Thorn[n];
  for(int i = 0; i < n; i++){
    float a = -HALF_PI + i*TWO_PI/(n);
    float r = map(abs(a-HALF_PI), 0, PI, max, min);
    //color c = colours[int(random(colours.length));
    //color c = colours[int(r/colours.length)];
    color c = lerpCols[int(r/lerpCols.length)];
    crown[i] = new Thorn (R*cos(a), 0.5*R*sin(a), r, c);
  }
}

void draw(){
  pushMatrix();
  translate(width/2, height/2);
  for(Thorn t : crown){
    t.update();
    t.show();
  }
  popMatrix();
}

void generateLerpCols(){
  for(int eachCol = 0; eachCol < colours.length - 1; eachCol++){
    for(int lerpStep = 0; lerpStep < lerpSteps; lerpStep++){
      lerpCols[eachCol*lerpSteps + lerpStep] = lerpColor(colours[eachCol], colours[eachCol + 1], lerpStep*1/lerpSteps);
    }
  }
}
