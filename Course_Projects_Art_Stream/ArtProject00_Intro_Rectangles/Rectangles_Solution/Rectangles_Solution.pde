color red = #E41422;
color white = #FFFFFF;
color blue = #0A54C1;
color grey = #BBBCC1;
color yellow = #F8EB00;

void setup(){
  size(400, 400);
  stroke(0);
  strokeWeight(10);
}

void draw(){
  background(0);
  fill(red);
  rect(0,0,width/2, height/4);
  
  fill(white);
  rect(0,height/4,width/2,height/2);
  rect(width/2, height/3, width/2, height/3);
  
  fill(yellow);
  rect(0,0.75*height,width/2, height/4);
  rect(0.75*width,0,0.25*width,height/3);
  
  fill(grey);
  rect(width/2,0,width/4, height/3);
  
  fill(blue);
  rect(width/2, height*2/3, width/2, height/3);

}
