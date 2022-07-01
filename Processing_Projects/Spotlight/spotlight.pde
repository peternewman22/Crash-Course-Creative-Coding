// config #1: n = 100, inc = 0.01; opacity = 5; r = 100};


PVector m;
// PVector test;
PVector[] circleField;
int n = 200;
float r = 100;
float overlapScl = 0.5;
float xOff, yOff;
float inc = 0.01;
int opacity = 5;
PVector cntr;


void setup(){
    size(720, 720);
    ellipseMode(CENTER);
    xOff = random(10000);
    yOff = random(10000);
    circleField = new PVector[n];
    for(int i = 0; i < n; i++){
        circleField[i] = new PVector(random(width), random(height));
    }
    cntr = new PVector(width/2, height/2);
    // m = new PVector(float(mouseX), float(mouseY));
    m = new PVector(width*noise(xOff), height*noise(yOff));
    // test = new PVector(width/2, height/2);
    noFill();
   

    background(0);
}

void draw(){
    // background(0);
    // m.set(float(mouseX), float(mouseY));
    m.set(width*noise(xOff), height*noise(yOff));
    float d = PVector.dist(cntr, m);
    int intensity = int(map(d, 0, width/sqrt(2), 255, 0));
    // int intensity = 255;
    stroke(intensity,opacity);
    // ellipse(test.x, test.y, r, r);
    // ellipse(m.x, m.y, r, r);
    
    
    // drawing overlapScl
    for(PVector c: circleField){
        // ellipse(c.x, c.y, r, r);
        drawOverlap(c);
    }

    xOff += inc;
    yOff += inc;
    
    
}

void keyPressed(){
    if(key == ENTER){
        
        save("Spotlight.png");
    }
}

void drawOverlap(PVector c){
    float d = PVector.dist(m,c);
    if(d <= r){
        float head = PVector.sub(c, m).heading();
        float angle = acos(d / r);
        float aAbove = angle + head;
        float aBelow = -angle + head;
        // debug code
        // stroke(255,0,0);
        // line(m.x, m.y, c.x, c.y);
        // stroke(0,255,0);
        // line(m.x, m.y, m.x + overlapScl*r*cos(aAbove), m.y + overlapScl*r*sin(aAbove));
        // line(m.x, m.y, m.x + overlapScl*r*cos(aBelow), m.y + overlapScl*r*sin(aBelow));
        // stroke(0,0,255);
        line(m.x + overlapScl*r*cos(aAbove), m.y + overlapScl*r*sin(aAbove), m.x + overlapScl*r*cos(aBelow), m.y + overlapScl*r*sin(aBelow));

        
    }

}