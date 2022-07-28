Mover m;
void setup(){
  size(500, 500);
  m = new Mover(0, 0);
  
  strokeWeight(5);
  
  colorMode(HSB, 360, 100, 100);
  background(0,0,0);
}

void draw(){
  background(0);
  translate(width/2, height/2);
  m.update();
  m.show();
}
