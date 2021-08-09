float r;
Mover[] movers;
FlowField field;
float res;
int rows, cols;
float maxSpeed;
float maxForce;

void setup() {
    size(1000, 500);
    ellipseMode(RADIUS);
    r = 10;
    movers = new Mover[200];
    initMovers();
    rows = 50;
    cols = 100;
    res = width/cols;
    field = new FlowField();
    background(0);
    maxSpeed = 1.01;
    maxForce = 2;
    strokeWeight(2);
}

void draw() {
    //background(0);
    field.initVectorField();
    //field.show();
     for (Mover m : movers) {
         m.update();
     }
     for (Mover m : movers) {
         m.show();
     }

}




void initMovers() {
    for (int i = 0; i < movers.length; i++) {
        movers[i] = new Mover(width, random(height/3, 2*height/3), i); // evenly distributed
        //float r = random(10,width/2);
        //float a = random(-PI, PI);
        //movers[i] = new Mover(width/2 + r*cos(a), height/2 + r*sin(a), i);
    }
}

void keyPressed(){
    if(keyCode == ' '){
        save("Experiment.png");
        noLoop();
    }
}
