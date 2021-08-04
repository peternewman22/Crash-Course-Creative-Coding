class Layer{
  int b;
  float r;
  float y;
  Layer(float yPos, float radius, int brightness){
    y = yPos;
    r = radius;
    b = brightness;
  }

  void show(){
    for(int h = 0; h < 360; h++){
      for(int s = 0; s < 100; s++){
          stroke(h,s,b);
          float thisR = map(s, 0, 100, 0, r);
          float a = map(h, 0, 360, 0, TWO_PI);
          arc(width/2, y, 2*thisR, thisR, a, a+TWO_PI/360);
      }
    }
  }
}