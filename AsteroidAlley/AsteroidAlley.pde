/*
Music: https://soundimage.org/sci-fi/
 Specifically: http://soundimage.org/wp-content/uploads/2016/07/Trouble-on-Mercury_Looping.mp3
 http://soundimage.org/wp-content/uploads/2016/01/Light-Years_V001_Looping.mp3
 */

import processing.sound.*;

float f; // global flicker rate
Starfield starfield;
AsteroidField asteroidfield;
boolean debugMode;
float difficultyMult;
int score;
SoundFile track2;
boolean isGameOver;
PVector mousePos;


void setup() {
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
  track2 = new SoundFile(this, "Track2.mp3");
  track2.play();
  isGameOver = false;
  mousePos = new PVector(width/2, height/2);
}

void draw() {
  background(0);
  mousePos.set(mouseX, mouseY);
  starfield.show();
  asteroidfield.update();
  asteroidfield.show();
  f += 0.05;
  if (isGameOver) {
    textSize(100);
    fill(255, 0, 0);
    text("GAME OVER", width/2, height/2+100);
    noLoop();
  }

  showScore();
  if (score % 20 == 0) {
    difficultyMult += 0.1;
  }

  detectCollisions();
}

void detectCollisions() {
  // loop through and check that the distance from the mouse to the asteroid isn't smaller than its radius
  for (Asteroid a : asteroidfield.asteroids) {
    float mouse2Asteroid = mousePos.dist(a.pos);
    if (mouse2Asteroid < a.d/2) {
      isGameOver = true;
    }
  }
}

void showScore() {
  fill(255);
  text(score, width/2, 50);
}

void keyPressed() {
  if (keyCode == ' ') {
    debugMode = !debugMode;
  }
}
