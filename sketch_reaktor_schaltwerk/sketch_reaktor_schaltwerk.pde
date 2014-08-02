#include "RTDModule.h"
RTDModule rtd1, rtd2;

int incomingByte = 0;   // for incoming serial data
double col, col1, col2;

int analogPin = 1;     // potentiometer wiper (middle terminal) connected to analog pin 3
// outside leads to ground and +5V
int val = 0;           // variable to store the value read
int pinOff = 2;
int pinOn = 4;

void setup() {
  analogReference(INTERNAL); //Set reference to 1.1V ready for rtd1 measurements
  Serial.begin(9600);
  
  rtd1.setPins(4,5,2);
  rtd2.setPins(4,5,3);
  rtd1.calibration(0, 1.0, 1.0);
  rtd2.calibration(0, 1.0, 1.0);
  
  // Pin 13 has an LED connected on most Arduino boards:
  pinMode(13, OUTPUT);     
  
  digitalWrite(13, LOW);   // set the LED off
  turnOff();
}

void loop() {
  //Get temperatures and pass through digital low pass filter
  col1 = digitalLowPass(col, rtd1.getTemperature(0) ,0.90);
  col2 = digitalLowPass(col, rtd2.getTemperature(0) ,0.90);
  
  //Print temperatures out to serial
  Serial.print("<");
  Serial.print(col1);
  Serial.print(",");
  Serial.print(col2);
  Serial.println(">");
  
    if (Serial.available() > 0) {
      // read the incoming byte:
      incomingByte = Serial.read();
      // charakter 1 = byte 49
      // charakter 0 = byte 48
      if (incomingByte == 49) {
        digitalWrite(13, HIGH);   // set the LED on
        turnOn();
      }
      if (incomingByte == 48) {
        digitalWrite(13, LOW);   // set the LED off
        turnOff();
      }
    }
}

double digitalLowPass(double last_smoothed, double new_value, double filterVal) {
  double smoothed = (new_value * (1 - filterVal)) + (last_smoothed * filterVal);
  return smoothed;
}

