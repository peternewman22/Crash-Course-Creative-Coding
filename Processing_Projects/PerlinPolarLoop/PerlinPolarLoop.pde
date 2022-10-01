int n = 360;
float noiseMax = 2;
float rotRate = 0.2;
float rot = 0;
float a, xOff, yOff, rOff, x, y;
float rOffRatio = 0.5;
float tOff = 0;
float tRate = 0.01;
float R = 0;
float grow = 0.01;
float rMax;
float rTrack = 0;
void setup(){
  size(1000, 1000);
  noFill();
  stroke(255, 0, 0, 20);
  background(0);
  rMax = width/3;
  
}

void draw(){
  beginShape();
  R = rMax*cos(grow);
  for(int i = 0; i < n; i++){
    a = i*TWO_PI/n;
    xOff = map(cos(a), -1, 1, 0, noiseMax);
    yOff = map(sin(a), -1, 1, 0, noiseMax);
    rOff = map(noise(xOff, yOff, tOff), 0,1, -R*rOffRatio, R*rOffRatio);
    x = (R + rOff)*cos(a + rot) + width/2;
    y = (R + rOff)*sin(a + rot) + height/2;
    vertex(x,y);
  }
  endShape(CLOSE);
  //R += grow;
  tOff += tRate;
  rot += rotRate;
  rTrack += grow;
  
  //if(1.5*R > width/2){
  //  println("FINISHED!");
  //  noLoop();
  //}
  if(rTrack > PI){
    println("FINISHED!");
    noLoop();
  }
}
