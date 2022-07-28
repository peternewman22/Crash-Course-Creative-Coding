float r, a, s;
int repeats = 6;

void setup(){
  size(500, 500);
  r = 0.8*width/2;
  a = 0;
  s = width/10;
  fill(255);
  noStroke();
}

void draw(){
  background(0);
  for(int i = 0; i < repeats; i++){
    float x = width/2 + r*cos(a + i*TWO_PI/repeats);
    float y = height/2 + r*sin(a + i*TWO_PI/repeats);
    ellipse(x,y,s,s);
  }
  for(int i = 0; i < repeats; i++){
    float x = width/2 + r/2*cos(-a + i*TWO_PI/repeats);
    float y = height/2 + r/2*sin(-a + i*TWO_PI/repeats);
    ellipse(x,y,s/2,s/2);
  } 
  
  a += 0.01;

}

void drawRing(float rscale, float period, float offset){
  
}
