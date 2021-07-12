float r;
float d;

void setup(){
  size(1000, 1000);
  noStroke();
  colorMode(HSB);
  r = 0.9*width/2;
  d = 5;
  
}

void draw(){
  background(0);
  pushMatrix();
  translate(width/2, height/2);
  for(int i = 0; i < 360; i++){
    float a = i*TWO_PI/360;
    fill(i, 255, 255);
    float x1 = r*cos(a);
    float y1 = r*sin(a);
    float x2 = r*cos(a+TWO_PI/360);
    float y2 = r*sin(a+TWO_PI/360);
    beginShape();
    vertex(0,0);
    vertex(x1,y1);
    vertex(x2,y2);
    endShape(TRIANGLES);
  }
  popMatrix();
}
