
PVector[] pts;
float noiseOff;
float yOff;

void setup(){
  size(1000, 500);
  pts = new PVector[10];
  noiseOff = random(1000);
  yOff = 0;
  for(int i = 0; i < pts.length; i++){
    pts[i] = new PVector(i*width/(pts.length - 1), map(noise(noiseOff),0,1,0, height));
    noiseOff += 0.8;
  }
  stroke(255,0,0,5);
  strokeWeight(2);
  noFill();
  background(0);
}

void draw(){
  //background(255);
  yOff = map(randomGaussian(),-3, 3, -height/8, height/8);
  beginShape();
    curveVertex(pts[0].x, pts[0].y+yOff);
    for(PVector p: pts){
      curveVertex(p.x, p.y + yOff);
      //ellipse(p.x, p.y, 10, 10);
    }
    curveVertex(pts[pts.length - 1].x, pts[pts.length - 1].y + yOff);
  endShape();
  

}

void keyPressed(){
  if(keyCode == ' '){
    save("GaussianPipe.png");
    noLoop();
  }
}
