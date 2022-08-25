float maxAsFraction = 1.4;
float r;
int n = 40;
PVector c;
PVector v;
float inc = 0.01;
Ring ring;
float initRoughness = 0.05;

void setup(){
    size(480, 720);
    r = width/6;
    background(0);
    noFill();
    stroke(255,50);
    strokeWeight(1);
    ring = new Ring(width/2, -r, new PVector(0,1));


}

void draw(){
    // background(0);
    ring.update();
    ring.show();
    
   
    

}