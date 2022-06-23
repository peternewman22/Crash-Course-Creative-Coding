color red = #E4151C;
color black = #000008;
color green = #0CC89E;
color yellow = #F2AB11;
color white = #FFFFFF;



void setup(){
  size(400, 400);
}

void draw(){
  background(255);
  
  // Uncomment for guidelines
  //stroke(0);
  //line(width/4, 0,width/4, height);
  //line(0.75*width, 0,0.75*width, height);
  //line(width/2, 0, width/2, height);
  //line(0, height/4, width, height/4);
  //line(0, height*0.75, width, height*0.75);
  //line(0,height/2, width, height/2);
  
  
  // top left quarter
  fill(red);
  ellipse(width/4, height/8, width/4, height/4);
  
  fill(green);
  arc(0, height/2, width/2, height/2, -HALF_PI, 0, PIE);
  
  fill(black);
  arc(width/2, height/2, width/2, height/2, PI, 0.75*TWO_PI, PIE);
  
  
  // bottom left quarter
  
  fill(yellow);
  arc(width/4, height/2, width/2, height/2, HALF_PI, PI, PIE);
  
  fill(red);
  arc(width/4, height/2, width/2, height/2, 0, HALF_PI, PIE);
  
  stroke(red);
  arc(0,height,width/2, height/2,-HALF_PI,0, CHORD);
  arc(width/4, 0.75*height, width/2, height/2,HALF_PI,PI, CHORD);
  noStroke();
  
  fill(yellow);
  stroke(yellow);
  arc(width/2, height, width/2, height/2, PI, TWO_PI*0.75, CHORD);
  arc(width/4, 0.75*height, width/2, height/2, 0,HALF_PI, CHORD);
  noStroke();
  
  
  // top right quarter - Note: order is important
   
  fill(green);
  triangle(width/2, height/4, width*0.75,height/2,width/2,0.75*height);
  
  fill(black);
  triangle(width, height/4, width*0.75, height/2, width, 0.75*height);
  
  fill(red);
  ellipse(0.75*width,height/4, width/2, height/2);
  
  fill(white);
  ellipse(0.75*width,0.75*height,width/2, height/2);
  
  
  // bottom right quarter
  fill(black);
  rect(width/2, height*0.75, width/2, height/4);
  
  fill(white);
  ellipse(0.75*width, height/4, height/4, height/4);
  
  fill(green);
  ellipse(0.75*width,0.75*height,width/4, height/4);
  




  

  




}
