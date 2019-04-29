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
      //println("Division By Zero -- returned Negative Infinity");
      return tan(Divide(3*PI,2));
    }
    else if (int(Divide(N,abs(N))) > 0){
      //println("Division By Zero -- returned Infinity");
      return -tan(Divide(PI,2));
    }
    else {
      //println("L'Hopital Indeterminate -- returned Zero");
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

//Calculates the values for non-default trigonometric functions by their shorthand notation
float trigFunction(String name, float theta){
  if (name == "help!"){
    String[] trigCatalog = {"Cosecant --> csc(Z) = 1/sin(Z)","Secant --> sec(Z) = 1/cos(Z)","Cotangent --> cot(Z) = 1/tan(Z)","Versine --> ver(Z) = 1 - cos(Z)","Vercosine --> vcs(Z) = 1 + cos(Z)","Coversine --> cvs(Z) = 1 - sin(Z)","Covercosine --> cvc(Z) = 1 + sin(Z)","Haversine --> hav(Z) = (1 - cos(Z))/2","Havercosine --> hvc(Z) = (1 + cos(Z))/2","Hacoversine --> hcv(Z) = (1 - sin(Z))/2","Hacovercosine --> hcc(Z) = (1 + sin(Z))/2","Exsecant --> exs(Z) = sec(Z) - 1","Excosecant --> exc(Z) = csc(Z) - 1","Chord --> crd(Z) = 2sin(Z/2)"};
    for (int i = 0; i < trigCatalog.length; i++){
      println(trigCatalog[i]);
    }
    return 0;
  }
  else if (name == "csc"){
    return Divide(1,sin(theta));
  }
  else if (name == "sec"){
    return Divide(1,cos(theta));
  }
  else if (name == "cot"){
    return Divide(1,tan(theta));
  }
  else if (name == "ver"){
    return (1 - cos(theta));
  }
  else if (name == "vcs"){
    return (1 + cos(theta));
  }
  else if (name == "cvs"){
    return (1 - sin(theta));
  }
  else if (name == "cvc"){
    return (1 + sin(theta));
  }
  else if (name == "hav"){
    return Divide(1 - cos(theta),2);
  }
  else if (name == "hvc"){
    return Divide(1 + cos(theta),2);
  }
  else if (name == "hcv"){
    return Divide(1 - sin(theta),2);
  }
  else if (name == "hcc"){
    return Divide(1 + sin(theta),2);
  }
  else if (name == "exs"){
    return (trigFunction("sec",theta) - 1);
  }
  else if (name == "exc"){
    return (trigFunction("csc",theta) - 1);
  }
  else if (name == "crd"){
    return 2*sin(Divide(theta,2));
  }
  else {
    println("Invalid or missing entry; type 'help!' to see a list of available functions");
    return 0;
  }
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

//Checks if a number is within a given range
boolean inRange(String condition, float min, float max, float item){
  if (condition == "help!"){
    String[] boundConditions = {"Mutually Inclusive --> []","Upper Exclusive, Lower Inclusive --> [)","Upper Inclusive, Lower Exclusive --> (]","Mutually Exclusive --> ()"};
    for (int i = 0; i < boundConditions.length; i++){
      println(boundConditions[i]);
    }
    return false;
  }
  else if (condition == "[]"){
    if (item >= min && item <= max){
      return true;
    }
    return false;
  }
  else if (condition == "[)"){
    if (item >= min && item < max){
      return true;
    }
    return false;
  }
  else if (condition == "(]"){
    if (item > min && item <= max){
      return true;
    }
    return false;
  }
  else if (condition == "()"){
    if (item > min && item < max){
      return true;
    }
    return false;
  }
  else {
    println("Invalid or missing entry; type 'help!' to see a list of available conditions");
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

//Randomly selects an integer within a given range; rerolls the number if it matches a blacklisted item
int iDynRandom(int min, int max, int[] blacklist){
  if (blacklist.length == (max - min)){
    return max;
  }
  boolean blacklisted = false;
  int item = int(random(min,max));
  for (int i = 0; i < blacklist.length; i++){
    if (item == blacklist[i]){
      blacklisted = true;
    }
  }
  if (!blacklisted){
    return item;
  }
  else {
    return iDynRandom(min,max,blacklist);
  }
}

//Randomly selects a float within a given range; rerolls the number if it matches a blacklisted item
float fDynRandom(float min, float max, float[] blacklist){
  boolean blacklisted = false;
  float item = random(min,max);
  for (int i = 0; i < blacklist.length; i++){
    if (item == blacklist[i]){
      blacklisted = true;
    }
  }
  if (!blacklisted){
    return item;
  }
  else {
    return fDynRandom(min,max,blacklist);
  }
}

//Intelligent Quadratic solver
boolean realRoots;
float[] QuadraticEQ(float a, float b, float c){
  if ((sq(b) - 4*a*c) >= 0){
    realRoots = true;
    return (new float[]{Divide(-b + sqrt(sq(b) - 4*a*c),2*a),Divide(-b - sqrt(sq(b) - 4*a*c),2*a)});
  }
  else {
    //println("Non-Real Solutions to QuadraticEQ -- returned Rectangular Complex Divisor");
    realRoots = false;
    return (new float[]{Divide(sqrt(-(sq(b) - 4*a*c)),2*a),Divide(-b,2*a)});
  }
}

//Calculates the length of the hypotenuse of a triangle given its two legs
float Pythag(float sideA, float sideB){
  return sqrt(fSummation(new float[]{sq(sideA),sq(sideB)}));
}

//Area of a triangle given the three side lengths
float HeronArea(float sideA, float sideB, float sideC){
  float semiP = Divide(fSummation(new float[]{sideA,sideB,sideC}),2);
  return sqrt(semiP*(semiP - sideA)*(semiP - sideB)*(semiP - sideC));
}

//===============================================ANALYTIC COMPUTATION====================================================================\\

//2nd Order Linear Constant Coefficient Homogeneous ODE spring type parcer
String springType(float m, float b, float k){
  //Two real, non-repeating roots of the form:  C1e^(r1t) + C2e^(r2t)
  if (QuadraticEQ(m,b,k)[0] != QuadraticEQ(m,b,k)[1] && realRoots){
    return "Overdamped";
  }
  //Two real, repeating roots of the form:  C1e^(r1t) + C2te^(r2t)
  else if (QuadraticEQ(m,b,k)[0] == QuadraticEQ(m,b,k)[1] && realRoots){
    return "Critically Damped";
  }
  //Two imaginary, non-repeating roots of the form:  C1e^(at)cos(bt) + C2e^(at)sin(bt)
  else {
    return "Underdamped";
  }
}

//Calculates a particular solution given two initial conditions
float[] particular(float xNot, float rOne, float rTwo, float yNot, float yprimeNot){
  if (springType(springM,springB,springK) == "Overdamped"){
    return (new float[]{Divide(rTwo*yNot - yprimeNot,exp(rOne*xNot)*(rTwo - rOne)),Divide(yprimeNot - rOne*yNot,exp(rTwo*xNot)*(rTwo - rOne))});
  }
  else if (springType(springM,springB,springK) == "Critically Damped"){
    return (new float[]{Divide(yNot - xNot*yprimeNot - rOne*xNot*yNot,exp(rOne*xNot)),Divide(yprimeNot - rOne*yNot,exp(rOne*xNot))});
  }
  else {
    return (new float[]{Divide(trigFunction("sec",rTwo*xNot)*(rTwo*yNot*trigFunction("cot",rTwo*xNot) + rOne*yNot - yNot - yprimeNot + rOne*yNot),exp(rOne*xNot)*(rTwo*trigFunction("cot",rTwo*xNot) + rOne + rTwo*tan(rTwo*xNot) - 1)),Divide(trigFunction("csc",rTwo*xNot)*(yprimeNot + rTwo*yNot*tan(rTwo*xNot) - rOne*yNot),exp(rOne*xNot)*(rTwo*trigFunction("cot",rTwo*xNot) + rOne + rTwo*tan(rTwo*xNot) - 1))});
  }
}
