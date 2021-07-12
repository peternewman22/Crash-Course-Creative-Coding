class AsteroidField {
  ArrayList<Asteroid> asteroids;

  AsteroidField() {
    asteroids = new ArrayList<Asteroid>();
    asteroids.add(new Asteroid());
  }

    
  void update() {
    // decide if we're generating a new asteroid: 1% chance per frame
    if (random(1) < 0.01) {
      asteroids.add(new Asteroid());
    }
    
    // also update / discard finished asteroids
    for(int i = asteroids.size() - 1; i > 0; i--){
      asteroids.get(i).update();
      if(asteroids.get(i).isFinished){
        asteroids.remove(i);
      }
    }
  }
  
  void show() {
    fill(0);
    for(Asteroid a: asteroids){
      a.show();
    }
    
    if(debugMode){
      fill(255);
      text(asteroids.size(), 50, 50);
    }
  }
}
