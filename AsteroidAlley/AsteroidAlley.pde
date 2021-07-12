float f; // global flicker rate 
Starfield starfield;
AsteroidField asteroidfield;
boolean debugMode;
float difficultyMult;
int score;


void setup(){
  size(1920, 1080);
  colorMode(HSB);
  f = 0;
  starfield = new Starfield(250);
  asteroidfield = new AsteroidField();
  debugMode = false;
  textAlign(CENTER);
  textSize(50);
  difficultyMult = 1;
  score = 0;

}

void draw(){
  background(0);
  starfield.show();
  asteroidfield.update();
  asteroidfield.show();
  f += 0.05;
  
  showScore();
  if(score % 20 == 0){
    difficultyMult += 0.1;
  }
 
  
  
  
}

void showScore(){
  fill(255);
  text(score, width/2, 50);
}

void keyPressed(){
  if(keyCode == ' '){
    debugMode = !debugMode;
  }
}
