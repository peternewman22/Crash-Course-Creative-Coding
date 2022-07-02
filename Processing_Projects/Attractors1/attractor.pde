class Attractor{
    PVector pos;
    float xOff, yOff;
    
    Attractor(){
        pos = new PVector(width/2, height/2);
        xOff = random(10000);
        yOff = random(10000);
    }

    void update(){
        xOff += inc;
        yOff += inc;
        pos.set(width*noise(xOff), height*noise(yOff));
    }

    void show(){
        fill(255, 100);
        ellipse(pos.x, pos.y, 50, 50);
    }

}