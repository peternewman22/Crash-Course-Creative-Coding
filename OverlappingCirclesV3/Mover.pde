class Mover {
  PVector p;
  PVector v;
  PVector prev;
  ArrayList<Float> prevs; 
  float r;
  float yOff, xOff;
  float a;
  float heading;
  Mover(float x, float y) {
    p = new PVector(x, y);
    //prev = new PVector(x,y);
    prevs = new ArrayList<Float>();
    //v = new PVector(1,0);
    r = 20;
    heading = 0;
    yOff = random(1000);
    xOff = random(1000);
    a = 0;
  }

  void update() {
    prev.set(p.x, p.y);
    
    p.set(map(noise(xOff), 0, 1, -width/2, width/2), map(noise(yOff), 0, 1, -height/2, height/2));
    if (frameCount%5 == 0) {
      prevs.add(PVector.sub(p, prev).heading());
    }
    yOff += 0.002;
    xOff += 0.002;
    a += 0.1;
    if(prevs.size() > 10){
      prevs.remove(0);
    }
    
    if(prevs.size() == 0){
      float total = 0;
      for(float h: prevs){
        total += h;
      }
      heading = total/10;
    }
    //p.add(v);
  }

  void show() {
    //float a = map(p.x, 0, width, 0, 8*TWO_PI);
    float d = abs(r*sin(a) + r*cos(a));
    //float heading = PVector.sub(p, prev).heading();

    //stroke(int(map(d, -2*r, 2*r, 0, 360)), 100, 100, 50);

    pushMatrix();
    translate(p.x, p.y);
    rotate(heading);
    stroke(0, 0, 100);
    //line(p.x, p.y + r*sin(a), p.x, p.y + r*cos(a));
    line(p.x, p.y, p.x + 20, p.y);

    strokeWeight(1);
    //ellipse(p.x, p.y + r*sin(a), 2*r, 2*r);
    //ellipse(p.x, p.y + r*cos(a), 2*r, 2*r);
    popMatrix();
  }
}
