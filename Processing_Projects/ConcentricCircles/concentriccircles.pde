color[] colours = {#012a4a, #013a63, #01497c, #014f86, #2a6f97, #2c7da0, #468faf, #61a5c2, #89c2d9, #a9d6e5};
Gen test;
float tMin = 2;

void setup(){
    size(1000, 1000);
    noFill();
    test = new Gen(300, 10, width/2, height/2);
    background(0);
    test.show();
}

void draw(){


}

void mousePressed(){
    if(mouseButton == LEFT){
    setup();
    }
}