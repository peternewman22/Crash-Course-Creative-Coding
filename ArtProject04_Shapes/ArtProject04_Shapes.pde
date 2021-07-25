float res;
int gridS;
//int option;
void setup() {
  size(500, 500);
  
  //option = 0;
  gridS = 1;
  res = 400/gridS;
  drawGrid();
}

void draw() {
}

void drawGrid() {
  background(#f5f5f5);
  noFill();
  strokeWeight(20);
  stroke(0);
  rect(0, 0, width, height);
  translate(50, 50);
  noStroke();
  fill(0);
  for (int i = 0; i < gridS; i++) {
    for (int j = 0; j < gridS; j++) {
      int option = int(random(7));
      switch(option) {
      case 0:
        ellipse((i+0.5)*res, (j+0.5)*res, .75*res, 0.75*res); // ellipse
        break;
      case 1:
        rect(i*res, j*res, res/2, res/2);
        rect((i+0.5)*res, (j+0.5)*res, res/2, res/2);
        break;
      case 2:
        rect((i+0.5)*res, j*res, res/2, res/2);
        rect(i*res, (j+0.5)*res, res/2, res/2);
        break;
      case 3:
        triangle(i*res, j*res, (i+1)*res, j*res, i*res, (j+1)*res);
        break;
      case 4:
        triangle(i*res, j*res, i*res, (j+1)*res, (i+1)*res, (j+1)*res);
        break;
      case 5:
        triangle(i*res, j*res, (i+1)*res, j*res, (i+1)*res, (j+1)*res);
        break;
      case 6:
        triangle((i+1)*res, j*res, (i+1)*res, (j+1)*res, i*res, (j+1)*res);
        break;
      }
    }
  }
}

void keyPressed() {
  if (keyCode == RIGHT) {
    gridS += 1;
    res = 400/gridS;
    drawGrid();
  } else if (keyCode == LEFT && gridS > 1) {
    gridS -= 1;
    res = 400/gridS;
    drawGrid();
  } else if(keyCode == ' '){
    save("ArtProject04_Shapes.png");
  }
  //if(keyCode == LEFT){
  //  option -= 1;
  //  if(option < 0){
  //    option += 7;
  //  }
  //} else if (keyCode == RIGHT){
  //  option = (option + 1)%7;
  //}
}
