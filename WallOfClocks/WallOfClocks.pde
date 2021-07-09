/*
Inspired by https://www.youtube.com/watch?v=ExkVIQ60ClM&ab_channel=Insider
 */
float increment = 0.01;
float r;

c1 = new Clock(0, PI/2, width/2-r, height/2-r);
c2 = new Clock(PI, PI/2, width/2+r, height/2 - r);
c3 = new Clock(PI, -PI/2, width/2+r, height/2+r);
c4 = new Clock(0, -PI/2, width/2-r, height/2+ r);
Clock[] clocks = {c1, c2, c3, c4};



void setup() {
  size(500, 500);
  r = 50;
  fill(255);
  strokeWeight(2);
}

void draw() {
  background(0);
  c1.update(-PI/2, PI);
  c1.show();
  c2.update(-PI/2, 0);
  c2.show();
  c3.update(PI/2, 0);
  c3.show();
  c4.update(PI/2, PI);
  c4.show();
}
