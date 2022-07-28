PVector pt;
float r;
float a;
int lineCount;
void setup(){
  size(500, 500);
  pt = new PVector(0,0);
  stroke(255);
  strokeWeight(2);
  lineCount = 24;
  a = 0;
}

void draw(){
  background(0);
  translate(width/2, height/2);
  
  r = 200;
  
  for(int i = 0; i < lineCount/2; i++){
    float angle = 
    line(pt.x, pt.y, r*cos(2*a + i*TAU/lineCount)*cos(i*TAU/lineCount), r*cos(2*a + i*TAU/lineCount)*sin(i*TAU/lineCount));
  }
  a += 0.01;

}
