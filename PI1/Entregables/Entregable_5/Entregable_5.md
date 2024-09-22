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

Asimismo, podemos visualizar a manera gráfica:

<img src="https://github.com/user-attachments/assets/d19db32f-b899-43a6-a5d5-193bdff6f481" alt="Imagen" width="410" height="280"/>  

Estos componentes permiten realizar las siguientes actividades:

+ Uso de Arduino Cloud y gestión de dispositivos conectados.
+ Recopilación, procesamiento y almacenamiento de datos desde los sensores.
+ Visualización de datos para comprender su significado y relevancia.
+ Desarrollo colaborativo de soluciones tecnológicas para abordar problemas de sostenibilidad mediante el uso de IoT.
+ Aplicación de técnicas de pensamiento de diseño para crear soluciones innovadoras y efectivas.

Ahora bien, como IoT se refiere a la comunicación, control y gestión de dispositivos desde cualquier parte del mundo conectados a internet, esto es posible gracias a Arduino Cloud. Esta plataforma está diseñada para proporcionar bocetos predefinidos que pueden ser utilizados fácilmente [4]. A continuación, se detallan los pasos seguidos para implementar el IoT:

#### **1. Crear una cuenta:**
| Página de login | Página de Inicio |
|----------|----------|
| <img src="https://github.com/user-attachments/assets/dd1d4c35-0652-40f2-b90f-40204cf0357c" alt="Imagen 1" width="850"/> | <img src="https://github.com/user-attachments/assets/876ef0cc-19b3-43b2-964b-bf37417fd3c4" alt="Imagen 2" width="850"/> |


#### **2. Conectar un dispositivo (Devices):**
<img src="https://github.com/user-attachments/assets/7f5029a1-a269-4c96-b87e-ef90e3d0bd66" alt="Imagen 1" width="590" height="280"/>

Para que Arduino Cloud pueda reconocer los dispositivos conectados por los puertos de la PC se instaló un programa llamado Arduino Create Agent.

<img src="https://github.com/user-attachments/assets/bbfddf0f-e869-440f-b2f2-1214e91efe3c" alt="Imagen 1" width="450" height="300"/>

#### **3. Agregar bocetos (Sketches):**
| Página de login | Página de Inicio |
|----------|----------|
| <img src="https://github.com/user-attachments/assets/7926a301-401d-436f-8b50-73435e1732db" alt="Imagen 1" width="590" height="280"/>| <img src="https://github.com/user-attachments/assets/16f0b24e-3bbf-4dc3-a116-b8590ab37266" alt="Imagen 1" width="590" height="280"/>|

#### **4. Agregar y conectar cosas (Things):**
| Página de login | Página de Inicio |
|----------|----------|
| <img src="https://github.com/user-attachments/assets/c6206814-b0df-4a00-8fae-8539e05f137a" alt="Imagen 1" width="590" height="280"/>| <img src="https://github.com/user-attachments/assets/bcd16e9b-f7cd-485f-b160-0cdc6e559efd" alt="Imagen 1" width="590" height="280"/>|

#### **5. Organizar panel de control (Dashboard):**
| Página de login | Página de Inicio |
|----------|----------|
| <img src="https://github.com/user-attachments/assets/083b694d-1db6-42c3-90ee-969ff4c31f18" alt="Imagen 1" width="590" height="280"/>| <img src="https://github.com/user-attachments/assets/49c98680-bfea-4b07-81bb-6c7e7c3d569a" alt="Imagen 1" width="590" height="280"/>|

