float r = 200;
float a = PI/60;
float pertRange = PI/24;
MyTriangle t;

void setup(){
    size(1000, 1000);
    t = new MyTriangle(width/2, height/2);
    noStroke();
    fill(255, 200);

}

void draw(){
    background(0);
    t.show();

}

void keyPressed(){
    if(key == ENTER){
        setup();
    }
}