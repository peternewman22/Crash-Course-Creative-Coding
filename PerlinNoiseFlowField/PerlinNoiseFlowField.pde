float r;
Mover[] movers;
PVector[][] vectorField;
float res;
int rows, cols;

void setup() {
    size(500, 500);
    ellipseMode(RADIUS);
    r = 10;
    movers = new Mover[100];
    initMovers();
    rows = 50;
    cols = 50;
    res = width/cols;
    vectorField = new PVector[cols][rows];
    initVectorField();
    background(0);
}

void draw() {
    background(0);
    showVectorField();
    // for (Mover m : movers) {
    //     m.update();
    // }
    // for (Mover m : movers) {
    //     m.show();
    // }

}

void initVectorField(){
    float xOff = 0;
    for(int i = 0; i < cols; i++){
        float yOff = 0;
        for(int j = 0; j < rows; j++){
            float a = noise(xOff, yOff)*TWO_PI;
            vectorField[i][j] = new PVector(cos(a), sin(a));
            yOff += 0.1;
        }
        xOff += 0.1;
    }
}

void showVectorField(){
    stroke(255);
    for(int i = 0; i < cols; i++){
        for(int j = 0; j < rows; j++){
            line((i+0.5)*res, (j+0.5)*res, (i+0.5)*res + 0.5*res*vectorField[i][j].x, (j+0.5)*res + 0.5*res*vectorField[i][j].y);
        }
    }
}

void initMovers() {
    for (int i = 0; i < movers.length; i++) {
        movers[i] = new Mover(random(width), random(height), i);
    }
}

void keyPressed(){
    if(keyCode == ' '){
        save("Experiment.png");
        noLoop();
    }
}