Esta metodología facilita la implementación sencilla de proyectos IoT al proporcionar una plataforma integral que cubre desde la recolección de datos hasta su análisis y visualización.

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
```cpp
#include "arduino_secrets.h"  // Incluye credenciales y configuraciones del IoT
#include "thingProperties.h"  // Propiedades del Arduino IoT Cloud
#include <Arduino_MKRIoTCarrier.h>  // Librería para controlar el MKR IoT Carrier

MKRIoTCarrier carrier;  // Objeto para interactuar con el carrier
int moistPin = A5;  // Pin para el sensor de humedad
int moistValue;  // Almacena el valor del sensor de humedad
String relayState1 = "";  // Estado del relé 1
String relayState2 = "";  // Estado del relé 2

void setup() {
  Serial.begin(9600);  // Inicializa la comunicación serial
  initProperties();  // Inicializa las propiedades del IoT Cloud
  ArduinoCloud.begin(ArduinoIoTPreferredConnection);  // Conexión al IoT Cloud
  CARRIER_CASE = true;  // Indica que se usa con la carcasa del carrier
  carrier.begin();  // Inicializa el carrier

  // Espera hasta que el dispositivo se conecte al IoT Cloud
  while (ArduinoCloud.connected() != 1) {
    ArduinoCloud.update();  // Actualiza el estado del IoT Cloud
    // Muestra en pantalla que se está esperando la conexión
    carrier.display.setTextSize(3);
    carrier.display.setCursor(20, 70);
    carrier.display.println("Waiting For");
    carrier.display.setCursor(5, 110);
    carrier.display.println("Connection...");
    delay(500);  // Pausa breve antes de volver a intentar
  }
}

void loop() {
  ArduinoCloud.update();  // Actualiza las variables y comunicación con el IoT Cloud

  // Control de los relés basados en el estado recibido del IoT Cloud
  if (relay_1 == true) {
    carrier.Relay1.open();  // Activa el relé 1
    relayState1 = "ON";  // Actualiza el estado del relé 1
  } else {
    carrier.Relay1.close();  // Desactiva el relé 1
    relayState1 = "OFF";  // Actualiza el estado del relé 1
  }

  if (relay_2 == true) {
    carrier.Relay2.open();  // Activa el relé 2
    relayState2 = "ON";  // Actualiza el estado del relé 2
  } else {
    carrier.Relay2.close();  // Desactiva el relé 2
    relayState2 = "OFF";  // Actualiza el estado del relé 2
  }

  // Lectura de sensores del carrier
  if (carrier.Light.colorAvailable()) {
    int none;
    carrier.Light.readColor(none, none, none, light);  // Lee el sensor de luz
  }

  temperature = carrier.Env.readTemperature();  // Lee la temperatura
  humidity = carrier.Env.readHumidity();  // Lee la humedad
  int rawMoistValue = analogRead(moistPin);  // Lee el valor bruto del sensor de humedad
  moistValue = map(rawMoistValue, 0, 1023, 100, 0);  // Mapea el valor a un rango de 0 a 100
}

// Funciones para reaccionar a los cambios de estado en el IoT Cloud (vacías por ahora)
void onRelay1Change() { /* hacer algo cuando cambie el relé 1 */ }
void onRelay2Change() { /* hacer algo cuando cambie el relé 2 */ }
void onRgbColorChange() { /* hacer algo cuando cambie el color RGB */ }
void onUpdateDisplayChange() { /* hacer algo cuando cambie la pantalla */ }

```


## DASHBOARDS

