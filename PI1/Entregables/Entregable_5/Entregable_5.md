<div style="position: relative; height: 100px;">
    <a href="https://www.cayetano.edu.pe/" style="position: absolute; top: 0; right: 0;">
        <img src="https://img.shields.io/badge/UPCH-%20-101010?style=for-the-badge&logo=universities&logoColor=white&labelColor=FFD700" alt="UPCH Badge">
    </a>

<p align="center">
  <a href="https://github.com/DenverCoder1/readme-typing-svg">
    <img src="https://readme-typing-svg.herokuapp.com?font=Time+New+Roman&color=F1C40F&size=25&center=true&vCenter=true&width=600&height=100&lines=UNIVERSIDAD+PERUANA+CAYETANO+HEREDIA">
  </a>
</p>

# Tema:
### Implementación del Intenet de las cosas (IoT)

# **Curso:**
### Proyectos de Ingeniería 1

# **Integrantes:**
- Llanos Angeles Leily Marlith
- Luque Mamani Magno Ricardo
- Mendoz Villar Antony Iván
- Quispe Baldeon Melissa

# **Docentes:**
- Umbert Lewis de la Cruz Rodríguez
- Renzo Jose Chan Rios
- Marcos Miguel Retamozo Ramos
- Moisés Stevend Meza Rodríguez
- Harry Anderson Rivera Tito
- Pierre Giovanny Ramos Apestegui

#
#

## **1. Introducción**



## **2. Metodología**


## **3. Resultados**

## CONEXIÓN

### MKR WiFi 1010:

- El pin 5V del MKR WiFi 1010 se conectará al pin central del MKR IoT Carrier.
- El pin NC (normalmente abierto) pasa a través de un resistor que se conecta al ánodo del LED (parte positiva del LED).
- El cátodo del LED (parte negativa) se conectará al pin de tierra (GND) del MKR WiFi 1010.
  
### Sensor de Humedad:

- El sensor de humedad estará conectado en la ranura A5 del MKR IoT Carrier.


<img src="https://github.com/user-attachments/assets/6ce8f8a9-0fb0-4bc9-b988-da0a817b1a05" alt="Imagen 1" width="410" height="280"/>  
<img src="https://github.com/user-attachments/assets/e91a914d-fae6-423f-8bf0-d58b0f970539" alt="Imagen 2" width="410" height="280"/>

## CÓDIGO

    #include "arduino_secrets.h"
    #include "thingProperties.h"
    #include <Arduino_MKRIoTCarrier.h>
    
    MKRIoTCarrier carrier;
    int moistPin = A5;
    int moistValue; // Se declara la variable moistValue
    String relayState1 = "";
    String relayState2 = "";
    
    void setup() {
      Serial.begin(9600);
      initProperties();
      ArduinoCloud.begin(ArduinoIoTPreferredConnection);
      CARRIER_CASE = true;
      carrier.begin();
      
      // Esperar la conexión al IoT Cloud
      while (ArduinoCloud.connected() != 1) {
        ArduinoCloud.update();
        carrier.display.setTextSize(3);
        carrier.display.setCursor(20, 70);
        carrier.display.println("Waiting For");
        carrier.display.setCursor(5, 110);
        carrier.display.println("Connection...");
        delay(500);
      }
    }
    
    void loop() {
      ArduinoCloud.update();
      
      // Control de los relés
      if (relay_1 == true) {
        carrier.Relay1.open();
        relayState1 = "ON";
      } else {
        carrier.Relay1.close();
        relayState1 = "OFF";
      }
    
      if (relay_2 == true) {
        carrier.Relay2.open();
        relayState2 = "ON";
      } else {
        carrier.Relay2.close();
        relayState2 = "OFF";
      }
    
      // Lectura de sensores
      if (carrier.Light.colorAvailable()) {
        int none;
        carrier.Light.readColor(none, none, none, light);
      }
    
      temperature = carrier.Env.readTemperature();
      humidity = carrier.Env.readHumidity();
      int rawMoistValue = analogRead(moistPin);
      moistValue = map(rawMoistValue, 0, 1023, 100, 0);
    }
    
    // Funciones para los cambios en las propiedades
    void onRelay1Change() { /* hacer algo */ }
    void onRelay2Change() { /* hacer algo */ }
    void onRgbColorChange() { /* hacer algo */ }
    void onUpdateDisplayChange() { /* hacer algo */ }

## SALIDA

![ea3a57be-5016-47ac-ae72-f34c5ea49a83](https://github.com/user-attachments/assets/f9767886-31eb-469c-965c-7112aa404690)









## DASHBOARDS

![8593ec5f-786a-4bae-ad7d-c9fe7832f8da](https://github.com/user-attachments/assets/7128f128-1bc2-486b-aa6d-254244d07cb1)







## **4. Discusiones**

## **5. Conclusiones**


## **6. Referencias**

