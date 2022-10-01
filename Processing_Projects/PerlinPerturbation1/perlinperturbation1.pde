float maxAsFraction = 1.8;
float r;
int n = 40;
PVector c;
PVector v;
float inc = 0.005;
Ring ring;
float initRoughness = 0.03;

void setup(){
    size(480, 720);
    r = width/6;
    background(0);
    noFill();
    stroke(255,40);
    strokeWeight(1);
    ring = new Ring(width/2, -r, new PVector(0,1));


}

void draw(){
    // background(0);
    ring.update();
    ring.show();
}