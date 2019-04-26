//===============================================SANITY CHECKING====================================================================\\
float xMin = -10;
float xMax = 10;
float yMin = -10;
float yMax = 10;

float xFunction(float x){
  //float y = 100*(atan(cos(radians(x))));
  //float y = Divide(x*cos(exp(Divide(x,600))),4);
  float y = (26.2628*exp(-x) - 30.2628*exp(-2*x));
  return -y;
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
