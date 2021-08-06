Hex h;
void setup() {
  size(500, 500);
  h = new Hex(width/2, height/2, 200, 50);
  fill(0);
  stroke(255);
  strokeWeight(5);
  textSize(20);
  textAlign(CENTER);
  strokeJoin(BEVEL);
}

void draw() {
  background(0);
  h.show();
}
