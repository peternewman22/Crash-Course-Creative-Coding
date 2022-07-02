/*
Going to release particles and have them draw to the screen following the flow field
*/
PVector[][] field;
Mover[] swarm;
float res = 5;
int n = 500;
int cols, rows;
float followStrength = 0.02;
float maxSpeed = 1;
float inc = 0.1;
boolean wrapThings = true;
color[] colours = {#0D03045e,#0D023e8a,#0D0077b6,#0D0096c7,#0D00b4d8,#0D48cae4,#0D90e0ef,#0Dade8f4,#0Dcaf0f8};

void setup(){
    size(1000, 500);
    cols = int(width/res);
    rows = int(height/res);
    field = new PVector[cols][rows];
    initField();
    swarm = new Mover[n];
    initSwarm();
    // visualiseField();
    noStroke();
    // fill(255, 10);
    background(0);
}

void draw(){
    // background(0);
 
    for(Mover m: swarm){
        m.update();
        m.show();
    }


}

void visualiseField(){
    for(int i = 0; i < cols; i ++){
        for(int j = 0; j < rows; j++){
            PVector f = field[i][j];
            stroke(Math.abs(int(map(f.heading(),0,TWO_PI,0, 255))));
            point(i,j);
        }
    }
}

void initField(){
    float xOff = 0;
    
    for (int i = 0; i < cols; i++){
        float yOff = 0;
        xOff += 0.01;
        for(int j = 0; j < rows; j++){
            yOff += 0.01;
            field[i][j] = PVector.fromAngle(TWO_PI*noise(xOff, yOff));
        }
    }
}

void initSwarm(){
    for(int i = 0; i < swarm.length; i++){
        // swarm[i] = new Mover(width, random(height), PVector.fromAngle(random(0.75*PI, 1.25*PI)));
        swarm[i] = new Mover(width, random(height), PVector.fromAngle(PI));
        // float a = random(TWO_PI);
        // swarm[i] = new Mover(random(width/2)*cos(a) + width/2, height/2 + random(height/2)*sin(a), PVector.random2D());
    }
}

PVector lookup(PVector p){
    int column = constrain(int(p.x / res), 0 , cols -1);
    int row = constrain(int(p.y / res), 0 , rows - 1);
    return field[column][row].get();
}

class Mover{
    PVector pos;
    PVector vel;
    PVector acc;
    color col;
    Mover(float x, float y, PVector vel_){
        pos = new PVector(x,y);
        vel = vel_.copy();
        acc = new PVector(0,0);
        col = colours[int(random(colours.length))];
    }
    
    void update(){
        // look up the flowfield position
        follow();
        vel.add(acc);
        pos.add(vel);
        acc.mult(0);
        if(wrapThings){
            wrap();
        }

        
    }

    void wrap(){
        if(pos.x < 0){
            pos.x = width;
        }
        if(pos.x > width){
            pos.x = 0;
        }
        if(pos.y < 0){
            pos.y = height;
        }
        if(pos.y > height){
            pos.y = 0;
        }
    }

    void show(){
        fill(col);
        if(!(pos.x < 0 || pos.x>width || pos.y > height || pos.y < 0)){
            ellipse(pos.x, pos.y, 5, 5);
        }
        
    }

    void follow(){
        PVector desired = lookup(pos).mult(maxSpeed);
        PVector steer = PVector.sub(desired, vel);
        steer.limit(followStrength);
        applyForce(steer);

    }
    void applyForce(PVector f){
        acc.add(f);
    }
    
}

void keyPressed(){
    if(key == CODED){
        if(keyCode == ENTER){
            save("flowfield.jpg");
        }
        
    }
    if(key == TAB){
       wrapThings = !wrapThings;
    }
}

