class Thorn{
  PVector pos, vel;
  float r;
  color c;
  
  Thorn(float x, float y, float r_, color c_){
    pos = new PVector(x,y);
    r = r_;
    vel = PVector.random2D();
    c = c_;
    
  }
  
  void update(){
    pos.add(vel);
    r -= decayRate;
  }
  
  void show(){
    fill(c);
    if(r > 1){
      ellipse(pos.x, pos.y, r, r);
    }
    
  }
}
