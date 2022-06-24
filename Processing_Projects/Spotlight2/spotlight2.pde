// config #1: n = 100, inc = 0.01; opacity = 5; r = 100};


PVector m;
// PVector test;
Mover[] swarm;
int n = 200;
float r = 50;
float overlapScl = 0.5;
float xOff, yOff;
float inc = 0.005;
int opacity = 5;
PVector cntr;
// colorMode(HSB, 360, 255, 255);


void setup(){
    size(720, 720);
    ellipseMode(CENTER);
    xOff = random(10000);
    yOff = random(10000);
    swarm = new Mover[n];
    for(int i = 0; i < n; i++){
        swarm[i] = new Mover();
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
    // m.set(width*noise(xOff), height*noise(yOff));
    // float d = PVector.dist(cntr, m);
    // int intensity = int(map(d, 0, width/sqrt(2), 255, 0));
    // stroke(intensity,opacity);
    stroke(255, opacity);
    // ellipse(test.x, test.y, r, r);
    // ellipse(m.x, m.y, r, r);
    
    
    // drawing overlapScl
    for(Mover m : swarm){
        m.update();
        // m.show();
    }

    for(int i = 0; i < swarm.length; i++){
        for(int j = 0; j < swarm.length; j++){
            if(i < j){
                drawOverlap(swarm[i].pos, swarm[j].pos);
            }
        }

    }

    xOff += inc;
    yOff += inc;
    
    
}

void keyPressed(){
    if(key == ENTER){
        
        save("Spotlight.png");
    }
}

void drawOverlap(PVector c1, PVector c2){
    float d = PVector.dist(c2,c1);
    if(d <= r){
        float head = PVector.sub(c2, c1).heading();
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
        line(c1.x + overlapScl*r*cos(aAbove), c1.y + overlapScl*r*sin(aAbove), c1.x + overlapScl*r*cos(aBelow), c1.y + overlapScl*r*sin(aBelow));

    }

}

class Mover{
    PVector pos;
    float xOff;
    float yOff;

    Mover(){
        xOff = random(10000);
        yOff = random(10000);
        pos = new PVector(width*noise(xOff), height*noise(yOff));
    }

    void update(){
        xOff += inc;
        yOff += inc;
        pos.set(width*noise(xOff), height*noise(yOff));
    }

    void show(){
        noFill();
        stroke(255, 50);
        ellipse(pos.x, pos.y, r, r);       
    }
}