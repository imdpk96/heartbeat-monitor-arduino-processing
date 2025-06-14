// KY-039 Heartbeat Sensor with Arduino
const int heartbeatPin = A0; // Analog pin connected to KY-039
int signalValue = 0;

void setup() {
  Serial.begin(9600);        // Start the serial communication
  pinMode(heartbeatPin, INPUT);
  Serial.println("Heartbeat sensor ready. Place your finger on the sensor.");
}

void loop() {
  signalValue = analogRead(heartbeatPin);   // Read signal
  Serial.println(signalValue);              // Send to serial for Processing
  delay(10); // Small delay for stable reading
}
