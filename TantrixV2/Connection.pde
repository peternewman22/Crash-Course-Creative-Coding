class Connection{
  PVector parentPos;
  color col;
  int start, end, type;
  String colourName;
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
    switch(col){
      case #FF0000:
        colourName = "Red";
        break;
      case #00FF00:
        colourName = "Green";
        break;
      case #0000FF:
        colourName = "Blue";
        break;
      case #FFFF00:
        colourName = "Yellow";
        break;
    }
    
    println("Connection Type " + str(type) + " for " + colourName);
  }
  
  void show(PVector[] vertices, float[] sidesHeadings, PVector[][] midPoints){
    stroke(col);
    strokeWeight(30);
    noFill();
    switch(type){
      case 0:
        break;
      case 1:
        int vIndex = (start + 1)%6; // so it circles around again
        arc(vertices[vIndex].x, vertices[vIndex].y,R,R,headings[start],headings[end]);
        break;
      case 2:
        int sIndex = (start + 1)%6;
        arc(midPoints[sIndex][1].x,midPoints[sIndex][1].x,wideR, wideR, sidesHeadings[start], sidesHeadings[end]);
        break;
      case 3:
        line(midPoints[start][0].x, midPoints[start][0].y, midPoints[end][0].x, midPoints[end][0].y);
        break;
    }
  }
}
