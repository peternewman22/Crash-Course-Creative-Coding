float r;
float rM;
float d;
//Hex test;
int testState;
Hex[][] grid;
int n = 25;
int weight;
float ySpacing;

void setup(){
  size(720, 720);
  stroke(255, 100, 100);
  noFill();
  r = width/(1.5*n);
  rM = r/cos(PI/6);
  ySpacing = rM*(1+sin(PI/6));
  weight = 200/n;
  strokeWeight(weight);
  background(0);
  grid = new Hex[n][n];
  for(int row = 0; row < n; row++){
    for(int col = 0; col < n; col++){
      if(row%2 == 0){
        grid[row][col] = new Hex(col*r*2, row*ySpacing);
      } else {
        grid[row][col] = new Hex(r*(col*2 + 1), row*ySpacing);
      }
      
      grid[row][col].show();
    }
  }
 save("TantrixTiling.png"); 
}
  
  //test = new Hex(width/2, height/2); 
  //test.show();
  


void draw(){

}

void keyPressed(){
  if(key == ' '){
    setup();
  }
}
