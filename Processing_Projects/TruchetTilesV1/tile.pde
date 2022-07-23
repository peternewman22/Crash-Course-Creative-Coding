class Tile{
    PVector pos;
    int state;
    Tile(float x, float y){
        pos = new PVector(x,y);
        state = int(random(2));
    }

    void show(){
        fill(#f4b41a);
        noStroke();
        rect(pos.x, pos.y, s, s);
        noFill();
        stroke(#143d59);
        if(state == 0){
            arc(pos.x, pos.y, s, s, 0, HALF_PI);
            arc(pos.x + s, pos.y + s, s, s, PI, 0.75*TWO_PI);
        } else {
            arc(pos.x + s, pos.y, s, s, HALF_PI, PI);
            arc(pos.x, pos.y + s, s, s,-HALF_PI, 0);
        }
        

    }
}