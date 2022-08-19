// float maxSize = 100;
float growthRate = 1;
Tri[] swarm;
int n = 100;
float triAngle = PI/36;
PVector c;
void setup(){
  size(720, 720);
  c = new PVector(width/2, height/2);
  swarm = new Tri[n];
  initSwarmMethodB();
  noStroke();
  fill(255);
}

void draw(){
  //for
  background(0);
  for(Tri pt: swarm){
    pt.grow();
    pt.show();
  }

}

void initSwarmMethodA(){
  for(int i = 0; i < n; i++){
    swarm[i] = new Tri(random(width), random(height), random(TWO_PI));
  }
}

void initSwarmMethodB(){
  for(int i = 0; i < n; i++){
    float x = random(width);
    float y = random(height);
    PVector p = new PVector(x,y);
    float angle = PVector.sub(p, c).heading();
    swarm[i] = new Tri(x, y, angle);
  }
}
