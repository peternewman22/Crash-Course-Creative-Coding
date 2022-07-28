class Mover{
    PVector pos, vel, acc;
    color col;
    boolean isDone;

    Mover(float x, float y, color c_){
        pos = new PVector(x,y);
        vel = lookup(pos.x, pos.y);
        acc = new PVector(0,0);
        col = c_;
        isDone = false;
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
            isDone = true;
            /*float a = random(0,TWO_PI);
            float newR = r;//random(r);
            pos.set(width/2 + newR*cos(a), height/2 + newR*sin(a));
            vel = lookup(pos.x, pos.y);
            */
        }
    }

    void show(){
        fill(col);
        
        ellipse(pos.x, pos.y, brushStroke, brushStroke);
    }
 

}
