void setup(){
  size(500, 500);
  
  

}

void draw(){
  background(#a9a9a9);
  stroke(0);
  strokeWeight(5);
  fill(50, 255, 50);
  bezier(width/4, height/2, 3*width/8, 3*height/8, 5*width/8, 3*height/8, 3*width/4, height/2);
  stroke(25);
  bezier(width/4, height/2, 3*width/8, 5*height/8, 5*width/8, 5*height/8, 3*width/4, height/2);
  
}
