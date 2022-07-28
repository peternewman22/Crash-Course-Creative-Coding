float f; // global flicker rate 
Starfield starfield;

void setup(){
  size(1080, 720);
  colorMode(HSB);
  f = 0;
  starfield = new Starfield(250);
}

void draw(){
  background(0);
 
  starfield.show();
   f += 0.05;
}
