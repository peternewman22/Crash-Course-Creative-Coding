class Planet{
  PVector loc;
  PVector moonLoc;
  float a;
  float r;
  float phase;
  float period;
  Planet(float x, float y){
    loc = new PVector(x, y);
    r = 20;
    period = 1;
    phase = 0;
    moonLoc = new PVector(loc.x + r*cos(period*a + phase), loc.y + r*sin(period*a + phase));
  }
  
  void update(){
    a += 0.1;
    moonLoc.set(loc.x + r*cos(period*a + phase), loc.y + r*sin(period*a + phase));
  }
  
  
}
