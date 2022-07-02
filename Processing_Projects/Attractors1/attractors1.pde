Attractor test;
float inc = 0.005;
float brushSize = 5;
float attractK = 100;
float repulseK = 10;
color[] colours = {#0D03045e, #0D023e8a, #0D0077b6, #0D0096c7, #0D00b4d8, #0D48cae4, #0D90e0ef, #0Dade8f4, #0Dcaf0f8};
Attractee[] swarm;
int n = 20;
float maxSpeed = 2;

void setup(){
    size(1000, 1000);
    test = new Attractor();
    swarm = new Attractee[n];
    for(int i = 0; i < swarm.length; i++){
        swarm[i] = new Attractee();
    }
    noStroke();
    background(255);
}

void draw(){
    background(0);
    test.update();
    test.show();

    // fill(255);
    for(int i = 0; i < swarm.length; i++){
        swarm[i].attract();
        for(int j = 0; j < swarm.length; j++){
            if(i != j){
                swarm[i].repel(swarm[j].pos);
            }
        }
        swarm[i].update();
        swarm[i].resolveEdges();
        swarm[i].show();
    }

}

void follow(PVector f){

}