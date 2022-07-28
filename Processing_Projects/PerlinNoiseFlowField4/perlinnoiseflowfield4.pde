/* 
1. Make a flow field
2. Release Particles from the outside
3. When they get a certain distance from the centre, they respawn
*/
color[] colours = {#0D03045e,#0D023e8a,#0D0077b6,#0D0096c7,#0D00b4d8,#0D48cae4,#0D90e0ef,#0Dade8f4,#0Dcaf0f8};
PVector c;
int n = 500;
int swarmCount = 5000;
int brushStroke = 2;
float res;
Mover[] swarm;
float r;
PVector[][] ffield;
float xOff = 0;
float yOff = 0;
float inc = 0.02;
float fieldStrength = 0.1;

void setup(){
    size(1000, 1000);
    background(0);
    noStroke();
    c = new PVector(width/2, height/2);
    r = 0.4*width;
    res = width/n;
    

    ffield = new PVector[n][n];
    
    for(int i = 0; i < n; i++){
        xOff += inc;
        yOff = 0;
        for(int j = 0; j < n; j++){
            yOff += inc;
            ffield[i][j] = PVector.fromAngle(map(noise(xOff, yOff), 0, 1, 0, TWO_PI));
        }
    }
    
    swarm = new Mover[swarmCount];
    for(int i = 0; i < swarm.length; i++){
        float a = i*TWO_PI/swarm.length;//random(TWO_PI);
        float startR = r;//constrain(abs(randomGaussian()*r/2),0,r);//random(r);
        swarm[i] = new Mover(width/2 + startR*cos(a),  height/2 + startR*sin(a), colours[int(random(colours.length))]);
    }
}

void draw(){
     //background(0);
    
        for(Mover m : swarm){
          if(!m.isDone){
            m.follow();
            m.update();
            m.show();
          }
        }
    
}

PVector lookup(float x, float y){
    return ffield[int(x/res)][int(y/res)];
}
