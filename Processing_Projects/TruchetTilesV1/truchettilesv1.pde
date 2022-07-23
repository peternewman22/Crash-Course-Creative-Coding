float s;
int n = 25;
Tile[][] tiles;
void setup(){
    size(500, 500);
    s = width/n;
    stroke(0);
    strokeWeight(5);
    tiles = new Tile[n][n];
    background(255);
    for(int i = 0; i < n; i++){
        for(int j = 0; j < n; j++){
            tiles[i][j] = new Tile(i*s, j*s);
            tiles[i][j].show();
        }
    }



}

void draw(){

}

void keyPressed(){
    if(key == ' '){
        setup();
    }
}