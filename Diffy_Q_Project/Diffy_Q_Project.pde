//////Graphs solution curves to differential equations
int sampleRate = 32;
int functionSwap = 0;

float springM;
float springB;
float springK;


void setup(){
  fullScreen(P2D,1);
  //size(1000,1000,P2D);
  smooth(16);
  frameRate(120);
  loadPixels();
}

void draw(){
  RainbowGen();
  Axis(20,20);
  for (int i = 0; i < pixels.length; i++){
    pixels[i] = color(255);
  }
  for (int i = 1; i < (width - 1); i++){
    //pixels[y*width + x]
    //multiPix(i,xFunction(i) + height/2,MapColorGen(mouseX,mouseY));
    
    // convert i from pixels to math
    // do f(x) to result get y
    // convert y from math to pixels
    if (functionSwap % 240 == 1){
      functionSwap = 0;
      springM = random(1,sampleRate);
      springB = random(1,sampleRate);
      springK  = random(1,sampleRate);
      multiPix(i,round(map(xFunction(map(i,1,width - 2,xMin,xMax)),yMin,yMax,1,height - 2)),color(dR,dG,dB));
    }
    //for (int w = 0; w < sampleRate; w++){
    //  multiPix(i,round(xFunction(i - Divide(w,sampleRate))) + height/2,RainbowGen());
    //}
    //for (int w = 0; w < sampleRate; w++){
    //  multiPix(i,round(xFunction(i - Divide(w,sampleRate))) + height/2,RainbowGen());
    //}
  }
  updatePixels();
  functionSwap++;
  
  println(int(functionSwap));
}

void multiPix(int x, int y, color c){
  //Map function relates a point on one axis to a point on another axis, directional one-to-one <----> map(float to map, min original, max original, min target, max target)
  if (y > 0 && y < height){
    pixels[(y - 1)*width + (x - 1)] = c;    //TOP-LEFT
    pixels[(y - 1)*width + x] = c;          //TOP-CENTER
    pixels[(y - 1)*width + (x + 1)] = c;    //TOP-RIGHT
  
    pixels[y*width + (x - 1)] = c;          //CENTER-LEFT
    pixels[y*width + x] = c;                //CENTER-CENTER
    pixels[y*width + (x + 1)] = c;          //CENTER-RIGHT
    
    pixels[(y + 1)*width + (x - 1)] = c;    //BOTTOM-LEFT
    pixels[(y + 1)*width + x] = c;          //BOTTOM-CENTER
    pixels[(y + 1)*width + (x + 1)] = c;    //BOTTOM-RIGHT
  }
}
