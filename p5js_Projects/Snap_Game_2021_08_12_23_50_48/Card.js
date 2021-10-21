class Card{
  constructor(shape){
    this.shape = shape;
    this.pos = createVector(width/2, height/2);
    this.onStack = false;
    this.w = width/8;
    this.resize();
   
  }
  
  resize(){
    this.h = 2*this.w;
    this.r = this.w/2;
  }

  placeOnStack(){
    this.onStack = true;
    this.pos.set(width/4, height/2);
    this.w = width/12;
    this.resize();
  }
   
  
  show(){
    fill(255);
    noStroke();
    textSize(this.r)
    rect(this.pos.x, this.pos.y, this.w, this.h, this.r);
    switch(this.shape){
      case "Triangle":
        this.drawTriangle();
        break;
      case "Square":
        this.drawSquare();
      break;
      case "Circle":
        this.drawCircle();
        break;
      case "Star":
        this.drawStar();
        break;
      case "StarText":
        fill(0);
        text("Star",this.pos.x, this.pos.y+this.r/2);
        break;
      case "CircleText":
        fill(0);
        text("Circle",this.pos.x, this.pos.y+this.r/2);
        break;
      case "SquareText":
        fill(0);
        text("Square",this.pos.x, this.pos.y+this.r/2);
        break;
      case "TriangleText":
        fill(0);
        text("Triangle",this.pos.x, this.pos.y+this.r/2);
        break;
    }
  }
  
  drawTriangle(){
    noFill();
    stroke(0);
    strokeWeight(8);
    beginShape();
      for(let i = 0; i < 3; i++){
        vertex(this.pos.x + width/16*cos(i*-TWO_PI/3-PI/6), this.pos.y + width/16*sin(i*-TWO_PI/3-PI/6));
      }
    endShape(CLOSE);
  }
  
   drawSquare(){
    noFill();
    stroke(0);
    strokeWeight(8);
    rect(this.pos.x, this.pos.y, width/16, width/16);
  }
  
  drawCircle(){
    noFill();
    stroke(0);
    strokeWeight(8);
    ellipse(this.pos.x, this.pos.y, width/8, width/8);
  }
  
  drawStar(){
    noFill();
    stroke(0);
    strokeWeight(8);
    beginShape();
      for(let i = 0; i < 3; i++){
        vertex(this.pos.x + width/16*cos(i*-TWO_PI/3-PI/6), this.pos.y + width/16*sin(i*-TWO_PI/3-PI/6));
      }
    endShape(CLOSE);
     beginShape();
      for(let i = 0; i < 3; i++){
        vertex(this.pos.x + width/16*cos(i*TWO_PI/3+PI/6), this.pos.y + width/16*sin(i*TWO_PI/3+PI/6));
      }
    endShape(CLOSE);
  }
}