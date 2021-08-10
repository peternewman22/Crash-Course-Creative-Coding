PVector tip, lA, rA, c;
float l, w, a;

void setup() {
  size(500, 500);
  a = 0;
  l = 200;
  w = l/2;
  c = new PVector(width/2, height/2);
  tip = new PVector(width/2, height/2 - l);
  lA = new PVector(width/2 - w, height/2 - l/4);
  rA = new PVector(width/2 + w, height/2 - l/4);
  noStroke();
  fill(#228B22);
}

void draw() {
  background(255);
  update();
  drawLeaf();
  a +=0.01;
  if(a > TWO_PI){
    a = 0;
  }
}

void update(){
  
  tip.set(width/2 + l*cos(a-HALF_PI), height/2 + l*sin(a-HALF_PI));
  
}

void drawLeaf() {
  beginShape();
  vertex(c.x, c.y);
  vertex(lA.x, lA.y);
  vertex(tip.x, tip.y);
  vertex(rA.x, rA.y);
  endShape(CLOSE);
}
