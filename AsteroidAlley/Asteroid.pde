class Asteroid{
  // first iteration: empty circles
  PVector pos, vel;
  float d;
  boolean isFinished;
  Asteroid(){
    d = random(50,200);
    pos = new PVector(width+d,random(d,height-d)); // this way the asteroid always appears fully on the screen
    vel = new PVector(-random(0.5,3),0);
    isFinished = false;
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
    ellipse(pos.x, pos.y, d, d);
  }
}
