Hex[][] grid;
float rM;
float r;
int n =15;
int weight = 15;
float xSep;
float tightArcSize;
float looseArcSize;
float s;

void setup(){
  size(720, 720);
  strokeWeight(weight);
  strokeCap(SQUARE);
  stroke(color(#967bb6,255));
  rM = width/((n-1)*(1+sin(PI/6)));
  r = rM*cos(PI/6);
  xSep = rM*(1+sin(PI/6));
  tightArcSize = 2*rM*sin(PI/6);
  s = 2*rM*sin(PI/6);
  looseArcSize = 2*1.5*s;
  background(0);

  noFill();

  
  // init grid
  grid = new Hex[n][n];
  for(int row = 0; row < n; row++){
    for(int col = 0; col < n; col++){
      if(col % 2 == 1){
        grid[row][col] = new Hex(col*xSep, (2*row+1)*r);
      } else {
        grid[row][col] = new Hex(col*xSep, 2*row*r);
      }
      grid[row][col].show();
    }
  }
  
}

void draw(){

}
