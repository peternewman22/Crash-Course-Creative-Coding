
float r = 50;
int n = 2;
Mover[] swarm;
boolean debugMode = false;

void setup(){
    size(720, 720);
    noFill();
    stroke(255, 10);
    strokeWeight(1);
    ellipseMode(RADIUS);
    swarm = new Mover[n];
    swarm[0] = new Mover(width/2 - r*1.2, height*0.66, 1, -THIRD_PI);
    swarm[1] = new Mover(width/2 + r*1.2, height*0.66, 1, -2*THIRD_PI);

    background(0);
}

void draw(){
       
    if(debugMode){
        background(0);
    }

     // show swarm
    for(Mover m: swarm){
        m.update();
        if(debugMode){
            m.show();
        }
    }
    
   
    
    for(int i = 0; i < swarm.length; i++){
        for(int j = 0; j < swarm.length; j++){
            if(i < j){
                drawOverlap(swarm[i].pos, swarm[j].pos);
                swarm[i].repel(swarm[j].vel.copy());
                swarm[j].repel(swarm[i].vel.copy());
            }
        }
    }

}

void drawOverlap(PVector c1, PVector c2){
    if(PVector.dist(c1, c2) <= 2*r){
        line(c1.x, c1.y, c2.x, c2.y);
    }
}

class Mover{
    PVector pos;
    float velMag = 0.5;
    PVector vel;
    PVector acc;

    Mover(float px, float py, float speed, float a){
        pos = new PVector(px, py);
        velMag = speed;
        vel = new PVector(cos(a), sin(a)).normalize();
    }

    void repel(PVector overlapDir){
        
    }
    void update(){
        pos.add(vel.copy().mult(velMag));
        if(pos.x + r > width || pos.x - r < 0){
            vel.x = -vel.x;
        }
        if(pos.y + r > height || pos.y - r < 0){
            vel.y = -vel.y;
        }
    }

    void show(){
        ellipse(pos.x, pos.y, r, r);
        line(pos.x, pos.y, pos.x + r*cos(vel.heading()), pos.y + r*sin(vel.heading()));
    }
}