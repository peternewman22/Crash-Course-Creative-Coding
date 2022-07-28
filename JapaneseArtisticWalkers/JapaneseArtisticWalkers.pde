PVector[][] setA, setB;
float spacing = 50;
float d = 20;

void setup(){
  size(720, 720);
  setA = new PVector[5][5];
  setB = new PVector[5][5];
  
  for(int i = 0; i < 5; i++){
    for(int j = 0; j < 5; j++){
      setA[i][j] = new PVector(i*spacing, j*spacing);
      setB[i][j] = new PVector(i*spacing, j*spacing);
    }
  }
  
  
  noStroke();
}

void draw(){
  background(0);
  pushMatrix();
  translate(width/2, height/2 - 2*spacing);
  rotate(PI/4);
  for(int i = 0; i < 5; i++){
    for(int j = 0; j < 5; j++){
      if(i == 0 && j == 0){
        fill(255,0,0);
      } else {
        fill(255);
      }
      PVector p = setA[i][j];
      ellipse(p.x, p.y, d, d);
    }
  }
  popMatrix();

}
