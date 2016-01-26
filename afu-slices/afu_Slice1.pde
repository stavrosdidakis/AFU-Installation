int numSlices = 20;
int sliceWidth = 40;
PImage mainImage;
PImage[] slices = new PImage[numSlices];

float margin = 50;
float boxHeight = 600;
float boxWidth = 880;
int xTex1 = 0;
int xTex2 = width;
int xTex3 = width/2;
int spTex1 = 8;
int spTex2 = -12;
float[]x =         new float[numSlices];
float[]y =         new float[numSlices];
float[]w =         new float[numSlices];
float[]h =         new float[numSlices];
float[]py1 =       new float[numSlices];
float[]py2 =       new float[numSlices];
float[]radius =    new float[numSlices];
float[]amplitude = new float[numSlices];
float[]frequency = new float[numSlices];
float[]ang =       new float[numSlices];
float[]drag =      new float[numSlices];
float[]gravity =   new float[numSlices];
boolean[]isOver =  new boolean[numSlices];

void setup() {
  mainImage = loadImage("afu.jpg");
  size(mainImage.width, mainImage.height);

  for (int i = 0; i< numSlices; i++) {
    w[i] = width / numSlices;
    h[i] = height;
    x[i] = w[i] * i;
    y[i] = height / 2 - h[i] / 2;
    amplitude[i] = random(5, 25)+ height/4;
    radius[i] = amplitude[i];
    gravity[i] = .88 + random(.1);
    drag[i] =  gravity[i];
    //image(slices[i], x[i], y[i], w[i], h[i]);
    frequency[i] = 10 + random(-1, 1);
    isOver[i] = false;
  }
} 

