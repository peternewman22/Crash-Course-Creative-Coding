class Light {
  PVector p;
  float xOff, yOff;
  Light() {
    p = new PVector(width/2, height/2);
    xOff = random(1000);
    yOff = random(1000);
  }

  void update() {
    p.set(map(noise(xOff), 0, 1, 0, width), map(noise(yOff), 0, 1, 0, height));
    xOff += 0.002;
    yOff += 0.002;
  }

  void show() {
    fill(360,0,255);
    noStroke();
    ellipse(p.x, p.y, 20, 20);
  }
}
