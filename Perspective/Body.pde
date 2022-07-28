class Body{
    float orbitRX, orbitRY, d0, d, a, w0, w, offset;
    Body(float rx_, float d0_, float w0_, float offset_){
        orbitRX = rx_;
        orbitRY = orbitRX/4;
        d0 = d0_;
        d = d0/2;
        w0 = w0_;
        a = 0;
        offset = offset_;
        w = w0 + sin(a+offset)*w0/2;
    }

    void update(){
        a += w;
        w = w0 + sin(a+offset)*w0/2;        
    }

    void show(){
        fill(255);
        ellipse(orbitRX*cos(a + offset), orbitRY*sin(a+offset), d0 + d*sin(a+offset), d0 + d*sin(a+offset));
    }
}