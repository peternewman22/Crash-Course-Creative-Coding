class Segment {
  float x, y, segW, segH;
  boolean isVertical;
  PVector tl, tr, bl, br;
  Segment(float x_, float y_, float segW_, float segH_) {
    x = x_;
    y = y_;
    segW = segW_;
    segH = segH_;
    isVertical = segW < segH;
    tl = new PVector(x - segW / 2, y - segH / 2);
    tr = new PVector(x + segW / 2, y - segH / 2);
    bl = new PVector(x - segW / 2, y + segH / 2);
    br = new PVector(x + segW / 2, y + segH / 2);
  }

  show() {
    // rect(x, y, segW, segH);
    if (isVertical) {
      beginShape();
      vertex(tl.x, tl.y);
      vertex(x, tl.y - segW / 2);
      vertex(tr.x, tr.y);
      vertex(br.x, br.y);
      vertex(x, br.y + segW / 2);
      vertex(bl.x, bl.y);
      endShape(CLOSE);
    } else {
      beginShape();
      vertex(tl.x, tl.y);
      vertex(tl.x - segH / 2, y);
      vertex(bl.x, bl.y);
      vertex(br.x, br.y);
      vertex(br.x + segH / 2, y);
      vertex(tr.x, tr.y);
      endShape(CLOSE);
    }
  }
}
