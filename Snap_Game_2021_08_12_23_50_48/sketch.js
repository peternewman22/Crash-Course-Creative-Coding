let testCard;
let startTime = 0;
let cardTypes = ["Triangle", "TriangleText", "Square","SquareText","Circle","CircleText","Star","StarText"];
let deck;
let lobby = [];
let stack = [];
let currentPlayer = 0;
let currentCard = null;

function setup() {
  createCanvas(720, 720);
  rectMode(RADIUS);
  testCard = new Card("TriangleText");
  textAlign(CENTER);
  textSize(width/16);
  
  lobby.push(new Player("Player1"));
  lobby.push(new Player("Player2"));
  lobby.push(new Player("Player3"));
  deck = new Deck();
  deck.deal(lobby);
  for(let i = 0; i < lobby.length; i++){
    lobby[i].showHand();
  }
  
}

function draw() {
  background(0);
  if(!lobby[currentPlayer].hasPlayed){
    currentCard = lobby[currentPlayer].playCard();
  }  
  // testCard.show();
  // startTime=millis();
}

function keyPressed(){
  if(keyCode === ' '){
    currentPlayer = (currentPlayer + 1)%lobby.length;
  }
}

function mousePressed(){
  if(mouseButton === LEFT){
    let endTime = millis();
    console.log(`Start time: ${startTime}, End Time: ${endTime}, Score: ${(endTime - startTime)}`);
  }
}



