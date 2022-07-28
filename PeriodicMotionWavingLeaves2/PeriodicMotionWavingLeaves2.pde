Leaf leaf;
Leaf[] leafs;
CounterLeaf[] counterLeafs;
color[] colours = {#d8f3dc,#b7e4c7,#95d5b2,#74c69d,#52b788,#40916c,#2d6a4f,#1b4332,#081c15};
color[] colours2 = {#ea698b,#d55d92,#c05299,#ac46a1,#973aa8,#822faf,#6d23b6,#6411ad,#571089,#47126b,#000000};
float globA;
void setup() {
  size(720, 720);

  //leaves = new Leaf[10];
  leafs = new Leaf[10];
  counterLeafs = new CounterLeaf[10];
  leafs[0] = new Leaf(1, 0, 0, colours2[0],colours2[1]);
  counterLeafs[0] = new CounterLeaf(1, 0, 0, colours2[0],colours2[1]);
  for (int i = 1; i < leafs.length; i++){
    float offset = -PI/6 + i*PI/3/leafs.length;
    
    int colIx = (i+1)%colours2.length;
    leafs[i] = new Leaf(leafs[i-1].scale+0.1,offset,i*PI/leafs.length, colours2[i], colours2[colIx]);
    counterLeafs[i] = new CounterLeaf(counterLeafs[i-1].scale+0.1,offset,i*PI/leafs.length, colours2[i], colours2[colIx]);
  }
  //noLoop();
}

void draw() {
  background(0);
    translate(width/2, height/2);
    for(int i = 0; i < leafs.length; i++){
      leafs[i].update();
      counterLeafs[i].update();
    }
    
    
    for(int i = leafs.length - 1 ; i > 0; i--){
      
      for(int j = 0; j < 3; j++){
        pushMatrix();
        rotate(j * TWO_PI/3);
        leafs[i].show();
        counterLeafs[i].show();
        popMatrix();
      }
    }
    
    globA += TWO_PI/300; // equivalent to 0.02;
}

void keyPressed(){
  if(keyCode == ENTER){
    loop();
  }
}
