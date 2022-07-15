class MyTriangle{
    PVector pos;
    float pertA;
    
    MyTriangle(float x, float y){
        pos = new PVector(x,y);
        pertA = random(-PI/12, PI/12);
    }

    void show(){
        triangle(pos.x, pos.y, pos.x + r*cos(a), pos.y + r*cos(a), pos.x + r*cos(-a), pos.y + r*sin(-a));
    }
}