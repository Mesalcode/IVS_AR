import processing.ar.*;

ARTracker tracker;

void setup() {
  fullScreen(AR);
  tracker = new ARTracker(this);
  tracker.start();
  noStroke();  
}

void draw() {
  lights();
  for (int i = 0; i < tracker.count(); i++) {
    ARTrackable t = tracker.get(i);
    pushMatrix();
    t.transform();
    float lx = t.lengthX();
    float lz = t.lengthZ();    
    fill(255, 100);
    beginShape(QUADS);
    vertex(-lx/2, 0, -lz/2);
    vertex(-lx/2, 0, +lz/2);
    vertex(+lx/2, 0, +lz/2);
    vertex(+lx/2, 0, -lz/2);
    endShape();
    popMatrix();  
  }  
}
