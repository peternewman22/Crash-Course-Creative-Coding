Wall[] walls;
Mover[] movers;
float r = 10;
// color[] colours = {#f94144,#f3722c,#f8961e,#f9844a,#f9c74f,#90be6d,#43aa8b,#4d908e,#577590,#277da1};
color[] colours = {#f72585,#b5179e,#7209b7,#560bad,#480ca8,#3a0ca3,#3f37c9,#4361ee,#4895ef,#4cc9f0};
void setup() {
    size(1000, 1000);
    walls = new Wall[3];
    initWalls();
    movers = new Mover[20];
    initMovers();
    ellipseMode(RADIUS);
    textAlign(CENTER);
    textSize(20);
    background(0);
}

void draw() {
    //background(0);
    translate(width / 2, height / 2);
    //showWalls();
    updateMovers();
  
    
    
     for (int i = 0; i < 6; i++) {
         pushMatrix();
         rotate(i * TWO_PI / 6);
         showMovers();
        
         popMatrix();
     }
        
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
        movers[i] = new Mover(radius*cos(theta), radius*sin(theta), i);
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
    walls[0] = new Wall(-r*cos(PI/6),0,width / 2 * cos( - PI / 6),(width/2 + r*cos(PI/6))* sin( - PI / 6),0);
    walls[1] = new Wall(-r*cos(PI/6),0,width / 2 * cos(PI / 6),(width / 2 + r*cos(PI/6)) * sin(PI / 6), 1);
    walls[2] = new Wall((width/2 + r*cos(PI/6)) * cos(PI / 6),(width/2 + r*cos(PI/6)) * sin(PI / 6),(width/2 + r*cos(PI/6)) * cos( - PI / 6),(width/2 + r*cos(PI/6)) * sin( - PI / 6), 2);
}
        
void showWalls() {
    for(Wall w : walls) {
        w.show();
    }
}

void keyPressed(){
  if(keyCode == ENTER){
    save("ButterflyKalaedoscope3.png");
  }
}
                
