int n = 2;
PVector[] sites;
float r = 200;
float growth = 0.5;
color[] colours = {#3f7cac, #95afba, #bdc4a7, #d5e1a3, #e2f89c};


void setup() {
  size(500, 500);
  sites = new PVector[n];
  sites[0] = new PVector(width/3, height/2);
  sites[1] = new PVector(2*width/3, height/2);
  stroke(255);
  strokeWeight(2);
  noFill();
}

void draw() {
  background(0);
  fill(colours[0]);
  strokeWeight(2);
  float d = PVector.dist(sites[0], sites[1]);
  if(d < 2*r){
    float a0 = acos(0.5*d/r);
    float a1 = (acos(0.5*d/r) + PI);
    arc(sites[0].x, sites[0].y, r, r, a0, TWO_PI-a0, CHORD);
    arc(sites[1].x, sites[1].y, r, r, a1, a1, CHORD);
    
  }
  
  strokeWeight(5);
  point(sites[0].x, sites[0].y);
  point(sites[1].x, sites[1].y);
  
  
    


  //drawSites();
  //r += growth;
  
}

//void drawSites() {
//  for(int i = 0; i < sites.length; i++){
//    fill(colours[i]);
//    strokeWeight(2);
//    arc(sites[i].x, sites[i].y, r, r, 0, TWO_PI, CHORD);
//    strokeWeight(5);
//    point(sites[i].x, sites[i].y);
    
//  }
//}
