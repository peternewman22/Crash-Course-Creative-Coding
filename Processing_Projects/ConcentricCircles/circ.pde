class Circ{
    float r;
    color c;
    int t;
    Circ(float r_, color c_, int t_){
        r = r_;
        c = c_;
        t = t_;
    }

    void show(float x, float y){
        stroke(c);
        strokeWeight(t);
        ellipse(x, y, 2*r, 2*r);
    }
}