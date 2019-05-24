//For RainbowGen()
float dR;
float dG;
float dB;
int colorSwitch = 0;
int t = 0;
float T = 0;

//===============================================GLOBAL TEXTURE CONTROL====================================================================\\
void Axis(int xScale, int yScale){
  pushStyle();
  stroke(0);
  strokeWeight(4);
  fill(0);
  //X-Axis
  line(0,height/2,width,height/2);
  //Tick marks
  for (int i = floor(Divide(width,xScale)); i < width; i += floor(Divide(width,xScale))){
    line(i,Divide(height,2) - 4,i,Divide(height,2) + 4);
  }
  triangle(0,height/2,16,height/2 - 8,16,height/2 + 8);
  triangle(width,height/2,width - 16,height/2 - 8,width - 16,height/2 + 8);
  //Y-Axis
  line(width/2,0,width/2,height);
  //Tick marks
  for (int j = floor(Divide(height,yScale)); j < height; j += floor(Divide(height,yScale))){
    line(Divide(width,2) - 4,j,Divide(width,2) + 4,j);
  }
  triangle(width/2,0,width/2 - 8,16,width/2 + 8,16);
  triangle(width/2,height,width/2 - 8,height - 16,width/2 + 8,height - 16);
  popStyle();
}

//Initializes and displays a gradient along the positive X-Cardinal
void setxGradient(int xPlacement, int yPlacement, float xSpread, float ySpread, color c1, color c2){
  noFill();
  for (int i = xPlacement; i <= (xPlacement + xSpread); i++){
    //Map function relates a point on one axis to a point on another axis, directional one-to-one <----> map(float to map, min original, max original, min target, max target)
    float inter = map(i,xPlacement,xPlacement + xSpread,0,1);
    color c = lerpColor(c1,c2,inter);
    stroke(c);
    line(i,yPlacement,i,yPlacement + ySpread);
  }
}

//Initializes and displays a gradient along the positive Y-Cardinal
void setyGradient(int xPlacement, int yPlacement, float xSpread, float ySpread, color c1, color c2){
  noFill();
  for (int i = yPlacement; i <= (yPlacement + ySpread); i++){
    //Map function relates a point on one axis to a point on another axis, directional one-to-one <----> map(float to map, min original, max original, min target, max target)
    float inter = map(i,yPlacement,yPlacement + ySpread,0,1);
    color c = lerpColor(c1,c2,inter);
    stroke(c);
    line(xPlacement,i,xPlacement + xSpread,i);
  }
}

//===============================================GLOBAL COLOR CONTROL====================================================================\\

//Calculates the next color in the ROYGBIV RGB color spectrum
color RainbowGen(){
  ////assumes rainbow of width 999, split in thirds, max color intensity 255
  switch (colorSwitch){
    case 0:  //left third  {t >= 0 && t < 333}
      t++;
      T = PI*Divide(t,333);
      dR = 127*cos(T) + 127;
      dG = 127 - 127*cos(T);
      dB = 0;
      if (t == 333){
        colorSwitch = 1;
        break;
      }
    break;
    case 1:  //middle third  {t >= 333 && t < 666}
      t++;
      T = PI*Divide(t,333);
      dR = 0;
      dG = 127 - 127*cos(T);
      dB = 127*cos(T);
      if (t == 666){
        colorSwitch = 2;
        break;
      }
    break;
    case 2:  //right third  {t >= 666 && t <= 999}
      t++;
      T = PI*Divide(t,333);
      dR = 127 - 127*cos(T);
      dG = 0;
      dB = 127*cos(T);
      if (t > 999){
        t = 0;
        colorSwitch = 0;
        break;
      }
    break;
  }
  return color(dR,dG,dB);
}

//Calculates a color from a transposed visual mapping
color MapColorGen(float xPosition, float yPosition){
  int segment = 0;
  float mR = 255;
  float mG = 255;
  float mB = 255;
  //Map function relates a point on one axis to a point on another axis, directional one-to-one <----> map(float to map, min original, max original, min target, max target)
  int scale = round(map(dist(xPosition,yPosition,width/2,height/2),0,dist(width,height,0,0),0,999));
  if (scale >= 0 && scale < 333){
    segment = 1;
  }
  else if (scale >= 333 && scale < 666){
    segment = 2;
  }
  else if (scale >= 666 && scale <= 999){
    segment = 3;
  }
  ////assumes rainbow of width 999, split in thirds, max color intensity 255
  switch (segment){
    case 1:  //left third
      T = PI*Divide(scale,333);
      mR = 127*cos(T) + 127;
      mG = 127 - 127*cos(T);
      mB = 0;
    break;
    case 2:  //middle third
      T = PI*Divide(scale,333);
      mR = 0;
      mG = 127 - 127*cos(T);
      mB = 127*cos(T);
    break;
    case 3:  //right third
      T = PI*Divide(scale,333);
      mR = 127 - 127*cos(T);
      mG = 0;
      mB = 127*cos(T);
    break;
  }
  return color(mR,mG,mB);
}

//Produces a random color
color RandomColorGen(){
  return color(int(random(256)),int(random(256)),int(random(256)));
}

//===============================================DRAFTS NAVIGATION====================================================================\\

//Did the player click a navigation button?
boolean NavClicked(float xCenter, float yCenter, float hitWidth, float hitHeight){
  if (dist(mouseX,mouseY,xCenter,yCenter) <= Divide(Average(new float[]{hitWidth,hitHeight}),2)){
    return true;
  }
  return false;
}

//For dials
class Dial{
  ////Class variables
  float xPos;
  int yPos;
  int r = 8;
  
  boolean altered = false;
  
  Dial(int vertOffset){
    ////Constructor
    xPos = width/2;
    yPos = vertOffset;
  }
  
  ////Class methods
  void move(){
    if (mousePressed && localTIMER >= 120 && NavClicked(xPos,yPos,2*r,2*r)){
      altered = true;
      xPos = mouseX;
    }
  }
  
  void display(){
    pushStyle();
    setyGradient(width/4,yPos,round(Divide(3*width,4)),yPos - r,color(255,0,0),color(255,0,0,50));
    setyGradient(width/4,yPos,round(Divide(3*width,4)),yPos + r,color(255,0,0),color(255,0,0,50));
    noStroke();
    fill(0);
    ellipseMode(CENTER);
    ellipse(xPos,yPos,3,r);
    ellipse(Divide(3*width,4),yPos,3,r);
    noStroke();
    fill(255,255,0,80);
    ellipseMode(RADIUS);
    ellipse(xPos,yPos,r,r);
    if (altered){
      fill(0,40);
    }
    popStyle();
  }
}
