// music from https://pixabay.com/music/beautiful-plays-the-road-ahead-5280/

import processing.sound.*;

SoundFile file;
PVector centre, topL;
float res;
Wall[][] grid;
int wallCount;
Light l;
float maxDist;
int animSteps;
PVector corners;

void setup() {
  size(1000, 1000);
  file = new SoundFile(this, "the-road-ahead-5280.wav");
  wallCount = 50;
  res = (width/(wallCount))/cos(QUARTER_PI); // scale to get the right length
  grid = new Wall[wallCount][wallCount];
  strokeWeight(2);
  centre = new PVector(width/2, height/2);
  topL = new PVector(0,0);
  maxDist = PVector.dist(centre, topL);
  initGrid();
  l = new Light();
  animSteps = 60;
  strokeCap(SQUARE);
  colorMode(HSB, 360, 255, 255);
  //blendMode(LIGHTEST);
  
}

void draw() {
  background(0);
  l.update();
  drawGrid();
  l.show();
}

void drawGrid() {
  for (int i = 0; i < wallCount; i++) {
    for (int j = 0; j < wallCount; j++) {
      grid[i][j].update();
      grid[i][j].show();
    }
  }
}

void initGrid() {
  for (int i = 0; i < wallCount; i++) {
    for (int j = 0; j < wallCount; j++) {
      float a;
      if (random(1) < 0.5) {
        a = PI/4;
      } else {
        a = -PI/4;
      }
      grid[i][j] = new Wall(i*width/wallCount + res/2, j*height/wallCount + res/2, a);
    }
  }
}

void keyPressed(){
  if(keyCode == ' '){
    file.play();
  }
}
