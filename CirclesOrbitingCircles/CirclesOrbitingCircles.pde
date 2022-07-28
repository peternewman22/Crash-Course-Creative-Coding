/*
grid of circles being orbited by circles
 then we offset those
 */
Planet[][] planets;
int rows, cols;
float res;
float dotSize;

void setup() {
  size(720, 720);
  rows = 5;
  cols = 5;
  res = width/rows;
  dotSize = res/3;
  planets = new Planet[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      planets[i][j] = new Planet(i, j);
    }
  }
}

void draw() {
  background(255);
  fill(0);
  for (int i = 1; i < cols -1 ; i++) {
    for (int j = 1; j < rows -1 ; j++) {
      planets[i][j].update();
      planets[i][j].show();
    }
  }
  //for (int i = 1; i < 3; i++) {
  //  for (int j = 1; j < 3; j++) {
  //    planets[i][j].update();
  //    planets[i][j].show();
  //  }
  //}
}

void slowLtoR() {
  for (int i = 1; i < cols; i++) {
    for (int j = 1; j < rows; j++) {
      planets[i][j].period = planets[i-1][j].period - i*0.5/(cols - 1); 
      planets[i][j].show();
    }
  }
}

void keyPressed(){
  if(keyCode == LEFT){
    slowLtoR();
  }
}
