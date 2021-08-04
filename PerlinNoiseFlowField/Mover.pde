class Mover{
    PVector p;
    PVector v;
    int ix;
    
    Mover(float x, float y, int ix_) {
        p = new PVector(x,y);
        ix = ix_;
        v = PVector.random2D().normalize();
    }
    
    void update() {
        p.add(v);
        if(p.x < 0 || p.x > width){
            v.x = -v.x;
        }
        if(p.y < 0 || p.y > height){
            v.y = -v.y;
        }
    }
    
    void show() {
        stroke(255);
        noFill();
        // ellipse(p.x, p.y, r, r);
        // check the other movers
        for (int i = 0; i < movers.length; i++) {
            // don't self check
            if (movers[i].ix != ix) {
                float d = PVector.dist(p, movers[i].p);
                if (d < 2 * r) {
                    // map the grayscale
                    int tint = int(map(d,0,2 * r,255,0));
                    stroke(tint,50);
                    line(p.x, p.y, movers[i].p.x, movers[i].p.y);
                }
            }
        }
    }
}