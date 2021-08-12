class Player{
  constructor(id){
    this.id = id;
    this.hand = [];
    this.hasPlayed = false;
  }
  
  showHand(){
    console.log(`${this.id}: ${this.hand.map(eachCard => eachCard.shape)}`);
  }
  
  receiveCard(card){
    this.hand.push(card);
  }
  
  playCard(){
    let currentCard = this.hand[this.hand.length -1];
    this.hand.pop();
    return currentCard;
  }
  
  markHasPlayed(){
    this.hasPlayed = true;
  }
  
  receiveStack(stack){
    this.hand = this.hand.concat(stack);
  }
  
}