// float x,y;
float step; 

void setup(){
    size(500, 720);
    stroke(255);
    strokeWeight(2);
    fill(50);
    background(0);
    step = (2*height/3)/20;;

    for(int i = 0; i < 20; i++){
        float  y = abs(height/8*randomGaussian())+height/8;
        float  x = width/8*randomGaussian();
        float yBase = height/3 + i*step;

        beginShape();
        
        curveVertex(0,yBase + 2*step);
        curveVertex(0,yBase + 2*step);
        // curveVertex(width/4 + x, height/2);
        curveVertex(width/4 + x/2, yBase);
        curveVertex(width/2 + x,yBase - y);
        curveVertex(3*width/4 + x/2, yBase);
        // curveVertex(3*width/4 + x, height/2);
        curveVertex(width,yBase  + 2*step);
        curveVertex(width,yBase  + 2*step);
        vertex(width, height);
        vertex(0,height);
        
    endShape();
    }
   
    
    
    
    
}

void draw(){
    
    

}