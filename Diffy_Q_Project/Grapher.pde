//===============================================SANITY CHECKING====================================================================\\
float xMin = -10;
float xMax = 10;
float yMin = -10;
float yMax = 10;

float xFunction(float x){
  //float y = 100*(atan(cos(radians(x))));
  //float y = Divide(x*cos(exp(Divide(x,600))),4);
  float y = (26.2628*exp(-x) - 30.2628*exp(-2*x));
  return y;
}
