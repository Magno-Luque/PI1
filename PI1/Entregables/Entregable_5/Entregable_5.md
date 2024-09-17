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

El internet hoy en día ha revolucionado la forma en que las personas interactúan y acceden a la información. En esencia este es uno de los recursos tecnológicos más importantes, facilitando la conexión entre personas mediante redes sociales, así como la búsqueda de contenidos como videos, música y documentos. Esta constante conectividad ha dado lugar a una evolución significativa en las Tecnologías de la Información en las personas y empresas, donde cualquier dispositivo tecnológico puede ser utilizado no solo para almacenar datos, sino también para transmitir y procesar información [1].

En este contexto, ha surgido un concepto clave conocido como Internet de las Cosas (IoT), que representa la interconexión de dispositivos físicos equipados con sensores y capacidades de procesamiento que les permiten comunicarse entre sí y con otros sistemas a través de internet [2]. El IoT ha transformado sectores como la industria, la salud y hogares inteligentes, brindando la posibilidad de automatizar procesos.

Este informe tiene como objetivo detallar la implementación y el uso práctico del Arduino Explore IoT Kit junto a la plataforma Arduino Cloud, con el fin de explorar y comprender de manera didáctica los principios fundamentales del IoT. A lo largo del trabajo, se llevaron a cabo diversas actividades, como encender un LED, cambiar el color de varios LEDs, y visualizar el registro en tiempo real de parámetros ambientales, como humedad, temperatura, proximidad y presión, desde una pantalla LCD integrada al kit. Estos datos fueron organizados y controlados a través de la plataforma Arduino Cloud, que permite el monitoreo y la interacción remota con los dispositivos conectados.

Las herramientas que proporciona Arduino Cloud son intuitivas y permiten una implementación sencilla, lo que facilita el aprendizaje de los fundamentos del IoT. A continuación, se presentará en detalle el proceso seguido que permitió lograr el objetivo.

## **2. Metodología**

El Arduino Explore IoT Kit proporciona todas las herramientas necesarias para comenzar a explorar los fundamentos del Internet de las Cosas y crear dispositivos conectados a internet de manera sencilla [3]. Este kit incluye los siguientes componentes:

+ Placa Arduino MKR WiFi 1010
+ MKR IoT Carrier, diseñado específicamente para este kit, que incluye:
  + Dos relés de 24 V
  + Soporte para tarjeta SD
  + Cinco botones táctiles
  + Conectores plug-and-play para diversos sensores
  + Sensor de temperatura
  + Sensor de humedad
  + Sensor de presión
  + Sensor RGBC (Color y luz ambiental), gestos y proximidad
  + IMU (Unidad de Medición Inercial)
  + Pantalla RGB de 1.20”
  + Soporte para batería recargable de iones de litio 18650 (batería no incluida)
  + Cinco LEDs RGB
+ Revestimiento de plástico
+ Cable micro USB
+ Sensor PIR (Infrarrojo Pasivo)
+ Cables plug-and-play para todos los sensores

Asímismo, podemos visualizar a manera gráfica:

<img src="https://github.com/user-attachments/assets/d19db32f-b899-43a6-a5d5-193bdff6f481" alt="Imagen" width="410" height="280"/>  

Estos componentes permiten realizar las siguientes actividades:

+ Uso de Arduino Cloud y gestión de dispositivos conectados.
+ Recopilación, procesamiento y almacenamiento de datos desde los sensores.
+ Visualización y graficación de datos para comprender su significado y relevancia.
+ Desarrollo colaborativo de soluciones tecnológicas para abordar problemas de sostenibilidad mediante el uso de IoT.
+ Aplicación de técnicas de pensamiento de diseño para crear soluciones innovadoras y efectivas.

Ahora bien, como IoT se refiere a la comunicación, control y gestión de dispositivos desde cualquier parte del mundo conectados a internet, esto es posible gracias a Arduino Cloud. Esta plataforma está diseñada para proporcionar bocetos predefinidos que pueden ser utilizados fácilmente [4]. A continuación, se detallan los pasos seguidos para implementar el IoT:

#### **1. Crear una cuenta:**
<img src="https://github.com/user-attachments/assets/dd1d4c35-0652-40f2-b90f-40204cf0357c" alt="Imagen 1" width="510" height="280"/>  
<img src="https://github.com/user-attachments/assets/876ef0cc-19b3-43b2-964b-bf37417fd3c4" alt="Imagen 1" width="570" height="280"/>

#### **2. Conectar un dispositivo (Devices):**
<img src="https://github.com/user-attachments/assets/7f5029a1-a269-4c96-b87e-ef90e3d0bd66" alt="Imagen 1" width="570" height="280"/>

#### **3. Agregar bocetos (Sketches):**
<img src="https://github.com/user-attachments/assets/7926a301-401d-436f-8b50-73435e1732db" alt="Imagen 1" width="570" height="280"/>

#### **4. Agregar y conectar cosas (Things):**
<img src="https://github.com/user-attachments/assets/c6206814-b0df-4a00-8fae-8539e05f137a" alt="Imagen 1" width="570" height="280"/>

#### **5. Organizar panel de control (Dashboard):**
<img src="https://github.com/user-attachments/assets/083b694d-1db6-42c3-90ee-969ff4c31f18" alt="Imagen 1" width="570" height="280"/>

Esta metodología facilita la implementación de proyectos IoT al proporcionar una plataforma integral que cubre desde la recolección de datos hasta su análisis y visualización.

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

[1] E. S. Duarte, "Las tecnologías de información y comunicación (TIC) desde una perspectiva social," Revista electrónica educare, vol. 12, pp. 155-162, 2008. [Online]. Disponible: https://www.redalyc.org/pdf/1941/194114584020.pdf. [Accedido: 17-Set-2024].

[2] S. Madakam, R. Ramaswamy, and S. Tripathi, "Internet of Things (IoT): A literature review," Journal of Computer and Communications, 2015. [Online]. Disponible: https://www.scirp.org/journal/paperinformation?paperid=56616. [Accedido: 17-Set-2024].

[3] Arduino, "Explore IoT Kit," Arduino, [Online]. Disponible: https://www.arduino.cc/education/explore-iot-kit/. [Accedido: 17-Sep-2024].

[4] Arduino, "Arduino Cloud," Arduino Documentation, [Online]. Disponible: https://docs.arduino.cc/arduino-cloud/. [Accedido: 15-Sep-2024].
