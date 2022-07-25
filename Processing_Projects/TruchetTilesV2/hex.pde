class Hex{
    PVector pos;
    float orientation;
    int state;
    Hex(float x, float y, float a){
        pos = new PVector(x,y);
        orientation = a;
        state = int(random(7));
    }

    void show(){
        beginShape();
            for(int i = 0; i < 6; i++){
                vertex(pos.x + rMajor*cos(i*TWO_PI/6+PI/6), pos.y + rMajor*sin(i*TWO_PI/6 + PI/6));
            }
        endShape(CLOSE);
        // pushMatrix();
        //     translate(pos.x, pos.y);
        //     rotate(orientation);
        //     beginShape();
        //         for(int i = 0; i < 6; i++){
        //             vertex(r*cos(i*TWO_PI/6+PI/6), r*sin(i*TWO_PI/6 + PI/6));
        //         }
        //     endShape(CLOSE);
        // popMatrix();

    }
}