class Tile {
  PVector pos;
  PVector[] vertices;
  float[] sidesHeadings;
  PVector[][] midPoints;
  int[][] cnx;

  Connection[] connections;
  Tile(float x, float y, int[][] sideAllocations) {
    pos = new PVector(x, y);
    cnx = sideAllocations;
    for(int j = 0; j<4; j++){
      for(int i = 0; i < 2; i++){
        print(cnx[j][i] + ", ");
      }
      print("\n");
    }
    // recording the vertices
    vertices = new PVector[6];
    for (int i = 0; i < 6; i++) {
      vertices[i] = new PVector(R*cos(i*TWO_PI/6), R*sin(i*TWO_PI/6));
    }
    
    // recording the sides
    //sidesHeadings = new float[6];
    //for (int i = 0; i < 6; i++) {
    //  int endIx = (i+1)%6;
    //   float h = PVector.sub(vertices[endIx], vertices[i]).heading();
    //   if(h < 0){
    //     sidesHeadings[i] = h + TWO_PI;
    //   } else {
    //     sidesHeadings[i] = h;
    //   }
    //}  
    //for(int i = 0; i < 6; i++){
    //  println(sidesHeadings[i]);
    //}
    
    // recording the midPoints
    midPoints =  new PVector[6][2];
    
    for(int i = 0; i < 6; i++){
      float a = (2*i+1)*PI/6;
      midPoints[i][0] = new PVector(r*cos(a), r*sin(a));
      midPoints[i][1] = new PVector(wideD*cos(a), wideD*sin(a));
    }

    // creating the connections
    connections = new Connection[4];
    connections[0] = new Connection(pos, cnx[0][0], cnx[0][1], #FF0000);
    connections[1] = new Connection(pos, cnx[1][0], cnx[1][1], #00FF00);
    connections[2] = new Connection(pos, cnx[2][0], cnx[2][1], #0000FF);
    connections[3] = new Connection(pos, cnx[3][0], cnx[3][1], #FFFF00);
  }

  void show() {
    
    //draw Tile
    fill(0);
    noStroke();
    beginShape();
    for (PVector p : vertices) {
      vertex(p.x, p.y);
    }
    endShape(CLOSE);

    // draw connections
    for (Connection c : connections) {
      c.show(vertices, midPoints);
    }
    
    fill(255, 0, 255);
    for(int i = 0; i < 6; i++){
      for(int j = 0; j < 2; j++){
        ellipse(midPoints[i][j].x, midPoints[i][j].y, 10, 10);
      }
    }
    noFill();
    ellipse(midPoints[0][1].x, midPoints[0][1].y, 2*wideR, 2*wideR);  
  }
}
