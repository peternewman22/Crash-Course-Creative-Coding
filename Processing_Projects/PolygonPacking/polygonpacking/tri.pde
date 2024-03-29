class Tri{
  PVector pos;
  float a;
  float r;
  float rMax;
  Tri(float x, float y, float a_){
    a = a_;
    pos = new PVector(x,y);
    r = 1;
    rMax = map(PVector.dist(pos,c), 0, width, 100, 1);
  }
  void grow(){
    if(r < rMax){
      r += growthRate;
    }
  }
   void show(){
     pushMatrix();
     translate(pos.x, pos.y);
     rotate(a);
     noStroke();
     triangle(
       -r,0,
       r*cos(triAngle), r*sin(triAngle), 
       r*cos(triAngle), -r*sin(triAngle)
     );
     stroke(255,0,0);
     strokeWeight(2);
     point(0, 0);
     
     popMatrix();
     
   } 
}
