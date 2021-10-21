class Starfield{
  Star[] stars;
  Starfield(int starCount){
    stars = new Star[starCount];
    for(int i = 0; i < stars.length; i++){
      stars[i] = new Star();
    }
  }
  
  void show(){
    for(Star s: stars){
      s.show();
    }
  }
}
