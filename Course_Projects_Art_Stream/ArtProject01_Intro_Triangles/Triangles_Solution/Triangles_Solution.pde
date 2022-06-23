color yellow = #FAC22B;
color purple = #603E95;
color red = #D7255B;
color green = #009DA1;

void setup(){
  size(400,400);
  stroke(255);
  strokeWeight(4);
  strokeJoin(BEVEL);
}

void draw(){
  background(255);
  fill(yellow);
  triangle(0,0,width,0,0,height);
  fill(purple);
  triangle(0,height,width/2, height/2, width/2, height);
  fill(green);
  triangle(width/2, height/2, width/2, height,width, height);
  fill(red);
  triangle(width/2, height/2,width, height, width, 0);
  

}
