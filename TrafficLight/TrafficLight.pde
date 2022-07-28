float d;

void setup(){
  size(720, 720);
  noStroke();
  rectMode(CENTER);
  d = 0.95*width/4;
}

void draw(){
  background(0);
  drawPole();
  fill(255, 0, 0);
  ellipse(width/2, height/4, d, d);
  fill(255, 255, 0);
  ellipse(width/2, height/2, d, d);
  fill(0, 255, 0);
  ellipse(width/2, 3*height/4, d, d);
  writeText();
}

void drawPole(){
  fill(255,100);
  rect(width/2, height/2, width/3, height*5/6, d/4);
  rect(width/2, height*23/24, width/12, height*1/12);
}

void writeText(){
  fill(255);
  textSize(40);
  textAlign(CENTER);
  text("My Traffic Light", width/2, 40);
}
