//===============================================SANITY CHECKING====================================================================\\
float xMin = -10;
float xMax = 10;
float yMin = -10;
float yMax = 10;
float xnaught = 0;
float ynaught = -4;
float yprimenaught = 1;

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
