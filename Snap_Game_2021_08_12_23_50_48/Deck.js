class Deck{
  constructor(){
    this.deck = []
    for(let i = 0; i < cardTypes.length; i++){
      this.deck.push(new Card(cardTypes[i]));
      this.deck.push(new Card(cardTypes[i]));
    }
    this.deck = shuffle(this.deck);
    
  }
  showDeck(){
    for(let i = 0; i < this.deck.length; i++){
      console.log(this.deck[i].shape);
    }
  }
  
  deal(lobby){
    for(let i = 0; i < this.deck.length; i++){
      lobby[i%lobby.length].receiveCard(this.deck[i]); // deal out all cards to all players
    }
  }
}