Wall[][] grid;
int side;
float res;
PVector mouse;
float maxDist;


void setup() {
  size(500, 500);
  colorMode(HSB, 360, 255, 255);
  background(0, 0, 0);
  side = 50;
  res = width/side;
  mouse = new PVector(width/2, height/2);
  maxDist = width/cos(PI/4);


  grid = new Wall[side][side];
  for (int i = 0; i < side; i ++) {
    for (int j = 0; j < side; j++) {
      grid[i][j] = new Wall(i*res, j*res);
    }
  }
  //for (int i = 0; i < side; i ++) {
  //  for (int j = 0; j < side; j++) {
  //    grid[i][j].show();
  //  }
  //}
  //save("Line Maze.png");
}

void draw() {
  background(0);
  mouse.set(mouseX, mouseY);
  for (int i = 0; i < side; i ++) {
    for (int j = 0; j < side; j++) {
      grid[i][j].show();
    }
  }
}

void keyPressed() {
  if (keyCode == ' ') {
    background(0);
    if (random(1) < 0.5) {
      line(width/4, width/4, 0.75*width, 0.75*height);
    } else {
      line(0.75*width, width/4, width/4, 0.75*height);
    }
  }
}
