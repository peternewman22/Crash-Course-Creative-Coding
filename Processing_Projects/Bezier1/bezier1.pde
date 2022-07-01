PVector cp1, a1, a2, cp2;
float d = 2;

void setup(){
    size(720, 720);
    
    a1 = new PVector(3*width/4, height/4);
    a2 = new PVector(width/2, 3*height/4);
    cp1 = new PVector(a1.x + 100, a1.y);
    cp2 = new PVector(a2.x - 100, a2.y);
    stroke(255);
    textAlign(CENTER);
    noFill();
    stroke(255);
}

void draw(){
    background(0);
    stroke(0, 255, 0);
    ellipse(a1.x, a1.y, d, d);
    text("a1", a1.x, a1.y);
    ellipse(a2.x, a2.y, d, d);
    text("a2", a2.x, a2.y);
    ellipse(cp1.x, cp1.y, d, d);
    text("cp1",cp1.x, cp1.y);
    ellipse(cp2.x, cp2.y, d, d);
    text("cp2",cp2.x, cp2.y);
    
    line(a1.x, a1.y, cp1.x, cp1.y);
    line(a2.x, a2.y, cp2.x, cp2.y);
    bezier(a1.x, a1.y, cp1.x, cp1.y, cp2.x, cp2.y, a2.x, a2.y);

}

void mousePressed(){
    if(mouseButton == LEFT){
        cp1.set(mouseX, mouseY);
    }
    if(mouseButton == RIGHT){
        cp2.set(mouseX, mouseY);
    }
}
