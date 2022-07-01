PVector a, cp1, cp2;
PVector[] ends;
int n = 200;
float d = 10;
float proportionOfWindow = 0.875;

void setup(){
    size(500, 1000);
    noFill();
    stroke(255,119,17,50);
    a = generatePt();
    cp1 = generatePt();
    cp2 = generatePt();
    
    ends = new PVector[n];
    for(int i = 0; i < ends.length; i++){
        ends[i] = new PVector(random(width), random(height));
    }

    background(0);
    for(PVector p : ends){
        bezier(a.x, a.y, cp1.x, cp1.y,cp2.x, cp2.y, p.x, p.y);
        ellipse(p.x, p.y, d, d);
    }


}

void draw(){
    
}

PVector generatePt(){
    return new PVector(random((1-proportionOfWindow)*width, proportionOfWindow*width), random((1-proportionOfWindow)*height/8, proportionOfWindow*height));
}

void keyPressed(){
    if(keyCode == ENTER){
        setup();
    }
}