import processing.sound.*;

SoundFile file;
float xOffSeed;
float yOffSeed;
float zOff;
//PVector[][] flowfield;
Spark[][] array;
int s;
float res;

void setup() {
  size(1000, 1000);
  file = new SoundFile(this,"FlowFieldBacking.wav");
  xOffSeed = random(1000);
  yOffSeed = random(1000);
  zOff = 0;
  s = 30;
  res = width/s;
  noFill();
  colorMode(HSB, 360, 255, 255);

  //flowfield = new PVector[s][s];
  array = new Spark[s][s];
  float xOff = xOffSeed;
  for (int i = 0; i < s; i++) {
    float yOff = yOffSeed;
    for (int j = 0; j < s; j++) {
      float a = noise(xOff, yOff, zOff)*TWO_PI;
      array[i][j] = new Spark((i+0.5)*res, (j+0.5)*res, a);
      //float x = (i+0.5)*res + 0.5*res*cos(a);
      //float y = (j+0.5)*res + 0.5*res*sin(a);
      //flowfield[i][j] = new PVector(x,y);
      yOff += 0.1;
    }
    xOff += 0.1;
  }
}

void draw() {
  background(0);
  float xOff = xOffSeed;
  for (int i = 0; i < s; i++) {
    float yOff = yOffSeed;
    for (int j = 0; j < s; j++) {
      //ellipse((i+0.5)*res, (j + 0.5)*res, res, res);
      //line((i+0.5)*res, (j + 0.5)*res, flowfield[i][j].x, flowfield[i][j].y);
      array[i][j].a = noise(xOff, yOff, zOff)*TWO_PI;
      array[i][j].show();
      yOff += 0.1;
    }
    xOff += 0.1;
  }
  zOff += 0.01;
}

void keyPressed() {
  if (keyCode == ' ') {
    save("SparkhausFlowField4.png");
  } else if(keyCode == ENTER){
    file.play();
  }
    
}
