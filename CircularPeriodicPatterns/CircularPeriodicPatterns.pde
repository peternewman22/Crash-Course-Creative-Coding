float r, a, diam;
int count;

void setup(){
  size(720, 720);
  a = 0;
  count = 12;
  diam = 20;
  noStroke();
  fill(255);
  
}

void draw(){
  background(0);
  pushMatrix();
  translate(width/2, height/2);
  for(int i = 0; i < count; i++){
    float r = 0.8*(width/4) + (width/20)*cos(2*a);
    float x = r*cos(TWO_PI*i/count - a);
    float y = r*sin(TWO_PI*i/count - a);
    ellipse(x, y, diam, diam);
  }
  
  for(int i = 0; i < count; i++){
    float r = 0.8*(width/4) + (width/20)*sin(2*a);
    float x = r*cos(TWO_PI*i/count + a + PI/2);
    float y = r*sin(TWO_PI*i/count + a + PI/2);
    ellipse(x, y, diam, diam);
  }
  
  popMatrix();
  a += 0.01;
}
