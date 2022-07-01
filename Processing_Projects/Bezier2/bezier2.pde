PVector a, cp1, cp2;
PVector[] ends;
int n = 200;
float d = 10;
float proportionOfWindow = 0.875;
int cntrlState = 0;
int aStr = 1;
int cp1Str = 0;
int cp2Str = 0;

void setup(){
    size(1000, 1000);
    noFill();
    stroke(255,119,17,50);
    a = generatePt();
    cp1 = generatePt();
    cp2 = generatePt();
    
    ends = new PVector[n];
    for(int i = 0; i < ends.length; i++){
        ends[i] = new PVector(random(width), random(height));
    }
    noFill();




}

void draw(){
    background(0);
    stroke(255,119,17,50);
    for(PVector p : ends){
        bezier(a.x, a.y, cp1.x, cp1.y,cp2.x, cp2.y, p.x, p.y);
        ellipse(p.x, p.y, d, d);
    }
    stroke(aStr,0,0, aStr);
    ellipse(a.x, a.y, 20, 20);
    stroke(0,cp1Str,0,cp1Str);
    ellipse(cp1.x, cp1.y, 20, 20);
    stroke(0,0,cp2Str,cp2Str);
    ellipse(cp2.x, cp2.y, 20, 20);
}

PVector generatePt(){
    return new PVector(random((1-proportionOfWindow)*width, proportionOfWindow*width), random((1-proportionOfWindow)*height/8, proportionOfWindow*height));
}

void mouseDragged() {
    switch(cntrlState){
        case 0:
            break;
        case 1:
            a.set(mouseX, mouseY);
            break;
        case 2:
            cp1.set(mouseX, mouseY);
            break;
        case 3:
            cp2.set(mouseX, mouseY);
        default:
            break;
    }
}

void keyPressed(){
    if(key == CODED){
        if(keyCode == ENTER){
            setup();
        }
        if(keyCode == UP){
            cntrlState = (cntrlState + 1)%4;
            switch(cntrlState){
                case 0:
                    aStr = 0;
                    cp1Str = 0;
                    cp2Str = 0;
                    break;
                case 1:
                    aStr = 255;
                    cp1Str = 0;
                    cp2Str = 0;
                    break;
                case 2:
                    aStr = 0;
                    cp1Str = 255;
                    cp2Str = 0;
                    break;
                case 3:
                    aStr = 0;
                    cp1Str = 0;
                    cp2Str = 255;
                    break;
                default:
                    aStr = 0;
                    cp1Str = 0;
                    cp2Str = 0;

            }
        }   
    }
    
}