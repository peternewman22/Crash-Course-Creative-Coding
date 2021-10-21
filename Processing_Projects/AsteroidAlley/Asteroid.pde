class Asteroid{
  // first iteration: empty circles
  PVector pos, vel;
  float angVel;
  float ang = 0;
  float d;
  boolean isFinished;
  float noiseScale = 0.1;
  int numPoints = 100;
  float radius = 200;
  float[][] vertices;
  Asteroid(){
    d = random(50,200);
    pos = new PVector(width+d,random(d,height-d)); // this way the asteroid always appears fully on the screen
    vel = new PVector(-random(0.2,2),0); // note: difficulty mult only applies upon creation ? - currently speeding up
    isFinished = false;
    numPoints = int( random(50,200));
    vertices = new float[numPoints][2];
    radius = random(50,200);
    createPolygon(0,0,radius, numPoints);
    angVel = random(-0.03,0.03);
    
  }
  
  void update(){
    pos.add(vel);
    if(pos.x < -d/2){
      isFinished = true;
      score += 1;
    }
  }
  
  void show(){
    int c = int(map(vel.x, -0.5, -3, 0, 255)); // c represents velocity in some way
    stroke(c, 255, 255);
    strokeWeight(5);
    //ellipse(pos.x, pos.y, d, d);
    drawPolygon(pos.x, pos.y);
  }
  
  void createPolygon(float x, float y, float radius, int npoints){
    float angle = TWO_PI / npoints;
    float[] perlin = new float[npoints];
    float sum = 0;
    for(int p = 0; p < npoints; p++){
      perlin[p] = noise(p*noiseScale);
      sum += perlin[p];
    }
    float avPerlin = sum/npoints;
    int count = 0;
    float factor = radius/2;
    for (float a = 0; a < TWO_PI; a += angle) {
      if(count < npoints){
      float sx = x + radius * cos(a) + factor * (avPerlin - perlin[count])* cos(a);
      float sy = y + radius * sin(a) + factor * (avPerlin - perlin[count])* sin(a);
      vertices[count][0] = sx;
      vertices[count][1] = sy;
      count++;
    }
  }
  
  }
  void drawPolygon(float x, float y) {
  ang+= angVel;
  pushMatrix();
  
  translate(x, y);
  rotate(ang);
  beginShape();
  for (int p = 0; p < numPoints; p++) {
    vertex(vertices[p][0], vertices[p][1]);
   }
  endShape(CLOSE);
  popMatrix();
}
  
  
}
