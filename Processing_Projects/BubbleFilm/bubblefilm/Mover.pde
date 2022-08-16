class Mover{
  PVector pos, vel;
  
  Mover(float x, float y){
    pos = new PVector(x,y);
    vel = PVector.random2D();
  }
  
  void update(){
    pos.add(vel);
    if(pos.x < 0 || pos.x > width){
      vel.x = -vel.x;
    }
    if(pos.y < 0 || pos.y > height){
      vel.y = -vel.y;
    }
  }
  
  void show(){
    point(pos.x, pos.y);
  }
}
