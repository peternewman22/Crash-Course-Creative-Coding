class FlowField {
  PVector[][] field;
  float xSeed, ySeed;
  float zOff;
  FlowField() {
    field = new PVector[cols][rows];
    initVectorField();
    xSeed = random(1000);
    ySeed = random(1000);
    zOff = random(1000);
  }

  void initVectorField() {
    float xOff = xSeed;
    for (int i = 0; i < cols; i++) {
      float yOff = ySeed;
      for (int j = 0; j < rows; j++) {
        float a = noise(xOff, yOff, zOff)*TWO_PI;
        field[i][j] = new PVector(cos(a), sin(a));
        yOff += 0.5;
      }
      xOff += 0.5;
    }
    zOff += 0.05;
  }
  
  PVector lookup(PVector lookup){
    int row = int(constrain(lookup.x/res,0,rows-1));
    int col = int(constrain(lookup.y/res,0,cols-1));
    return field[col][row];
  }

  void show() {
    stroke(255,100);
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        line((i+0.5)*res, (j+0.5)*res, (i+0.5)*res + 0.5*res*field[i][j].x, (j+0.5)*res + 0.5*res*field[i][j].y);
      }
    }
  }
}
