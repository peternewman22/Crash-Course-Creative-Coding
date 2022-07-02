/*
Visualising Perlin Noise and also writing directly to the pixel array
*/
float inc = 0.01;
float zOff = 0;

void setup(){
    size(720, 720);
    noStroke();
}

void draw(){
    background(0);
    loadPixels();
    float xOff = 0;
    for(int col = 0; col < width; col ++){
        xOff += inc;
        float yOff = 0;
        for(int row = 0; row < height; row ++){
            yOff += inc;
            pixels[col + row*width] = color(int(255*noise(xOff, yOff, zOff)));
            // fill(int(255*noise(xOff, yOff, zOff)));
            // rect(col, row, 1, 1);
        }
    }
    updatePixels();
    zOff += inc;
}