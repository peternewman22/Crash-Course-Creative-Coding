PVector start, end, mouse;
float pt0Off, pt1Off, pt2Off, pt3Off, pt4Off;
void setup(){
  size(720, 360);
  start = new PVector(width/6, height/2);
  end = new PVector(5*width/6, height/2);
  mouse = new PVector(mouseX, mouseY);
  noFill();
  pt0Off = random(1000);
  pt1Off = random(1000);
  pt2Off = random(1000);
  pt3Off = random(1000);
  pt4Off = random(1000);
  background(255);
  stroke(0,5);
  
}

void draw(){
  //background(255);
  mouse.set(mouseX, mouseY);
  
  //ellipse(start.x, start.y, 10, 10);
  start.set(start.x, map(noise(pt0Off),0,1,2*height/5, 3*height/5));
  end.set(end.x, map(noise(pt4Off),0,1,2*height/5, 3*height/5));
  beginShape();
  curveVertex(start.x, start.y);
  curveVertex(start.x, start.y);
  curveVertex(2*width/6, map(noise(pt1Off),0,1,height/2, 4*height/5));
  curveVertex(3*width/6, map(noise(pt2Off),0,1,2*height/5, 3*height/5));
  curveVertex(4*width/6, map(noise(pt3Off),0,1,height/5, height/2));
  curveVertex(end.x, end.y);
  curveVertex(end.x, end.y);
  endShape();
  //ellipse(end.x, end.y, 10, 10);
  pt0Off += 0.005;
  pt1Off += 0.005;
  pt2Off += 0.005;
  pt3Off += 0.005;
  pt4Off += 0.005;
  
  
}
void keyPressed(){
  if(keyCode == ' '){
    save("Cool Thing.png");
    noLoop();
  }
}
void mouseDragged(){
  if(PVector.dist(mouse, start) < 50){
    start.set(mouseX, mouseY);
  } else if(PVector.dist(mouse,end) < 50){
    end.set(mouseX, mouseY);
  }
}
