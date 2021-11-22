PImage src, controls1, controls2;
int cols, rows;
int res;
int xOffset, yOffset, resOffset, densityOffset;
boolean hintMode;
void setup(){
  size(1000,607);
  src = loadImage("George2.jpg");
  controls1 = loadImage("Controls1.png");
  controls2 = loadImage("Controls2.png");
  rows = 15;
  cols = ceil(7*rows/8);
  noFill();
  stroke(255);
  xOffset = 0;
  yOffset = 0;
  resOffset = 0;
  densityOffset = 0;
  hintMode = false;
 
}

void draw(){
  background(0);
  res = int(height/rows) + resOffset;
  image(src, 0, 0);
  
  
  for(int i = 0; i < cols; i++){
    for(int j = 0; j < rows; j++){
      if((i+0.5)*(res+densityOffset) + xOffset < width/2 && (j+0.5)*(res+densityOffset) + yOffset < height){
        copy(xOffset + res/4 + i*(res+densityOffset), yOffset + res/4 + j*(res+densityOffset), res/2, res/2, width/2 + res/4 + i*res, res/4 + j*res, res, res);
        rect(xOffset + res/4 + i*(res+densityOffset), yOffset + res/4 + j*(res+densityOffset), res/2, res/2);
      }
      
    }
  }
  if(hintMode){
    image(controls1, width/2 - controls1.width/2, 0, (height/2)*controls1.width/controls1.height,height/2);
    image(controls2, width/2 - controls2.width/2, height/2, (height/2)*controls2.width/controls2.height,height/2);
  }
  
}

void keyPressed(){
  if(keyCode == UP){
    yOffset += -1;
  } else if (keyCode == DOWN){
    yOffset += 1;
  } else if (keyCode == LEFT){
    xOffset += 1;
  } else if (keyCode == RIGHT){
    xOffset += -1;
  } else if (keyCode == BACKSPACE){
    yOffset = 0;
    xOffset = 0;
    resOffset = 0;
    densityOffset = 0;
  } else if (key == 'a'){
    resOffset += -1;
  } else if (key == 'd'){
    resOffset += 1;
  } else if (key == 'w'){
    densityOffset += 1;
  } else if (key == 's'){
    densityOffset += -1;
  } else if (keyCode == TAB){
    hintMode = !hintMode;
  }
  
}
