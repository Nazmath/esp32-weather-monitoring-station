# ESP32 Weather Monitoring Station

An IoT-based weather monitoring system using ESP32 and a DHT22 temperature and humidity sensor. The system collects environmental data, uploads it to the ThingSpeak cloud platform, displays real-time graphs, and provides an email alert when the temperature exceeds a predefined threshold.

## Project Overview

The ESP32 reads temperature and humidity data from the DHT22 sensor.

The collected data is sent to ThingSpeak over Wi-Fi, where it is stored and visualized using real-time graphs.

A local LED provides an indication when an extreme temperature or humidity value is detected.

ThingSpeak MATLAB Analysis and the ThingSpeak Alerts API are used to send an email notification when the temperature exceeds 35°C.

## Features

* Real-time temperature monitoring
* Real-time humidity monitoring
* ESP32-based IoT system
* DHT22 environmental sensor
* Wi-Fi connectivity
* ThingSpeak cloud integration
* Real-time temperature graph
* Real-time humidity graph
* Local LED warning indicator
* Automatic temperature email alert
* Wokwi simulation support
* Cloud-based data visualization

## System Architecture

```text
             ┌───────────────┐
             │     DHT22     │
             │ Temperature & │
             │    Humidity   │
             └───────┬───────┘
                     │
                     ▼
             ┌───────────────┐
             │     ESP32     │
             │               │
             │ Data Reading  │
             │ Alert Logic   │
             │ Wi-Fi         │
             └───────┬───────┘
                     │
                     │ Wi-Fi
                     ▼
             ┌───────────────┐
             │   ThingSpeak  │
             │     Cloud     │
             │               │
             │ Field 1: Temp │
             │ Field 2: Hum. │
             └───────┬───────┘
                     │
             ┌───────┴────────┐
             │                │
             ▼                ▼
      ┌─────────────┐  ┌───────────────┐
      │ Live Graphs │  │ MATLAB +      │
      │             │  │ Alerts API    │
      └─────────────┘  └───────┬───────┘
                                │
                                ▼
                         ┌────────────┐
                         │   Email    │
                         │   Alert    │
                         └────────────┘
```

## Components Required

### Hardware

* ESP32 DevKit
* DHT22 temperature and humidity sensor
* LED
* 220Ω resistor
* Jumper wires
* Breadboard

### Software and Platforms

* Arduino IDE or compatible ESP32 development environment
* Wokwi
* ThingSpeak
* MATLAB Analysis in ThingSpeak

## Pin Configuration

| Component   | ESP32 Pin                    |
| ----------- | ---------------------------- |
| DHT22 DATA  | GPIO 15                      |
| DHT22 VCC   | 3.3V                         |
| DHT22 GND   | GND                          |
| LED Anode   | GPIO 2 through 220Ω resistor |
| LED Cathode | GND                          |

## ThingSpeak Configuration

The ThingSpeak channel contains two fields:

| Field   | Parameter   |
| ------- | ----------- |
| Field 1 | Temperature |
| Field 2 | Humidity    |

The ESP32 uploads data to ThingSpeak approximately every 16 seconds.

## Alert Configuration

### Temperature Alert

The system uses a threshold of:

```text
Temperature > 35°C
```

When the condition is met:

1. ESP32 sends the temperature to ThingSpeak.
2. ThingSpeak detects that the value is above the threshold.
3. React triggers the MATLAB Analysis.
4. MATLAB reads the latest temperature.
5. MATLAB calls the ThingSpeak Alerts API.
6. An email alert is generated.

### Local LED Alert

The ESP32 also turns on the LED when:

```text
Temperature > 35°C
OR
Humidity > 80%
```

## Software Flow

```text
Start
   ↓
Initialize ESP32
   ↓
Initialize DHT22
   ↓
Connect to Wi-Fi
   ↓
Read Temperature & Humidity
   ↓
Check Extreme Values
   ↓
Control LED
   ↓
Send Data to ThingSpeak
   ↓
Wait 16 Seconds
   ↓
Repeat
```

## Example Serial Monitor Output

```text
================================
WEATHER MONITORING SYSTEM
================================
Connecting to Wi-Fi...
Wi-Fi Connected!
IP Address: 10.10.0.2

-----------------------------
Temperature: 57.5 C
Humidity: 60.0 %
Sending data to ThingSpeak...
ThingSpeak Response: 200
Waiting 16 seconds...
```

## Example Alert

If the temperature becomes:

```text
68.8°C
```

the system detects:

```text
68.8 > 35
```

and the temperature alert condition becomes TRUE.

## Wokwi Simulation

The project can be simulated using Wokwi.

Note:

Wokwi does not provide the exact DHT11 component used in the original project requirement, so DHT22 is used as a compatible simulation substitute.

The DHT22 data pin is connected to GPIO 15.

## Project Methodology

1. Connect the DHT22 sensor to the ESP32.
2. Read temperature and humidity values.
3. Process the sensor readings using ESP32.
4. Check the readings against predefined thresholds.
5. Turn the LED on when an extreme value is detected.
6. Connect ESP32 to Wi-Fi.
7. Upload sensor data to ThingSpeak.
8. Visualize the data using ThingSpeak graphs.
9. Use ThingSpeak React to detect high temperature.
10. Trigger MATLAB Analysis.
11. Use the ThingSpeak Alerts API to send an email notification.

## Applications

* Smart weather monitoring
* Indoor environmental monitoring
* IoT-based climate monitoring
* Smart agriculture
* Server room monitoring
* Greenhouse monitoring
* Industrial environmental monitoring

## Future Scope

* Add atmospheric pressure monitoring
* Add air quality sensors
* Add automatic fan control
* Add OLED display
* Add mobile dashboard
* Add multiple sensor nodes
* Add machine learning for temperature prediction
* Add cloud-based anomaly detection
* Add SMS and mobile notifications
* Deploy the system using real outdoor sensors

## Repository Structure

```text
esp32-weather-monitoring-station/
│
├── README.md
├── .gitignore
│
├── src/
│   └── weather_monitoring_station.ino
│
├── thingspeak/
│   └── matlab_temperature_alert.m
│
├── wokwi/
│   └── diagram.json
│
└── docs/
    ├── circuit-diagram.png
    ├── block-diagram.png
    ├── flow-of-operation.png
    ├── methodology.png
    └── thingspeak-dashboard.png
```

## Security

API keys and credentials are intentionally excluded from this repository.

Before running the project, replace the placeholder credentials in the local project with your own ThingSpeak credentials.

Never publish:

* ThingSpeak Write API Key
* ThingSpeak Read API Key
* ThingSpeak Alerts API Key
* Wi-Fi passwords
* Other private credentials

## Author

**Nazmath Pasha**

Electronics & IoT Project

## License

This project is available for educational and learning purposes.
