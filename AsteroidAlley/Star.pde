class Star{
  int c;
  PVector p;
  float size;
  float flickerMin;
  float flickerCentre;
  float flickerRate;
  float flickerDiff;
  float offset;
  Star(){
    p = new PVector(random(width), random(height));
    c = int(random(1,360));
    flickerMin = int(random(128, 255));
    flickerCentre = int((255 - flickerMin)/2);
    flickerRate = random(0.1, 2);
    flickerDiff = flickerCentre - flickerMin;
    offset = random(0,PI/2);
    size = random(1,10);
  }
  
  void show(){
    //int brightness = int(flickerCentre + flickerDiff*sin(flickerRate*f + offset));
    int brightness = int(200 + 55*sin(f*flickerRate + offset));
    fill(c, 255, brightness);
    ellipse(p.x, p.y, size, size);
  }
}
