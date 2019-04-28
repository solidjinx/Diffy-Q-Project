//===============================================SANITY CHECKING====================================================================\\
float xMin = -10;
float xMax = 10;
float yMin = -10;
float yMax = 10;

float xFunction(float x){
  //Two real, non-repeating roots of the form:  C1e^(r1t) + C2e^(r2t)
  if (springType(springM,springB,springK) == "Overdamped"){
    float y = (particular(mouseX,QuadraticEQ(springM,springB,springK)[0],QuadraticEQ(springM,springB,springK)[1],mouseY,Average(new float[]{pmouseX,pmouseY}))[0]*exp(QuadraticEQ(springM,springB,springK)[0]*x) + particular(mouseX,QuadraticEQ(springM,springB,springK)[0],QuadraticEQ(springM,springB,springK)[1],mouseY,Average(new float[]{pmouseX,pmouseY}))[1]*exp(QuadraticEQ(springM,springB,springK)[1]*x));
    return -y;
  }
  //Two real, repeating roots of the form:  C1e^(r1t) + C2te^(r2t)
  else if (springType(springM,springB,springK) == "Critically Damped"){
    float y = (particular(mouseX,QuadraticEQ(springM,springB,springK)[0],QuadraticEQ(springM,springB,springK)[1],mouseY,Average(new float[]{pmouseX,pmouseY}))[0]*exp(QuadraticEQ(springM,springB,springK)[0]*x) + particular(mouseX,QuadraticEQ(springM,springB,springK)[0],QuadraticEQ(springM,springB,springK)[1],mouseY,Average(new float[]{pmouseX,pmouseY}))[1]*x*exp(QuadraticEQ(springM,springB,springK)[0]*x));
    return -y;
  }
  //Two imaginary, non-repeating roots of the form:  C1e^(at)cos(bt) + C2e^(at)sin(bt)
  else {
    float y = (particular(mouseX,QuadraticEQ(springM,springB,springK)[0],QuadraticEQ(springM,springB,springK)[1],mouseY,Average(new float[]{pmouseX,pmouseY}))[0]*exp(QuadraticEQ(springM,springB,springK)[0]*x)*cos(QuadraticEQ(springM,springB,springK)[1]*x) + particular(mouseX,QuadraticEQ(springM,springB,springK)[0],QuadraticEQ(springM,springB,springK)[1],mouseY,Average(new float[]{pmouseX,pmouseY}))[1]*exp(QuadraticEQ(springM,springB,springK)[0]*x)*sin(QuadraticEQ(springM,springB,springK)[1]*x));
    return -y;
  }
}

void Axis(int xScale, int yScale){
  pushStyle();
  stroke(0);
  strokeWeight(4);
  //X-Axis
  line(0,height/2,width,height/2);
  //Tick marks
  for (int i = floor(Divide(width,xScale)); i < width; i += floor(Divide(width,xScale))){
    line(i,Divide(height,2) - 4,i,Divide(height,2) + 4);
  }
  //Y-Axis
  line(width/2,0,width/2,height);
  //Tick marks
  for (int j = floor(Divide(height,yScale)); j < height; j += floor(Divide(height,yScale))){
    line(Divide(width,2) - 4,j,Divide(width,2) + 4,j);
  }
  popStyle();
}
