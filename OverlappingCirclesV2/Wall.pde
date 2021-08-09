class Wall{
    PVector start, end, difference;
    Wall(float startX, float startY, float endX, float endY){
        start = new PVector(startX, startY);
        end = new PVector(endX, endY);
        difference = PVector.sub(end, start);
    }

    void show(){
        stroke(255);
        strokeWeight(5);
        line(start.x, start.y, end.x, end.y);
    }
}