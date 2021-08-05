Wall[] walls;
Mover[] movers;
float r = 10;
void setup() {
    size(800, 800);
    walls = new Wall[3];
    initWalls();
    movers = new Mover[1];
    initMovers();
    ellipseMode(RADIUS);
    textAlign(CENTER);
    textSize(20);
}

void draw() {
    background(0);
    translate(width / 2, height / 2);
    showWalls();
    updateMovers();
    showMovers();
    
    // for (int i = 0; i < 6; i++) {
    //     pushMatrix();
    //     rotate(i * TWO_PI / 6);
        
    //     popMatrix();
    // }
        
}

void updateMovers(){
    for(Mover m: movers){
        m.update();
    }
}

void initMovers(){
    //spawns them in the wedge
    for(int i = 0; i < movers.length; i++){
        float radius = random(width/8, 0.8*width/2);
        float theta = random(-PI/7, PI/7);
        movers[i] = new Mover(radius*cos(theta), radius*sin(theta));
    }
}

void showMovers(){
    noFill();
    stroke(255,100);
    strokeWeight(1);
    for(Mover m: movers){
        m.show();
    }
}

void initWalls(){
    walls[0] = new Wall(0,0,width / 2 * cos( - PI / 6),width / 2 * sin( - PI / 6));
    walls[1] = new Wall(0,0,width / 2 * cos(PI / 6),width / 2 * sin(PI / 6));
    walls[2] = new Wall(width / 2 * cos(PI / 6),width / 2 * sin(PI / 6),width / 2 * cos( - PI / 6),width / 2 * sin( - PI / 6));
}
        
void showWalls() {
    for(Wall w : walls) {
        w.show();
    }
}
                