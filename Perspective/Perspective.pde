/*
I want to experiment with the isometric view
Balls travelling in y-shortened circles, increasing in size with proximity to the "front" or PI/2
Then I can experiment with different arcs to mimick directional lighting
*/
float rx, ry;
float d0, d;
float a;
float w0, w;

void setup(){
    size(1000, 1000);
    rx = 400;
    ry = rx/4;
    d0 = 50;
    d = 25;
    w0 = 0.01;
    a = 0;
    w = w0 + 0.005*sin(a);
    
    
}

void draw(){
    background(0);
    stroke(255,100);
    noFill();
    
    ellipse(width/2, height/2, rx, ry);
    fill(255);
    noStroke();
    ellipse(width/2 + rx*cos(a), height/2 + ry*sin(a), d0 + d*sin(a), d0 + d*sin(a));
    a += w;
    w = w0 + 0.005*sin(a);
}