Hex[][] grid;
float rM;
float r;
int n =40;
int weight = 15;
float xSep;
float tightArcSize;
float looseArcSize;
float s;
color bg;
color fg;
Hex test;
int[] statePool = {0,1,2,3,4};

void setup(){
  size(1000, 1000);
  noStroke();
  //bg = color(#FCB61A,255);
  //fg = color(#F4F3F0, 255);
  bg = color(#171718, 255);
  fg = color(#C0FF2D, 255);
  rM = width/((n-1)*(1+sin(PI/6)));
  r = rM*cos(PI/6);
  xSep = rM*(1+sin(PI/6));
  tightArcSize = 2*rM*sin(PI/6);
  s = 2*rM*sin(PI/6);
  looseArcSize = 2*1.5*s;
  background(0);

  noFill();
  
  
  //test = new Hex(width/2, height/2);
  //test.show();
  // init grid
  grid = new Hex[n][n];
  for(int row = 0; row < n; row++){
    for(int col = 0; col < n; col++){
      if(col % 2 == 1){
        grid[row][col] = new Hex(col*xSep, (2*row+1)*r, statePool[int(random(statePool.length))]);
      } else {
        grid[row][col] = new Hex(col*xSep, 2*row*r, statePool[int(random(statePool.length))]);
      }
      grid[row][col].show();
    }
  }
  
}

void draw(){

}

void generateEvenStatePool(){
  
}
