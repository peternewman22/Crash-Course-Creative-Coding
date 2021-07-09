float w;
float t;
Segment[] segs;
boolean[][] numbers;
var currentNumber = 0;

void setup() {
  createCanvas(400, 400);
  w = (width - 100) / 2;
  t = 20;
  rectMode(CENTER);
  fill(255, 0, 0);
  stroke(0);
  strokeWeight(1);
  segs = new Segment[7];
  // declaring segments
  segs.push(new Segment(0, -w - t, w, t)); // tm
  segs.push(new Segment(0.5 * (w + t), -0.5 * (w + t), t, w)); // tr
  segs.push(new Segment(0.5 * (w + t), 0.5 * (w + t), t, w)); //br
  segs.push(new Segment(0, w + t, w, t)); // bm
  segs.push(new Segment(-0.5 * (w + t), 0.5 * (w + t), t, w)); //bl
  segs.push(new Segment(-0.5 * (w + t), -0.5 * (w + t), t, w)); // tl
  segs.push(new Segment(0, 0, w, t)); //mm

  numbers = new boolean[10][7];
  // defining numbers
  numbers[0] = [true, true, true, true, true, true, false]); //0
  numbers.push([false, false, false, false, true, true, false]); //1
  numbers.push([true, true, false, true, true, false, true]); //2
  numbers.push([true, true, true, true, false, false, true]); //3
  numbers.push([false, true, true, false, false, true, true]); //4
  numbers.push([true, false, true, true, false, true, true]); //5
  numbers.push([true, false, true, true, true, true, true]); //6
  numbers.push([true, true, true, false, false, false, false]); //7
  numbers.push([true, true, true, true, true, true, true, true]); //8
  numbers.push([true, true, true, true, false, true, true, true]); //9
}

function draw() {
  background(0);
  push();
  translate(width / 2, height / 2);
  for (let i = 0; i < segs.length; i++) {
    if (numbers[currentNumber][i]) {
      segs[i].show();
    }
  }
  pop();
}

void keyPressed() {
  if (keyCode == LEFT_ARROW) {
    currentNumber -= 1;
  } else if (keyCode == RIGHT_ARROW) {
    currentNumber += 1;
  }
  //wrapping around
  if (currentNumber < 0) {
    currentNumber += 10;
  } else if (currentNumber > 9) {
    currentNumber -= 10;
  }
}
