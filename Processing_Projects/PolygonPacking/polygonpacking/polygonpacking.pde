float maxSize = 100;
float growthRate = 1;
Tri[] swarm;
int n = 15;
float triAngle = PI/36;
void setup(){
  size(720, 720);
  swarm = new Tri[n];
  initSwarmMethodA();
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
