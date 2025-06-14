# heartbeat-monitor-arduino-processing
Real-time heartbeat monitoring system using Arduino and KY-039 sensor with Processing-based GUI visualization.
# ❤️ Heartbeat Monitor using Arduino and KY-039 Sensor with Processing GUI

This project is a real-time heartbeat monitoring system built using the **KY-039 pulse sensor**, **Arduino Uno**, and a **Processing-based GUI**. It reads heartbeat signals from the user’s fingertip and displays them using a smooth, dynamic graphical interface — a combination of line graphs, bars, and circles — in real time.

---

## 📦 Features

- Real-time analog signal reading from KY-039 heartbeat sensor  
- Arduino IDE-based sketch for sensor input  
- Serial communication between Arduino and Processing  
- Beautiful graphical interface using Processing (bar, graph, and circle animations)  
- Easy to build and beginner-friendly

---

## 🎬 Demo Video

📺 [Watch the full project on YouTube – The IITian DPK](https://www.youtube.com/@TheIITianDPK)  
🔴 Live demonstration, code explanation, and sensor testing included.

---

## 🧰 Components Used

| Component               | Quantity |
|-------------------------|----------|
| Arduino Uno             | 1        |
| KY-039 Heartbeat Sensor | 1        |
| Jumper Wires            | 3–4      |
| USB Cable               | 1        |
| Laptop with Arduino IDE & Processing installed | 1 |

---

## 🔌 Circuit Diagram

📷 **Connections**  
| KY-039 Pin | Arduino Pin |
|------------|--------------|
| Long Pin (GND) | GND       |
| Middle Pin (VCC) | 5V     |
| Short Pin (Signal) | A0    |

> 🖼️ *Insert wiring diagram image if available in `images/` folder*

---

## 💻 Arduino Code (`heartbeat_monitor.ino`)

- Reads analog data from sensor (Pin A0)
- Sends serial output to Processing for GUI
- Sample rate: ~10 ms

```cpp
const int heartbeatPin = A0;
int signalValue = 0;

void setup() {
  Serial.begin(9600);
  pinMode(heartbeatPin, INPUT);
  Serial.println("Place your finger on the sensor.");
}

void loop() {
  signalValue = analogRead(heartbeatPin);
  Serial.println(signalValue);
  delay(10);
}
```

---

## 🖥️ GUI with Processing (`heartbeat_visual_gui.pde`)

- Reads serial data from Arduino  
- Visualizes heartbeat using:
  - 📈 Real-time line graph
  - 🟢 Pulsating circle
  - 📊 Dynamic vertical bar

> Requires **Processing IDE** (https://processing.org/)

---

## 🧪 How It Works

1. The KY-039 sensor detects light absorption through the fingertip.
2. Arduino reads the pulse data as analog voltage levels.
3. Processing reads this serial data and plots it in real time.
4. You can see your heartbeat as it changes visually!

---

## 📁 Folder Structure

```
heartbeat-monitor-arduino-processing/
├── Arduino/
│   └── heartbeat_monitor.ino
├── Processing_GUI/
│   └── heartbeat_visual_gui.pde
├── images/
│   └── wiring_diagram.png
├── README.md
```

---

## 📚 Applications

- Basic biomedical signal monitoring  
- Educational Arduino projects  
- Visual sensor data analysis  
- DIY healthcare kits

---

## 🙋 Author

**Deepak Kumawat**  
🎓 M.Tech, IIT Kharagpur  
📺 YouTube: [The IITian DPK](https://www.youtube.com/@TheIITianDPK)  
📸 Instagram: [@imdpk96](https://www.instagram.com/imdpk96)
    Linkedin: [dpk kmwt](https://www.linkedin.com/in/imdpk96)

---

## ⭐ Support

If you liked this project:
- Give this repo a ⭐ star
- Share the YouTube video
- Try building it yourself!
