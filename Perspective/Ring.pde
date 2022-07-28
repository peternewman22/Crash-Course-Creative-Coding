class Ring {
  Body[] bodies;
  int copies;
  Ring(int nBodies, int mCopies, float orbitRadius, float d0, float w0) {
    copies = mCopies;
    bodies = new Body[nBodies];
    for (int i = 0; i < nBodies; i++) {
      bodies[i] = new Body(orbitRadius, d0, w0, i * TWO_PI / nBodies);
    }
  }

  void update() {
    for (Body b : bodies) {
      b.update();
    }
  }

  void show() {
    for (int i = 0; i < copies; i++) {
      pushMatrix();
      rotate(i * TWO_PI / copies);
      for (Body b : bodies) {
        b.show();
      }
      popMatrix();
    }
  }
}
