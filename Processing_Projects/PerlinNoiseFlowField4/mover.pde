class Mover{
    PVector pos, vel, acc;
    color col;

    Mover(float x, float y, color c_){
        pos = new PVector(x,y);
        vel = PVector.sub(c, pos).normalize();
        acc = new PVector(0,0);
        col = c_;
    }

    void follow(){
        PVector desired = lookup(pos.x, pos.y);
        PVector correction = PVector.sub(desired, vel);
        applyForce(correction.setMag(fieldStrength));

    }

    void applyForce(PVector f){
        acc.add(f);
    }

    void update(){
        pos.add(vel);
        vel.add(acc);
        acc.mult(0);
        if(PVector.dist(pos, c) > r){
            float a = random(0,TWO_PI);
            pos.set(width/2 + r*cos(a), height/2 + r*sin(a));
            vel = PVector.sub(c, pos).normalize(); 
        }
    }

    void show(){
        fill(col);
        
        ellipse(pos.x, pos.y, 2, 2);
    }
 

}