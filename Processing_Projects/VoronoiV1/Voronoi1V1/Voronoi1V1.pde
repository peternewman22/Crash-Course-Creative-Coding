/*Finding the circumcircle for 3 points*/
PVector[] points;
Circumcircle c;
int n = 3;
void setup(){
    size(1000, 1000);
    points = new PVector[n];
    for(int i = 0; i < points.length; i++){
        points[i] = new PVector(random(width), random(height));
    }
    
    c = new Circumcircle(points[0], points[1], points[2]);
    
    noFill();

    
}

void draw(){
    background(0);
    stroke(255);
    strokeWeight(10);
    for(int i = 0; i < points.length; i++){
        point(points[i].x,points[i].y);
    }
    c.show();
}
