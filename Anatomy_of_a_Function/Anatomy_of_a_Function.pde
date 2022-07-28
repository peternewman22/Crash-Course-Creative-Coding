float a;

void setup(){
  size(1000, 1000);
  r = 0;
}

void draw(){
  background(0);
}

/*
This function has no parameters
              returns nothing
              updates a global variable
*/
void updateR(){
  
}

/*
This function has a float paramet
*/
PVector xyfromPolar(float r){
  float x = r*cos(a);
  float y = r*sin(a);
  return new PVector(x,y);
}
