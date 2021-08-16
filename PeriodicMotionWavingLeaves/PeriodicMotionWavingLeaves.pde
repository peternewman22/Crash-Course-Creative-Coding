Leaf leaf;
Leaf[] leaves;
color[] colours = {#d8f3dc,#b7e4c7,#95d5b2,#74c69d,#52b788,#40916c,#2d6a4f,#1b4332,#081c15};
color[] colours2 = {#ea698b,#d55d92,#c05299,#ac46a1,#973aa8,#822faf,#6d23b6,#6411ad,#571089,#47126b,#000000};
float globA;
void setup() {
  size(1000, 1000);

  leaves = new Leaf[10];
  leaves[0] = new Leaf(1, 0, 0, colours2[0],colours2[1]);
  for (int i = 1; i < leaves.length; i++){
    float offset = -PI/6 + i*PI/3/leaves.length;
    int colIx = (i+1)%colours2.length;
    leaves[i] = new Leaf(leaves[i-1].scale+0.1,offset,i*PI/leaves.length, colours2[i], colours2[colIx]);
  }
  noLoop();
}

void draw() {
  background(0);
    translate(width/2, height/2);
    for(Leaf leaf : leaves){
      leaf.update();
    }
    
    for(int i = leaves.length - 1 ; i > 0; i--){
      for(int j = 0; j < 3; j++){
        pushMatrix();
        rotate(j * TWO_PI/3);
        leaves[i].show();
        popMatrix();
      }
    }
    
    globA += 0.02;
}

void keyPressed(){
  if(keyCode == ENTER){
    loop();
  }
}
