/**
 * Vector field visualizer
 * Giacomo Leandrini 25/04/2022
 * V0.1
 */
 
int barWidth = 20;
int lastBar = -1;
int n = 10;
int len;
float Mangle;
float colore;
int spessore;

void setup() {
  size(640,640);
  background(255,255,255);
  colorMode(HSB, 400);
  stroke(000);
  //smooth();
  
}

void draw() {
  stroke(0 , 0, 0);
  background(0);
  float angle = map(mouseY, 0, height, 0, 360);
  //len = int(map(mouseX, 0, 640, 10, 100));
  for(int i = (width/n) - (width/n) / 2 ; i <= width; i = i + width/n){
    for(int j = (height/n) - (height/n) / 2 ; j <= height; j = j + height/n){
    //ellipse(i, j, 30, 30);
    pushMatrix();
    translate(i, j);
    Mangle =  atan2(mouseY - j, mouseX - i);
    popMatrix();
    colore = map(dist(i, j, mouseX, mouseY), 0 , sqrt(pow(height, 2) + pow(width, 2)), 330, 120);
    stroke(colore, 400, 450);
    len = int( map(dist(i, j, mouseX, mouseY), 0 , sqrt(pow(height, 2) + pow(width, 2)), 60, 10));
    spessore = int(map(dist(i, j, mouseX, mouseY), 0 , sqrt(pow(height, 2) + pow(width, 2)), 6, 2));
    stroke(colore, 400, 450);
    strokeWeight(spessore);
    drawArrow(i, j, len, Mangle);
  }
  }
}

void drawArrow(int cx, int cy, int len, float angle){
  pushMatrix();
  translate(cx, cy);
  rotate(angle);
  line(-len/2, 0, len/ 2, 0);
  line(len/2, 0, len/2 - (len/7.5), -(len/7.5));
  line(len/2, 0, len/2 - (len/7.5), (len/7.5));
  popMatrix();
}

void keyPressed() {
  if (key == '+')
    n++;
  if (key == '-') 
    n--;
}