![8593ec5f-786a-4bae-ad7d-c9fe7832f8da](https://github.com/user-attachments/assets/7128f128-1bc2-486b-aa6d-254244d07cb1)

De acuerdo con el código y la implementación del dashboard, se realizó lo siguiente: se logró encender el LED de color amarillo. Asimismo, en el MKR IoT Carrier se puede aumentar y reducir la luminosidad de las luces rgb. Al mismo tiempo, es posible verificar el resultado de la temperatura y la humedad en la pantalla lcd, las cuales se midieron con el sensor de humedad. También se pudo determinar la luminosidad total. Por otro lado, en el dashboard se podían actualizar los datos durante cada proceso debido a qué habíamos configurado todo este sistema ARUINO CLOUD y de esta manera ver en tiempo real data que podíamos controlarlo desde la laptop.

## SALIDA

### PRIMERA PARTE
![ea3a57be-5016-47ac-ae72-f34c5ea49a83](https://github.com/user-attachments/assets/f9767886-31eb-469c-965c-7112aa404690)


### SEGUNDA PARTE
https://github.com/user-attachments/assets/b67d6930-652b-4036-8e21-4171d5c7df82


### TERCERA PARTE
https://github.com/user-attachments/assets/0f4a6a16-87d3-4e22-ba3a-64057a39c338


## CUARTA PARTE
https://github.com/user-attachments/assets/b9907ec7-a906-4d42-bc26-373a16c3b4a3





## **4. Discusiones**

El informe detalla la implementación del Arduino Explore IoT Kit, subrayando su importancia en la enseñanza y comprensión de los principios del Internet de las Cosas (IoT). En un mundo donde la tecnología avanza rápidamente, la interconexión de dispositivos se ha vuelto esencial, no solo en el ámbito industrial, sino también en aplicaciones cotidianas que buscan mejorar la calidad de vida.

El IoT ha revolucionado nuestra interacción con el entorno físico. La capacidad de conectar dispositivos y recolectar datos en tiempo real permite a las empresas optimizar procesos, aumentar la eficiencia y ofrecer servicios personalizados [5]. Una de las principales ventajas del kit es su diseño intuitivo, que capacita a los usuarios, incluso aquellos sin experiencia previa, para desarrollar proyectos complejos con relativa facilidad. La integración con Arduino Cloud no solo facilita la gestión de dispositivos, sino que también permite la visualización de datos de manera clara y accesible, lo que resulta en un aprendizaje más dinámico y atractivo[6].

Las actividades realizadas, como el control de LEDs y la visualización de parámetros ambientales, no solo refuerzan los conceptos teóricos del IoT, sino que también fomentan un aprendizaje experiencial significativo. La posibilidad de observar resultados inmediatos de sus acciones permite comprender de manera más efectiva la relación entre hardware y software, así como la relevancia de la recolección y análisis de datos.

#### *Evaluación de Resultados:* 

A pesar de los logros, es importante reconocer las áreas de mejora. Durante las actividades, se presentaron algunos desafíos relacionados con la conectividad y la latencia de los datos, haciendo un análisis de los datos recolectados indica que la mayoría de los sensores proporcionaron lecturas consistentes, lo que respalda la confiabilidad del sistema. Sin embargo, las variaciones en las lecturas de ciertos sensores, como el sensor de luz, plantean preguntas sobre su calibración y precisión. Estos problemas resaltan la necesidad de optimizar la configuración del sistema y considerar el uso de componentes adicionales para mejorar la estabilidad de la red.

Además, la experiencia práctica con el kit puede ser complementada con una mayor profundización en los conceptos teóricos, lo que permitiría no solo aplicar sus conocimientos, sino también entender las implicaciones más amplias del IoT en la sociedad actual.


#### *Relación entre Resultados y Objetivos:*

Los resultados obtenidos en este experimento han demostrado en gran medida que los objetivos planteados en la introducción se han cumplido. La conexión exitosa del Arduino MKR IoT Carrier a la plataforma IoT y su capacidad para interactuar con diversos sensores y actuadores confirmaron la viabilidad del sistema propuesto. Por ejemplo, los datos de temperatura y humedad recolectados fueron consistentes con las expectativas iniciales, lo que sugiere que los sensores funcionan correctamente y son precisos en sus lecturas. Sin embargo, se identificaron algunas discrepancias en la precisión de los datos de ciertos sensores, lo que podría indicar áreas de mejora.

#### *Comportamiento de Dispositivos y Sensores:* 

El comportamiento de los dispositivos y sensores conectados a la plataforma IoT fue en general satisfactorio. Los relés y LEDs respondieron adecuadamente a los comandos enviados desde la nube, reflejando los estados deseados en tiempo real. No obstante, se observaron algunos retrasos en la respuesta, especialmente durante períodos de alta carga de red. Este comportamiento sugiere que, aunque el sistema es funcional, la latencia puede ser un factor limitante que afecte su rendimiento en aplicaciones críticas que requieren respuestas inmediatas.


En resumen, el experimento ha validado la efectividad del sistema IoT basado en el Arduino MKR IoT Carrier en gran medida, aunque se han identificado áreas para la mejora y optimización. La discusión de los resultados en relación con los objetivos iniciales y el comportamiento de los dispositivos proporciona una base sólida para futuras investigaciones y desarrollos en este campo.

## **5. Conclusiones**

En el presente laboratorio, se logró implementar con éxito un sistema de Internet de las Cosas (IoT) utilizando el Arduino Explore IoT Kit junto con la plataforma Arduino Cloud. A pesar de las dificultades iniciales que se presentaron con la conexión del dispositivo a la nube, el proceso resultó efectivo, permitiendo el monitoreo y control en tiempo real de diversos parámetros ambientales.

Los resultados obtenidos mostraron que la temperatura del entorno aumentaba ligeramente al acercar una fuente de luz al dispositivo. Asimismo, se registró un cambio notable en la temperatura desde el inicio hasta el final del experimento, lo cual se atribuyó a la activación de las luces RGB del MKR IoT Carrier, evidenciando así la sensibilidad del sensor de temperatura integrado. En cuanto a la humedad, se observó variación al introducir el dispositivo en diferentes sustratos, lo que confirma la funcionalidad del sensor de humedad, especialmente en condiciones de tierra húmeda.

Adicionalmente, la posibilidad de encender y apagar los LEDs desde el dashboard de Arduino Cloud, así como la opción de hacer clic en un botón tipo switch para actualizar los datos en pantalla, facilitaron la manipulación de los dispositivos conectados, proporcionando una experiencia interactiva y práctica. La visualización en tiempo real de los datos recolectados no solo enriqueció nuestra comprensión de los fenómenos observados, sino que también subrayó la efectividad de la plataforma en la gestión de dispositivos IoT.

En resumen, este laboratorio no solo cumplió con los objetivos planteados, sino que también brindó una experiencia valiosa en la implementación de soluciones tecnológicas a través del IoT, destacando su potencial para la automatización y el control de procesos en diversos contextos.



## **6. Referencias**

[1] E. S. Duarte, "Las tecnologías de información y comunicación (TIC) desde una perspectiva social," Revista electrónica educare, vol. 12, pp. 155-162, 2008. [Online]. Disponible: https://www.redalyc.org/pdf/1941/194114584020.pdf. [Accedido: 17-Set-2024].

[2] S. Madakam, R. Ramaswamy, and S. Tripathi, "Internet of Things (IoT): A literature review," Journal of Computer and Communications, 2015. [Online]. Disponible: https://www.scirp.org/journal/paperinformation?paperid=56616. [Accedido: 17-Set-2024].

[3] Arduino, "Explore IoT Kit," Arduino, [Online]. Disponible: https://www.arduino.cc/education/explore-iot-kit/. [Accedido: 17-Sep-2024].

[4] Arduino, "Arduino Cloud," Arduino Documentation, [Online]. Disponible: https://docs.arduino.cc/arduino-cloud/. [Accedido: 15-Sep-2024].

[5]J. J. Saavedra-Neira, M. I. Hernández-Barba, y A. C. Mendoza-De Los Santos, "Aplicaciones y beneficios IoT como alternativa en el gobierno TI: Revisión sistemática de literatura," *Revista Científica de la UCSA*.[online]. DIsponible: http://scielo.iics.una.py/scielo.php?script=sci_arttext&pid=S2409-87522023000100120 [Accedido: 18-sep-2024]

[6]K. Küçük, C. Bayılmıs, y D. L. Msongaleli, "Designing real-time IoT system course: Prototyping with cloud platforms, laboratory experiments and term project," *International Journal of Electrical Engineering & Education*. [online]. Disponible: https://journals.sagepub.com/doi/abs/10.1177/0020720919862496 [Accedido: 18-sep-2024]
