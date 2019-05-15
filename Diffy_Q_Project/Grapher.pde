//Plots the solution curve as a whole -- toggleable pixel accuracy
void Plot(){
  RainbowGen();
  Axis(20,20);
  for (int i = 0; i < pixels.length; i++){
    pixels[i] = color(255);
  }
  for (int i = 0; i < width; i++){
    for (int w = 0; w < sampleRate; w++){
      //pixels[y*width + x]
      multiPix(i,round(map(xFunction(map(i + Divide(w,sampleRate),0,width,xMin,xMax)),yMin,yMax,0,height)),color(dR,dG,dB));
    }
  }
  updatePixels();
}

//Plots an eight-point coordinate
void multiPix(int x, int y, color c){
  if (y > 1 && y < (height - 1)) {
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

//===============================================SANITY CHECKING====================================================================\\

float xFunction(float x){
  //Two real, non-repeating roots of the form:  C1e^(r1t) + C2e^(r2t)
  if (springType(springM,springB,springK) == "Overdamped"){
    float y = (particular(xnaught,QuadraticEQ(springM,springB,springK)[0],QuadraticEQ(springM,springB,springK)[1],ynaught,yprimenaught)[0]*exp(QuadraticEQ(springM,springB,springK)[0]*x) + particular(2,QuadraticEQ(springM,springB,springK)[0],QuadraticEQ(springM,springB,springK)[1],ynaught,yprimenaught)[1]*exp(QuadraticEQ(springM,springB,springK)[1]*x));
    return -y;
  }
  //Two real, repeating roots of the form:  C1e^(r1t) + C2te^(r2t)
  else if (springType(springM,springB,springK) == "Critically Damped"){
    float y = (particular(xnaught,QuadraticEQ(springM,springB,springK)[0],QuadraticEQ(springM,springB,springK)[1],ynaught,yprimenaught)[0]*exp(QuadraticEQ(springM,springB,springK)[0]*x) + particular(xnaught,QuadraticEQ(springM,springB,springK)[0],QuadraticEQ(springM,springB,springK)[1],ynaught,yprimenaught)[1]*x*exp(QuadraticEQ(springM,springB,springK)[0]*x));
    return -y;
  }
  //Two imaginary, non-repeating roots of the form:  C1e^(at)cos(bt) + C2e^(at)sin(bt)
  else {
    float y = (particular(xnaught,QuadraticEQ(springM,springB,springK)[0],QuadraticEQ(springM,springB,springK)[1],ynaught,yprimenaught)[0]*exp(QuadraticEQ(springM,springB,springK)[0]*x)*cos(QuadraticEQ(springM,springB,springK)[1]*x) + particular(xnaught,QuadraticEQ(springM,springB,springK)[0],QuadraticEQ(springM,springB,springK)[1],ynaught,yprimenaught)[1]*exp(QuadraticEQ(springM,springB,springK)[0]*x)*sin(QuadraticEQ(springM,springB,springK)[1]*x));
    return -y;
  }
}
