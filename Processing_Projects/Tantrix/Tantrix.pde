// http://www.tantrix.com/
float R;
float sR;

Curve c;
Tile t; // new Tile(pos.x, pos.y, rS, rE, gS, gE, bS, bE, yS, yE)


void setup(){
  size(500, 500);
  R = 150;
  t = new Tile(0, 0, 5, 1, 0, 0, 2, 4, 0, 1);
  c = new Curve(t.pos, 0, 1, #FF0000);
  sR = R*cos(PI/6);
}

void draw(){
  background(255);
  translate(width/2, height/2);
  t.show();
  c.show();

}
