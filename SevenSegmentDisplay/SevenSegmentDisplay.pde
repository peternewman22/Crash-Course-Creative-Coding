float w;
float t;
Segment[] segs;

int currentNumber = 0;
boolean[] zero = {true, true, true, true, true, true, false}; //0
boolean[] one ={false, false, false, false, true, true, false}; //1
boolean[] two ={true, true, false, true, true, false, true}; //2
boolean[] three ={false, true, true, true, false, false, true}; //3
boolean[] four = {false, true, true, false, false, true, true}; //4
boolean[] five = {true, false, true, true, false, true, true}; //5
boolean[] six = {true, false, true, true, true, true, true}; //6
boolean[] seven = {true, true, true, false, false, false, false}; //7
boolean[] eight = {true, true, true, true, true, true, true, true}; //8
boolean[] nine = {true, true, true, true, false, true, true, true}; //9
boolean[][] numbers = {zero, one, two, three, four, five, six, seven, eight, nine};

void setup() {
  size(400, 400);
  w = (width - 100) / 2;
  t = 20;
  rectMode(CENTER);
  fill(255, 0, 0);
  stroke(0);
  strokeWeight(1);
  
  // declaring segments
  segs = new Segment[7];
  segs[0] = new Segment(0, -w - t, w, t); // tm
  segs[1] = new Segment(0.5 * (w + t), -0.5 * (w + t), t, w); // tr
  segs[2] = new Segment(0.5 * (w + t), 0.5 * (w + t), t, w); //br
  segs[3] = new Segment(0, w + t, w, t); // bm
  segs[4] = new Segment(-0.5 * (w + t), 0.5 * (w + t), t, w); //bl
  segs[5] = new Segment(-0.5 * (w + t), -0.5 * (w + t), t, w); // tl
  segs[6] = new Segment(0, 0, w, t); //mm

  // defining numbers
  
}

void draw() {
  background(0);
  push();
  translate(width / 2, height / 2);
  for (int i = 0; i < segs.length; i++) {
    if (numbers[currentNumber][i]) {
      segs[i].show();
    }
  }
  pop();
}

void keyPressed() {
  if (keyCode == LEFT) {
    currentNumber -= 1;
  } else if (keyCode == RIGHT) {
    currentNumber += 1;
  }
  //wrapping around
  if (currentNumber < 0) {
    currentNumber += 10;
  } else if (currentNumber > 9) {
    currentNumber -= 10;
  }
}
