/*
I want to experiment with the isometric view
Balls travelling in y-shortened circles, increasing in size with proximity to the "front" or PI/2
Then I can experiment with different arcs to mimick directional lighting
*/


Ring ring; 

void setup(){
    size(1000, 1000);
    ring = new Ring(5,3,400,40,0.01);
}

void draw(){
    background(0);
    translate(width/2, height/2);
    ring.update();
    ring.show();
}
