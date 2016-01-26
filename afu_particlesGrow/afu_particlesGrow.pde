import processing.opengl.*;

ArrayList arrayParticles = new ArrayList();
PImage img;
boolean mouseDown = false;
boolean move = false;
boolean over = true;
float alphaCol;
int cell = 7;

void setup() {
  size(800, 600, OPENGL);
  // hint(ENABLE_OPENGL_4X_SMOOTH);
  frameRate(999);
  img = loadImage("afu.png");
  //img.resize(width, height);
  //smooth();
  //noLoop();
  for (int x=cell; x < width; x+=cell) {   
    for (int y=cell; y < height; y+=cell) {
      color c = img.get(x, y);
      alphaCol = brightness(img.pixels[x+(y*width)]);
      arrayParticles.add(new Particles (new PVector(x, y), c, alphaCol));
    }
  }
}

void draw() {
  //background(0);
  fill(0, 10);
  rect(0, 0, width, height);
  for (int i=0; i<arrayParticles.size (); i++) {
    Particles particles = (Particles) arrayParticles.get(i);

    if (particles.mouseMove()) {
      mouseDown = true;
      particles.mDown();
    } else {
      mouseDown = false;
      particles.mouseUp();
    }
  }
}


void keyPressed() {
  if (key=='a' || key=='A') saveFrame("screenshot"+(int)random(100000)+".png");
}

