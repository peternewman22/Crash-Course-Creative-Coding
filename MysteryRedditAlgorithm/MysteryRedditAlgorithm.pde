color[] palette = {#547d1d,#fa6e91,#f8fefe,#d3eafc,#2fa2db};
int iterations = 1;
float scP = 0.1;
float sc = 2;
PVector c = new PVector(0,0);
PVector k;
PImage img;

void setup(){
  size(500,500);
  k = new PVector(random(-scP, scP), random(-scP, scP));
  img = new PImage(500, 500);
  img.loadPixels();
  for(int i = 0; i < img.width; i++){
    for(int j = 0; j < img.height; j++){
      PVector p = new PVector(1 - sc*i/img.width, 1 - sc*j/img.height);
      PVector oldP = p.copy();
      float d = PVector.dist(p, c) + 1;
      for(int z = 0; z < iterations; i++){
        p.set(p.x + k.x - (0.7/TWO_PI)*sin(TWO_PI*p.y), p.y + k.y + (0.7/TWO_PI)*sin(TWO_PI/p.x));
      }
      float f = PVector.dist(p,oldP);
    }
  }
  
  
}

void draw(){

}
