class MyTriangle{
    PVector pos;
    float pertA;
    float globA;
    color col;
    
    MyTriangle(float x, float y, float pertA_, float globA_, color col_){
        pos = new PVector(x,y);
        pertA = pertA_;
        globA = globA_;
        col = col_;
    }

    void show(){
        pushMatrix();
        translate(pos.x, pos.y);
            // triangle(pos.x, pos.y, pos.x + r*cos(a), pos.y + r*sin(a), pos.x + r*cos(-a), pos.y + r*sin(-a));
            fill(col);
            triangle(0,0,r*cos(a+globA+pertA),r*sin(a + globA + pertA),r*cos(-a + globA + pertA),r*sin(-a + globA + pertA));
        popMatrix();
    }
}
