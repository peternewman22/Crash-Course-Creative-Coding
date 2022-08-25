class Ring{
    PVector c;
    PVector v;
    Perturbation[] perts;
    float nV;
    float initNoiseVal = random(10000);
    Ring(float x, float y, PVector vel){
        c = new PVector(x,y);
        v = vel.copy();
        nV = 0;//random(0,10000);
        perts = new Perturbation[n];
        for(int i = 0; i < perts.length; i++){
            perts[i] = new Perturbation(i*TWO_PI/n, initNoiseVal);
            initNoiseVal += initRoughness;
        }
    }

    void update(){
        c.add(v);
        for(int i = 0; i < perts.length; i++){
            perts[i].update(nV);
        }
        nV += inc;
    }

    void show(){
        beginShape();
            for(int i = 0; i < perts.length; i++){
                vertex(c.x + perts[i].pos.x, c.y + perts[i].pos.y);
            }
        endShape();

    }
}