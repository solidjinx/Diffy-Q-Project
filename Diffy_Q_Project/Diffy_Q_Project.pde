//////Graphs solution curves to differential equations
//Plotted window
int sampleRate = 32;
float xMin;
float xMax;
float yMin;
float yMax;
//Constant coefficients
float springM;
float springB;
float springK;
//Initial conditions
float xnaught;
float ynaught;
float yprimenaught;
//Dial sliders
Dial massDial = new Dial(9);
Dial frictionDial = new Dial(26);
Dial springkDial = new Dial(43);
Dial xnaughtDial = new Dial(60);
Dial ynaughtDial = new Dial(77);
Dial yprimenaughtDial = new Dial(94);

////PROGRAM SWITCHES
int programState;          ////Judges whether in staticState {0} or activeState {1}
int localTIMER = 0;        //Allows/enables repeatibility for switch statements

void setup(){
  fullScreen(P2D,1);
  //size(1000,1000,P2D);
  smooth(16);
  frameRate(120);
  loadPixels();
  programState = 0;
  
  springM = 0;
  springB = 0;
  springK = 0;
  
  xMin = -10;
  xMax = 10;
  yMin = -10;
  yMax = 10;
  xnaught = 0;
  ynaught = 0;
  yprimenaught = 0;
}

void draw(){
  switch (programState){
    case 0:  //Static
      NavButton("N/A",width - Divide(width,8),height - Divide(height,10),200,100,"Click for Classic Mode Tutorial!",1);
      rectMode(CENTER);
      textAlign(CENTER,CENTER);
      textFont(classicTitleFont,ScaleFont(160));
      fill(c2);
      text(Title,width/2,height/6);
      if (mouseX >= (width/2 - Divide(textWidth(Title),2)) && mouseX <= (width/2 + Divide(textWidth(Title),2)) && mouseY >= (height/6 - Divide(textAscent() + textDescent(),2)) && mouseY <= (height/6 + Divide(textAscent() + textDescent(),2))){
        textFont(classicBodyFont,ScaleFont(90));
        fill(colorDelta1*100/PI,200 - colorDelta1*100/PI,0);
        text(SubTitle,width/2,height/6 + ScaleFont(160));
      }
      textFont(classicBodyFont,ScaleFont(45));
      image(CursorTexture,mouseX + 12,mouseY + 14,24,36);
      //For Classic Mode Tutorial (Fulcrum page)
      if (mousePressed && localTIMER >= 60 && NavClicked(width - Divide(width,8),height - Divide(height,10),200,100)){
        localTIMER = 0;
        Reroll(new int[]{0,0,0,0,0,0,0,0,0});
        programState = 1;
        classicModeState = 1;
        break;
      }
      localTIMER++;
    break;
    case 1:  //Active
      
    break;
  }
  println(round(frameRate));
}
