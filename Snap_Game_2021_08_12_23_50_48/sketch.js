let testCard;
let startTime = 0;
let cardTypes = ["Triangle", "TriangleText", "Square", "SquareText", "Circle", "CircleText", "Star", "StarText"];
let deck;
let lobby = [];
let stack = [];
let currentPlayer = 0;
let currentCard = null;
let prevPlayer;
let prevCard = null;
let matchFound = false;

function setup() {
  createCanvas(720, 720);
  rectMode(RADIUS);
  testCard = new Card("TriangleText");
  textAlign(CENTER);
  textSize(width / 16);

  lobby.push(new Player("Player1"));
  lobby.push(new Player("Player2"));
  lobby.push(new Player("Player3"));
  deck = new Deck();
  deck.deal(lobby);
  for (let i = 0; i < lobby.length; i++) {
    lobby[i].showHand();
  }

  currentCard = lobby[currentPlayer].playCard();

}


function draw() {
  background(0);

  
  currentCard.show();
  showTopOfStack();
  if (stack.length > 0) {
    matchFound = checkForMatch();
  }
  if (matchFound) {
    console.log("Match Found!")
    snap();
  }
  fill(255);
  text(`Current Player: ${currentPlayer}`, width / 2, 7 * height / 8);
  // testCard.show();
  // startTime=millis();
}

function playCard(){

}

function snap() {
  // pick a winner
  let lastPlace = int(random(lobby.length));
  lobby[lastPlace].receiveStack(stack);
  stack = [];
  currentPlayer = lastPlace;
}

function checkForMatch() {
  matchFound = currentCard.shape.includes(prevCard.shape) || prevCard.shape.includes(currentCard.shape);

}

function showTopOfStack() {
  if (stack.length > 0) {
    stack[stack.length - 1].show();
  }
}

function keyPressed() {
  if (keyCode === ENTER) {
    if (lobby[currentPlayer].hasPlayed) {
      prevCard = currentCard;
      prevCard.placeOnStack();
      console.log(`Previous card: ${prevCard.shape}`); // debug
      stack.push(prevCard);
      prevPlayer = currentPlayer;
      currentPlayer = (currentPlayer + 1) % lobby.length;
      currentCard = lobby[currentPlayer].playCard();
      console.log(`Current card: ${currentCard.shape}`); // debug
      lobby[prevPlayer].markHasNotPlayed();
      // for (let i = 0; i < lobby.length; i++) {
      //   lobby[i].showHand();
      // }
      console.log(`Stack length: ${stack.length}`);
    }

  }
}

// function mousePressed(){
//   if(mouseButton === LEFT){
//     let endTime = millis();
//     console.log(`Start time: ${startTime}, End Time: ${endTime}, Score: ${(endTime - startTime)}`);
//   }
// }