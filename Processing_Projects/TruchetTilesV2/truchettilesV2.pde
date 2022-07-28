float rMinor;
float rMajor;
float d;
//Hex test;
int testState;
Hex[][] grid;
int n = 20;

void setup(){
  size(720, 720);
  strokeCap(SQUARE);
  stroke(255, 100, 100);
  noFill();
  rMinor = width/(1.5*n);
  rMajor = rMinor/cos(PI/6);
  background(0);
  grid = new Hex[n][n];
  for(int row = 0; row < n; row++){
    for(int col = 0; col < n; col++){
      if(row%2 == 0){
        grid[row][col] = new Hex(col*rMinor*2, row*rMajor*(1+sin(PI/6)));
      } else {
        grid[row][col] = new Hex(rMinor*(col*2 + 1), row*rMajor*(1+sin(PI/6)));
      }
      
      grid[row][col].show();
    }
  }
  
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
