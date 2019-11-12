import processing.serial.*;

Serial myPort;
int potState;
//int buttonState;
//int[] inputVars = {0, 0}; //make array to be populated from serial (note number of variables)
int inputVars = 0; //make array to be populated from serial (note number of variables)



void setup () {
  size(200, 200);
  rectMode(CENTER);
  println(Serial.list()); //print serial devices (remember to count from 0)
  myPort = new Serial(this, Serial.list()[0], 9600); //make sure the baudrate matches arduino
  myPort.bufferUntil('\n'); // don't generate a serialEvent() unless you get a newline character
}
void draw () {
  background(230);

  float r1 = map(inputVars, 0, 1023, 0, height);
  //above is where you put the code for the nob
  float r2 = height - r1;    

  fill(300, 200, 43, r1);
  rect(width / 2 + r1 / 2, height / 2, r1, r1);

  fill(237, 300, 93, r2);
  rect(width / 2 - r2 / 2, height / 2, r2, r2);

  //rect(width/2, height/2, map(inputVars, 0, 1023, 0, width), map(inputVars, 0, 1023, 0, width));

}

void serialEvent (Serial myPort) {
  String inString = myPort.readStringUntil('\n'); //read until new line (Serial.println on Arduino)
  if (inString != null) {
    inString = trim(inString); // trim off whitespace
    inputVars = int(inString); // break string into an array and change strings to ints 
}
}
