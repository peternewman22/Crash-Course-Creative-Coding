class Tile {
  PVector pos;
  PVector[] vertices;
  float[] sidesHeadings;
  PVector[] midPoints;

  Connection[] connections;
  Tile(float x, float y, int rS, int rE, int gS, int gE, int bS, int bE, int yS, int yE) {
    pos = new PVector(x, y);
    
    // recording the vertices
    vertices = new PVector[6];
    for (int i = 0; i < 6; i++) {
      vertices[i] = new PVector(R*cos(i*TWO_PI/6), R*sin(i*TWO_PI/6));
    }
    
    // recording the sides
    sidesHeadings = new float[6];
    for (int i = 0; i < 6; i++) {
      int endIx = (i+1)%6;
      sidesHeadings[i] = PVector.sub(vertices[endIx], vertices[i]).heading();
    }
    
    // recording the midPoints
    midPoints =  new PVector[6];
    for(int i = 0; i < 6; i++){
      midPoints[i] = new PVector(r*cos((2*i+1)*PI/6), r*sin(2*i+1)*PI/6);
    }

    // creating the connections
    connections = new Connection[4];
    connections[0] = new Connection(pos, rS, rE, #FF0000);
    connections[1] = new Connection(pos, gS, gE, #00FF00);
    connections[2] = new Connection(pos, bS, bE, #0000FF);
    connections[3] = new Connection(pos, yS, yE, #FFFF00);
  }

  void show() {
    
    //draw Tile
    fill(0);
    beginShape();
    for (PVector p : vertices) {
      vertex(p.x, p.y);
    }
    endShape(CLOSE);

    // draw connections
    for (Connection c : connections) {
      c.show(vertices, sidesHeadings, midPoints);
    }
  }
}
