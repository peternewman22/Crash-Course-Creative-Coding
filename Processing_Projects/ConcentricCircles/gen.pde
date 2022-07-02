class Gen{
    ArrayList<Circ> circs;
    PVector pos;
    float tMax;
    Gen(float rMax, int n, float x, float y){
        pos = new PVector(x,y);
        tMax = 0.5 * rMax / n;
        circs = new ArrayList<Circ>();
        float max = 300;
        for(int i = 0; i < n; i++){
            float r = i * rMax / n;
            int t = int(tMin + tMax*abs(randomGaussian()));
            circs.add(new Circ(r, colours[int(random(colours.length))], t));
        }
    }

    void show(){
        for(Circ c: circs){
            c.show(pos.x, pos.y);
        }
    }
}