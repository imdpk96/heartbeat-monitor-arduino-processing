import processing.serial.*;

Serial myPort;
float[] dataPoints;
float pulse = 0;
PGraphics graph;

void setup() {
  size(1000, 600);
  println(Serial.list());
  myPort = new Serial(this, Serial.list()[0], 9600); // Adjust COM index if needed
  myPort.bufferUntil('\n');

  dataPoints = new float[width]; // Full width graph
  graph = createGraphics(width, 300); // Top half for graph
}

void draw() {
  background(10);

  // 📈 --- Top Scrolling Graph ---
  graph.beginDraw();
  graph.background(0);
  graph.stroke(0, 255, 0);
  graph.noFill();
  graph.beginShape();
  for (int i = 0; i < dataPoints.length; i++) {
    float y = map(dataPoints[i], 0, 1023, graph.height, 0);
    graph.vertex(i, y);
  }
  graph.endShape();
  graph.endDraw();
  image(graph, 0, 0);

  // 🔵 --- Bottom Left Pulsing Circle ---
  float diameter = map(pulse, 0, 1023, 50, 250);
  float alpha = map(pulse, 0, 1023, 80, 255);
  fill(255, 0, 0, alpha);
  noStroke();
  ellipse(250, 450, diameter, diameter);

  // 🔷 --- Bottom Right Bar Meter ---
  float barHeight = map(pulse, 0, 1023, 0, 200);
  fill(0, 100, 255);
  rect(750, 500 - barHeight, 50, barHeight);

  // 🔤 --- Labels ---
  fill(255);
  textAlign(CENTER);
  textSize(16);
  text("Heartbeat Graph", width/2, 290);
  text("Pulse Intensity", 250, 580);
  text("Bar Meter", 775, 580);
  text("Value: " + int(pulse), 775, 560);
}

void serialEvent(Serial myPort) {
  String inString = myPort.readStringUntil('\n');
  if (inString != null) {
    inString = trim(inString);
    if (inString.matches("\\d+")) {
      pulse = float(inString);

      // Shift graph values
      for (int i = 0; i < dataPoints.length - 1; i++) {
        dataPoints[i] = dataPoints[i + 1];
      }
      dataPoints[dataPoints.length - 1] = pulse;
    }
  }
}
