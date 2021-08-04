Layer[] layers;
int layerCount;

void setup(){
  size(500, 500);
  noFill();
  colorMode(HSB,360,100,100);
  background(255,0,100);
  layerCount = 100;
  layers = new Layer[layerCount];
  for(int i = 0; i < layers.length; i++){
    float y = map(i,0,layers.length,450,50);
    float r;
    if(i < layers.length/2){
      r = map(i,0,layers.length/2,0,200);
    } else {
      r = map(i,layers.length/2, layers.length,200,0);
    }
    
    layers[i] = new Layer(y, r, i);
  }
  for(int i = 0 ; i < layers.length; i++){
    layers[i].show();
  }

  save("HSB Cone.png");
}

void draw(){
  
  
}

