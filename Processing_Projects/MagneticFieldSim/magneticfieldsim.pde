PVector north, south, c;
FieldLine[][] field;
int n = 100;
float res;
float d;
float k = 10;

void setup(){
    size(1000, 1000);
    res = width/n;
    north = new PVector(width/2, height/4);
    south = new PVector(width/2, 0.75*height);
    d = PVector.dist(north, south);
    c = new PVector((north.x + south.x)/2, (north.y + south.y)/2);
    field = new PVector[n][n];
    // for(int i = 0; i < n; i++){
    //     for(int j = 0; j < n; j++){
    //         field[i][j] = new PVector()
    //     }
    // }

}

void draw(){
    background(220);
    strokeWeight(20);
    stroke(0);
    point(north.x, north.y);
    point(south.x, south.y);
    stroke(0,100);
    point(c.x, c.y);


}

class FieldLine{
    PVector pos;
    PVector dir;

    FieldLine(float x, float y){
        pos = new PVector(x,y);
        float r = PVector.dist(c, pos);
        float theta = PVector.sub(c, pos).heading();
        float k = d;
    }
}