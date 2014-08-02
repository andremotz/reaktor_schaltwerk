void turnOff() {
  digitalWrite( pinOff, LOW ); 
  pinMode( pinOff, OUTPUT ); 
  digitalWrite( pinOff, LOW );
  delay(100);
  
  Serial.println("aus");  
  pinMode( pinOff, INPUT ); 
}

void turnOn() {
  digitalWrite( pinOn, LOW ); 
  pinMode( pinOn, OUTPUT ); 
  digitalWrite( pinOn, LOW );
  delay(100);
  
  Serial.println("ein");  
  pinMode( pinOn, INPUT ); 
}
