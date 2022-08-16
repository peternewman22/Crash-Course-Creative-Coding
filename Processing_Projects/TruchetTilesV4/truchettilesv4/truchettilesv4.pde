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
IntList statePool;// = {0,1,2,3,4};

void setup(){
  size(720, 720);
  noStroke();
  statePool = new IntList();
  generateStatePool();
  //bg = color(#FCB61A,255);
  //fg = color(#F4F3F0, 255);
  //bg = color(#171718, 255);
  //fg = color(#C0FF2D, 255);
  fg = color(#ADEFD1, 255);
  bg = color(#00203F, 255);
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
        grid[row][col] = new Hex(col*xSep, (2*row+1)*r, statePool.get(int(random(statePool.size()))));
      } else {
        grid[row][col] = new Hex(col*xSep, 2*row*r, statePool.get(int(random(statePool.size()))));
      }
      grid[row][col].show();
    }
  }
  
}

void draw(){

}

void generateStatePool(){
  for(int eachVal = 0; eachVal < 3; eachVal++){
    for(int i = 0; i < 10; i++){
      statePool.append(eachVal);
    }
  }
  for(int eachVal = 3; eachVal < 5; eachVal++){
    for(int i = 0; i < 35; i++){
      statePool.append(eachVal);
    }
  }
  
    
  }
  
