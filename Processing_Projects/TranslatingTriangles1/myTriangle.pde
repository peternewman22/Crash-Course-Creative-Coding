class MyTriangle{
    PVector pos;
    float pertA;
    
    MyTriangle(float x, float y){
        pos = new PVector(x,y);
        pertA = random(-pertRange, pertRange);
    }

    void show(){
        pushMatrix();
        translate(pos.x, pos.y);
        rotate(pertA);
            // triangle(pos.x, pos.y, pos.x + r*cos(a), pos.y + r*sin(a), pos.x + r*cos(-a), pos.y + r*sin(-a));
            triangle(0,0,r*cos(a),r*sin(a),r*cos(-a),r*sin(-a));
        popMatrix();
    }
}