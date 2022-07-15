float r = 200;
float a = PI/24;
MyTriangle t;

void setup(){
    size(1000, 1000);
    t = new MyTriangle(width/2, height/2);

}

void draw(){
    background(0);
    t.show();

}