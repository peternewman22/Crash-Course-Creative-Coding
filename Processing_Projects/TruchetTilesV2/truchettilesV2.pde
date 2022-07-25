float rMinor, rMajor;
Hex[][] tiles;
int n = 10;


void setup(){
    size(720, 720);
    noFill();
    stroke(0);
    strokeWeight(5);
    background(255);
    rMinor = 0.5*width/n;
    rMajor = rMinor/cos(PI/6);
    tiles = new Hex[n][n];
    for(int i = 0; i < n; i++){
        for(int j = 0; j < n; j++){
            if(i%2 == 0){
                tiles[i][j] = new Hex((i+1)*0.5*rMinor, j*rMajor*(1 + sin(PI/6)), 0);
            } else {
                tiles[i][j] = new Hex(i*rMinor, j*rMajor*(1+sin(PI/6)), 0);
            }
            tiles[i][j].show();
        }
    }
}

void draw(){

}