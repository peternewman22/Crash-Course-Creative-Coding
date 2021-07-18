class Connection{
  PVector parentPos;
  color col;
  int start, end, type;
  Connection(PVector parentPos_, int start_, int end_, color col_){
    parentPos = parentPos_.copy();
    start = start_;
    end = end_;
    col = col_;
    if(end - start > 3){
      type = 6 - (end - start);
    } else {
      type = end - start;
    }
  }
  
  void show(PVector[] vertices, float[] sidesHeadings, PVector[] midPoints){
    stroke(col);
    strokeWeight(30);
    switch(type){
      case 0:
        break;
      case 1:
        int vIndex = (start + 1)%6; // so it circles around again
        arc(vertices[vIndex].x, vertices[vIndex].y,R,R,sidesHeadings[start],sidesHeadings[end]);
        break;
      case 2:
        break;
      case 3:
        line(midPoints[start].x, midPoints[start].y, midPoints[end].x, midPoints[end].y);
        break;
    }
  }
}
