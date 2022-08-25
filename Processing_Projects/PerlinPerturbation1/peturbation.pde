class Perturbation{
    PVector pos;
    PVector neutral;
    float a;
    float initNV;

    Perturbation(float a_, float initNV_){
        a = a_;
        pos = new PVector(r*cos(a),r*sin(a));
        neutral = pos.copy();
        initNV = initNV_;
    }

    void update(float nVCurrent){
        float pert = map(noise(initNV + nVCurrent), 0, 1, -r*maxAsFraction, r*maxAsFraction);
        pos.set(neutral.x + pert*cos(a), neutral.y + pert*sin(a));

    }
}