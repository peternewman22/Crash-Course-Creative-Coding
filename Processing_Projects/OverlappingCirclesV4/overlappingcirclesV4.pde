
float r = 50;
int n = 2;
Mover[] swarm;

void setup(){
    size(720, 720);
    noFill();
    stroke(255);
    strokeWeight(2);
    ellipseMode(RADIUS);
    swarm = new Mover[n];
    swarm[0] = new Mover(width/2 - r*1.2, height*0.66, 1, -THIRD_PI);
    swarm[1] = new Mover(width/2 + r*1.2, height*0.66, 1, -2*THIRD_PI);
}

void draw(){
    background(0);
    for(Mover m: swarm){
        m.update();
        m.show();
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
        vel = new PVector(speed*cos(a), speed*sin(a)).normalize();
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
    }
}