void draw() {
  background(0);
  smooth();

  stroke(50);
  strokeWeight(1);

  line(x[0]+py2[0]+sliceWidth, 0, x[1]+py2[1], height/2);
  line(x[0]+py2[0]+sliceWidth, height/2, x[1]+py2[1], height/2);
  line(x[0]+py2[0]+sliceWidth, height, x[1]+py2[1], height/2);
  line(x[0]+py2[0], height/2, x[1]+py2[1], 0);
  line(x[0]+py2[0], height/2, x[1]+py2[1], height);

  line(x[1]+py2[1]+sliceWidth, 0, x[2]+py2[2], height/2);
  line(x[1]+py2[1]+sliceWidth, height/2, x[2]+py2[2], height/2);
  line(x[1]+py2[1]+sliceWidth, height, x[2]+py2[2], height/2);
  line(x[1]+py2[1], height/2, x[2]+py2[2], 0);
  line(x[1]+py2[1], height/2, x[2]+py2[2], height);

  line(x[2]+py2[2]+sliceWidth, 0, x[3]+py2[3], height/2);
  line(x[2]+py2[2]+sliceWidth, height/2, x[3]+py2[3], height/2);
  line(x[2]+py2[2]+sliceWidth, height, x[3]+py2[3], height/2);
  line(x[2]+py2[2], height/2, x[3]+py2[3], 0);
  line(x[2]+py2[2], height/2, x[3]+py2[3], height);

  line(x[3]+py2[3]+sliceWidth, 0, x[4]+py2[4], height/2);
  line(x[3]+py2[3]+sliceWidth, height/2, x[4]+py2[4], height/2);
  line(x[3]+py2[3]+sliceWidth, height, x[4]+py2[4], height/2);
  line(x[3]+py2[3], height/2, x[4]+py2[4], 0);
  line(x[3]+py2[3], height/2, x[4]+py2[4], height);

  line(x[4]+py2[4]+sliceWidth, 0, x[5]+py2[5], height/2);
  line(x[4]+py2[4]+sliceWidth, height/2, x[5]+py2[5], height/2);
  line(x[4]+py2[4]+sliceWidth, height, x[5]+py2[5], height/2);
  line(x[4]+py2[4], height/2, x[5]+py2[5], 0);
  line(x[4]+py2[4], height/2, x[5]+py2[5], height);

  line(x[5]+py2[5]+sliceWidth, 0, x[6]+py2[6], height/2);
  line(x[5]+py2[5]+sliceWidth, height/2, x[6]+py2[6], height/2);
  line(x[5]+py2[5]+sliceWidth, height, x[6]+py2[6], height/2);
  line(x[5]+py2[5], height/2, x[6]+py2[6], 0);
  line(x[5]+py2[5], height/2, x[6]+py2[6], height);

  line(x[6]+py2[6]+sliceWidth, 0, x[7]+py2[7], height/2);
  line(x[6]+py2[6]+sliceWidth, height/2, x[7]+py2[7], height/2);
  line(x[6]+py2[6]+sliceWidth, height, x[7]+py2[7], height/2);
  line(x[6]+py2[6], height/2, x[7]+py2[7], 0);
  line(x[6]+py2[6], height/2, x[7]+py2[7], height);

  line(x[7]+py2[7]+sliceWidth, 0, x[8]+py2[8], height/2);
  line(x[7]+py2[7]+sliceWidth, height/2, x[8]+py2[8], height/2);
  line(x[7]+py2[7]+sliceWidth, height, x[8]+py2[8], height/2);
  line(x[7]+py2[7], height/2, x[8]+py2[8], 0);
  line(x[7]+py2[7], height/2, x[8]+py2[8], height);

  line(x[8]+py2[8]+sliceWidth, 0, x[9]+py2[9], height/2);
  line(x[8]+py2[8]+sliceWidth, height/2, x[9]+py2[9], height/2);
  line(x[8]+py2[8]+sliceWidth, height, x[9]+py2[9], height/2);
  line(x[8]+py2[8], height/2, x[9]+py2[9], 0);
  line(x[8]+py2[8], height/2, x[9]+py2[9], height);

  line(x[9]+py2[9]+sliceWidth, 0, x[10]+py2[10], height/2);
  line(x[9]+py2[9]+sliceWidth, height/2, x[10]+py2[10], height/2);
  line(x[9]+py2[9]+sliceWidth, height, x[10]+py2[10], height/2);
  line(x[9]+py2[9], height/2, x[10]+py2[10], 0);
  line(x[9]+py2[9], height/2, x[10]+py2[10], height);

  line(x[10]+py2[10]+sliceWidth, 0, x[11]+py2[11], height/2);
  line(x[10]+py2[10]+sliceWidth, height/2, x[11]+py2[11], height/2);
  line(x[10]+py2[10]+sliceWidth, height, x[11]+py2[11], height/2);
  line(x[10]+py2[10], height/2, x[11]+py2[11], 0);
  line(x[10]+py2[10], height/2, x[11]+py2[11], height);  

  line(x[11]+py2[11]+sliceWidth, 0, x[12]+py2[12], height/2);
  line(x[11]+py2[11]+sliceWidth, height/2, x[12]+py2[12], height/2);
  line(x[11]+py2[11]+sliceWidth, height, x[12]+py2[12], height/2);
  line(x[11]+py2[11], height/2, x[12]+py2[12], 0);
  line(x[11]+py2[11], height/2, x[12]+py2[12], height);

  line(x[12]+py2[12]+sliceWidth, 0, x[13]+py2[13], height/2);
  line(x[12]+py2[12]+sliceWidth, height/2, x[13]+py2[13], height/2);
  line(x[12]+py2[12]+sliceWidth, height, x[13]+py2[13], height/2);
  line(x[12]+py2[12], height/2, x[13]+py2[13], 0);
  line(x[12]+py2[12], height/2, x[13]+py2[13], height);

  line(x[13]+py2[13]+sliceWidth, 0, x[14]+py2[14], height/2);
  line(x[13]+py2[13]+sliceWidth, height/2, x[14]+py2[14], height/2);
  line(x[13]+py2[13]+sliceWidth, height, x[14]+py2[14], height/2);
  line(x[13]+py2[13], height/2, x[14]+py2[14], 0);
  line(x[13]+py2[13], height/2, x[14]+py2[14], height);

  line(x[14]+py2[14]+sliceWidth, 0, x[15]+py2[15], height/2);
  line(x[14]+py2[14]+sliceWidth, height/2, x[15]+py2[15], height/2);
  line(x[14]+py2[14]+sliceWidth, height, x[15]+py2[15], height/2);
  line(x[14]+py2[14], height/2, x[15]+py2[15], 0);
  line(x[14]+py2[14], height/2, x[15]+py2[15], height);

  line(x[15]+py2[15]+sliceWidth, 0, x[16]+py2[16], height/2);
  line(x[15]+py2[15]+sliceWidth, height/2, x[16]+py2[16], height/2);
  line(x[15]+py2[15]+sliceWidth, height, x[16]+py2[16], height/2);
  line(x[15]+py2[15], height/2, x[16]+py2[16], 0);
  line(x[15]+py2[15], height/2, x[16]+py2[16], height);

  line(x[16]+py2[16]+sliceWidth, 0, x[17]+py2[17], height/2);
  line(x[16]+py2[16]+sliceWidth, height/2, x[17]+py2[17], height/2);
  line(x[16]+py2[16]+sliceWidth, height, x[17]+py2[17], height/2);
  line(x[16]+py2[16], height/2, x[17]+py2[17], 0);
  line(x[16]+py2[16], height/2, x[17]+py2[17], height);

  line(x[17]+py2[17]+sliceWidth, 0, x[18]+py2[18], height/2);
  line(x[17]+py2[17]+sliceWidth, height/2, x[18]+py2[18], height/2);
  line(x[17]+py2[17]+sliceWidth, height, x[18]+py2[18], height/2);
  line(x[17]+py2[17], height/2, x[18]+py2[18], 0);
  line(x[17]+py2[17], height/2, x[18]+py2[18], height);

  line(x[18]+py2[18]+sliceWidth, 0, x[19]+py2[19], height/2);
  line(x[18]+py2[18]+sliceWidth, height/2, x[19]+py2[19], height/2);
  line(x[18]+py2[18]+sliceWidth, height, x[19]+py2[19], height/2);
  line(x[18]+py2[18], height/2, x[19]+py2[19], 0);
  line(x[18]+py2[18], height/2, x[19]+py2[19], height);

  for (int i=0; i < slices.length; i++) {
    slices[i] = mainImage.get(i * sliceWidth, 0, sliceWidth, mainImage.height);
  }

  for (int i = 0; i< numSlices; i++) {
    image (slices[i], x[i]+py2[i], y[i]-py1[i], w[i], h[i]-py2[i]);  
    if (isOver[i]) {
      py1[i] = sin(radians(ang[i]))*radius[i];
      py2[i] = cos(radians(ang[i]))*radius[i];
      ang[i]+=frequency[i];
      radius[i]*=drag[i];
    }
  }
}

void mouseMoved() {
  for (int i = 0; i< numSlices; i++) {
    if (mouseX > x[i] && mouseX < x[i] + w[i] &&
      mouseY > y[i] && mouseY < y[i] + h[i]) {
      radius[i] = amplitude[i];
      isOver[i] = true;
    }
  }
}

void keyPressed() {
  if (key=='a' || key=='A') saveFrame("screenshot"+(int)random(100000)+".png");
}

