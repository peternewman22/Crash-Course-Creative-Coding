float r = 300;
float rStart = 100;
float a = PI/120;
float pertRange = PI/60;
MyTriangle[] triangles;
int n = 360;

color[] colours = {color(69,103,137), color(52,86,120), color(35,69,103), color(18,52,86), color(1,35,69)};


void setup(){
    size(1000, 1000);
    noStroke();
    fill(255, 100);
    background(0);
    triangles = new MyTriangle[n];
    for(int i = 0; i < n; i++){
      triangles[i] = new MyTriangle(rStart*cos(i*TWO_PI/n), rStart*sin(i*TWO_PI/n), random(pertRange), i*TWO_PI/n, colours[int(random(colours.length))]);
    }
    pushMatrix();
    translate(width/2, height/2);
    for(int i = 0; i < n; i++){
      
      triangles[i].show();
    }
    popMatrix();
}

void draw(){
    
    

}

void keyPressed(){
    if(key == ENTER){
        setup();
    }
}
