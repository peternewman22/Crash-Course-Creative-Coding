class Mover{
    PVector p, v;
    PVector scalarProjWall1, scalarProjWall2, scalarProjWall3;
    float d2Wall1, d2Wall2, d2Wall3;
    boolean hasBounced;
    Mover(float x, float y){
        p = new PVector(x, y);
        v = PVector.random2D().normalize();
        scalarProjWall1 = scalarProj(walls[0]);
        scalarProjWall2 = scalarProj(walls[1]);
        scalarProjWall3 = scalarProj(walls[2]);
        d2Wall1 = PVector.dist(p, scalarProjWall1);
        d2Wall2 = PVector.dist(p, scalarProjWall2);
        d2Wall3 = PVector.dist(p, scalarProjWall3);
        hasBounced = false;
    }

    void update(){
        p.add(v);
        scalarProjWall1 = scalarProj(walls[0]);
        scalarProjWall2 = scalarProj(walls[1]);
        scalarProjWall3 = scalarProj(walls[2]);
        d2Wall1 = PVector.dist(p, scalarProjWall1);
        d2Wall2 = PVector.dist(p, scalarProjWall2);
        d2Wall3 = PVector.dist(p, scalarProjWall3);
        // check for distance from wall
        

    }

    PVector scalarProj(Wall w){
        PVector ap = PVector.sub(p, w.start);
        PVector ab = w.difference.copy();
        ab.normalize(); // Normalize the line
        ab.mult(ap.dot(ab));
        PVector normalPoint = PVector.add(w.start, ab);
        return normalPoint;
    }

    

    void show(){
        ellipse(p.x, p.y, r, r);
        line(p.x, p.y, scalarProjWall1.x, scalarProjWall1.y);
        line(p.x, p.y, scalarProjWall2.x, scalarProjWall2.y);
        line(p.x, p.y, scalarProjWall3.x, scalarProjWall3.y);
        
    }
}