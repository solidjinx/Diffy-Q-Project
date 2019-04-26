//For RainbowGen()
float dR;
float dG;
float dB;
int colorSwitch = 0;
int t = 0;
float T = 0;

//===============================================GLOBAL TEXTURE CONTROL====================================================================\\

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
