//=====================================================================NUMERICAL COMPUTATION=====================================================================\\

//Significant Figures calculator
float DigitSplice(float n, int digitPlacement){
  n -= n % pow(10,-digitPlacement);
  return n;
}

//Integer Summation
int iSummation(int[] numberQueue){
  int sumTotal = 0;
  for (int i = 0; i < numberQueue.length; i++){
    sumTotal += numberQueue[i];
  }
  return sumTotal;
}

//Float Summation
float fSummation(float[] numberQueue){
  float sumTotal = 0;
  for (int i = 0; i < numberQueue.length; i++){
    sumTotal += numberQueue[i];
  }
  return sumTotal;
}

//Intelligent Division
float Divide(float N, float D){
  if (D != 0){
    return N/D;
  }
  else {
    if (int(Divide(N,abs(N))) < 0){
      println("Division By Zero -- returned Negative Infinity");
      return tan(Divide(3*PI,2));
    }
    else if (int(Divide(N,abs(N))) > 0){
      println("Division By Zero -- returned Infinity");
      return -tan(Divide(PI,2));
    }
    else {
      println("L'Hopital Indeterminate -- returned Zero");
      return 0;
    }
  }
}

//Horizontally Asymptotically approaches zero as time diverges {1 - e^(-time/acceleration)}
float expApproach(int time, int acceleration){
  return (1 - Divide(1,exp(Divide(time,acceleration))));
}

//Computes arbitrarily-sized average
float Average(float[] numberQueue){
  return Divide(fSummation(numberQueue),2);
}

//Integer Cubing
int iCube(int n){
  return int(n*sq(n));
}

//Float Cubing
float fCube(float n){
  return n*sq(n);
}

//Is numberA > numberB?
boolean Compare(float numberA, float numberB){
  if (numberA > numberB){
    return true;
  }
  else {
    return false;
  }
}

//Returns largest number between numberA & numberB
float ReturnCompare(float numberA, float numberB){
  if (Compare(numberA,numberB)){
    return numberA;
  }
  else {
    return numberB;
  }
}

//Returns smallest number between numberA & numberB
float ReturnNotCompare(float numberA, float numberB){
  if (!Compare(numberA,numberB)){
    return numberA;
  }
  else {
    return numberB;
  }
}

//Intelligent Quadratic solver
float[] QuadraticEQ(float a, float b, float c){
  if ((sq(b) - 4*a*c) >= 0){
    return (new float[]{Divide(-b + sqrt(sq(b) - 4*a*c),2*a),Divide(-b - sqrt(sq(b) - 4*a*c),2*a)});
  }
  else {
    println("Non-Real Solutions to QuadraticEQ -- returned Rectangular Complex Divisor");
    return (new float[]{Divide(sqrt(-(sq(b) - 4*a*c)),2*a),Divide(-b,2*a)});
  }
}

//Calculates the length of the hypetenuse of a triangle given its two legs
float Pythag(float sideA, float sideB){
  return sqrt(fSummation(new float[]{sq(sideA),sq(sideB)}));
}

//Area of a triangle given the three side lengths
float HeronArea(float sideA, float sideB, float sideC){
  float semiP = Divide(fSummation(new float[]{sideA,sideB,sideC}),2);
  return sqrt(semiP*(semiP - sideA)*(semiP - sideB)*(semiP - sideC));
}

//===============================================ANALYTIC COMPUTATION====================================================================\\

//2nd Order Linear Constant Coefficient Homogeneous ODE parcer
int[] twoolcchodeParcer(float[] parameters){
  if (parameters[0] == parameters[1]){
    
  }
  return (new int[]{1,0,7});
}
