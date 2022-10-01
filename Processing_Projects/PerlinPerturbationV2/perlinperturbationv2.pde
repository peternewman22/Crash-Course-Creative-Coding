float step = 0.2;
float yPos;
float rMin;
float rMax; 
float noiseMax = 2;
float t;
void setup(){
    size(360, 720);
    background(0);
    noFill();
    stroke(255,50);
    rMin = width/12;
    rMax = width/2;
    yPos = -rMax;
}

void draw(){
    beginShape();
    for(float a = 0; a < TWO_PI; a += step){
        float xoff = map(cos(a), -1, 1, 0, noiseMax);
        float yoff = map(sin(a), -1, 1, 0, noiseMax);
        float r = map(noise(xoff, yoff, t), 0, 1, rMin, rMax);
        float x = width/2 + r * cos(a);
        float y = yPos + 0.5 * r * sin(a);
        vertex(x,y);
    }
    endShape(CLOSE);
    yPos ++;
    if(yPos > height + rMax){
        noLoop();
        saveFrame("perlinperturbation-####.png");
    }
    t += 0.01;

}