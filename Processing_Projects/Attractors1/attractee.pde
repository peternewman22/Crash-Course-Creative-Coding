class Attractee{
    PVector pos, vel, acc;
    color col;
    Attractee(){
        pos = new PVector(width/2, height/2);
        vel = PVector.random2D();
        acc = new PVector(0,0);
        // col = colours[int(random(colours.length))];
        col = color(255);
    }

    void applyForce(PVector p){
        acc.add(p);
    }

    void repel(PVector p){
        PVector repulsionForce = PVector.sub(pos, p);
        float repulsionStrength = repulseK/repulsionForce.mag();
        applyForce(repulsionForce.setMag(repulsionStrength));
    }

    void attract(){
        PVector attractionForce = PVector.sub(test.pos, pos);
        float attractionStrength = attractK/attractionForce.mag();
        applyForce(attractionForce.setMag(attractionStrength));
    }

    void update(){
        vel.add(acc).limit(maxSpeed);
        pos.add(vel);
        acc.mult(0);
    }

    void resolveEdges(){
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
        ellipse(pos.x, pos.y, brushSize, brushSize);
    }



    

}