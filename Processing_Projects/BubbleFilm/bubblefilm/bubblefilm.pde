Mover pts[];
int n = 500;
float maxDist = 50;

color[] colours = {#10002b, #240046, #3c096c, #5a189a, #7b2cbf, #9d4edd, #c77dff, #e0aaff};


void setup() {
  size(720, 720);
  pts = new Mover[n];
  strokeWeight(1);
  //stroke(255);

  for (int i = 0; i < n; i++) {
    pts[i] = new Mover(random(width), random(height));
  }
}

void draw() {
  background(0);
  for (Mover m : pts) {
    m.update();
    //m.show();
  }
  for (int i = 1; i < pts.length; i++) {
    for (int j = 0; j < i; j++) {
      if (pts[i] != pts[j]) {
        float d = PVector.dist(pts[i].pos, pts[j].pos);
        
        if (d < maxDist) {
          stroke(colours[int(colours.length*d/maxDist)]);
          line(pts[i].pos.x, pts[i].pos.y, pts[j].pos.x, pts[j].pos.y);
        }
      }
    }
  }
}
