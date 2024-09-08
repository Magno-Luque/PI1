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
### Implementación de TinyML en Arduino para el Reconocimiento de Formas y Números

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

El presente informe tiene como objetivo documentar el desarrollo e implementación de un modelo de TinyML en un Arduino Nano 33 BLE Sense. Este trabajo se centra en la interacción entre el dispositivo y LEDs de diferentes colores, que se activan en respuesta a dibujos específicos realizados por el usuario. La idea principal es utilizar el potencial del aprendizaje automático en dispositivos de bajo consumo para realizar inferencias en tiempo real, lo que abre un abanico de posibilidades en aplicaciones de Internet de las Cosas (IoT) y dispositivos inteligentes.

El uso de TinyML permite llevar modelos de aprendizaje automático a dispositivos con recursos limitados, facilitando su integración en proyectos de electrónica y robótica. Según Warden (2019), "TinyML es un enfoque que permite ejecutar modelos de aprendizaje automático en dispositivos embebidos, lo que permite realizar inferencias localmente sin necesidad de conexión a la nube". Este enfoque no solo mejora la latencia en la respuesta del sistema, sino que también optimiza el uso de recursos y la privacidad de los datos.

La implementación de este modelo en el Arduino Nano 33 BLE Sense se basa en tres condiciones específicas:

- Encender un LED rojo cuando se dibuje un círculo.
- Encender un LED azul cuando se dibuje el número 3.
- Encender un LED verde cuando se dibuje el número 1.

Estas condiciones permiten evaluar la capacidad de inferencia del modelo y su efectividad en la identificación de patrones en los datos de entrada. Tal como se menciona en el proyecto "Magic Wand" (2023), "la capacidad de los dispositivos para interpretar gestos o dibujos puede transformar la forma en que interactuamos con la tecnología".

A lo largo de este informe se detallarán los procedimientos de desarrollo, desde la recolección de datos hasta la implementación del modelo en el hardware, así como los resultados obtenidos y las conclusiones alcanzadas.


## **2. Preparación de datos**

En este apartado se hablará sobre los datos, desde su obtención con el uso del Arduino Nano 33 BLE Sense, hasta su preparación para el entrenamiento de nuestro modelo de machine learning. Este apartado incluye lo siguiente:

**2.1 Obtención de datos** 

La placa Arduino Nano 33 BLE Sense, que permite aplicar inteligencia artificial, nos permitió capturar muestras de movimientos (posiciones en los ejes x, y, z) correspondientes a las clases [círculo](https://github.com/Magno-Luque/PI1/blob/main/PI1/Entregables/Entregable_3/carpeta_circulo-20240905T154348Z-001.zip), [uno](https://github.com/Magno-Luque/PI1/blob/main/PI1/Entregables/Entregable_3/carpeta_uno-20240905T154352Z-001.zip) y [tres](https://github.com/Magno-Luque/PI1/blob/main/PI1/Entregables/Entregable_3/carpeta_tres-20240905T154334Z-001.zip) utilizando la plataforma Edge Impulse. Este sitio ofrece herramientas para recolectar datos, diseñar modelos y desplegarlos.

A continuación, se puede evidenciar lo mencionado:
| Arduino Nano 33 BLE Sense | Edge Impulse |
| ----------- | ----------- |
| <img src="https://github.com/user-attachments/assets/253828d6-ea4a-472e-b318-6a4f4cb7f7c6" width="550"/> | <img src="https://github.com/user-attachments/assets/3514173a-4f52-4208-8b32-da9c4a096ef7" width="720"/> |

Se tomaron un total de 100 muestras para cada clase, las cuales se dividieron en un 80% y un 20% entre datos de entrenamiento y prueba, respectivamente, como se muestra a continuación:

<div align="center">
    <img src="https://github.com/user-attachments/assets/295a4821-ab9f-4d32-b0f5-8c51157b6f6d" width="500"/>
</div>

**2.2 Diseño de impulso**

Para la creación del impulso en la plataforma Edge Impulse, como se observa en la imagen, los datos de series de tiempo consistieron en los ejes de entrada obtenidas por los sensores del Arduino Nano 33 BLE Sense como un acelerómetro, un giroscopio y un magnetómetro (accX, accY, accZ, gyrX, gyrY, gyrZ, magX, magY y magZ); se utilizó un tamaño de ventana de 3 segundos para procesar los datos, y lo demás se dejó por defecto. En el análisis espectral se verifica el bloque de procesamiento de los ejes de entrada. A continuación, tenemos el bloque de aprendizaje, que en este caso es de clasificación, tomando como entrada las características espectrales y como salida las tres clases (círculo, tres, uno). Por último, se mencionan las características de salida que corresponden a estas tres clases.
<div align="center">
    <img src="https://github.com/user-attachments/assets/65546862-c414-46ed-98e8-abe1bff814ce" width="680"/>
</div>


**2.3 Características espectrales**

Con respecto a este punto, se dejó la configuración de los parámetros por defecto. Por otro lado, al generar características, se tomó un total de 161 ms en tiempo de procesamiento y un uso máximo de RAM de 12 KB, quedando de la siguiente manera:

<div align="center">
    <img src="https://github.com/user-attachments/assets/13736379-e394-43e6-8453-169251b0fff2" width="600"/>
</div>


**2.4 Clasificación y entrenamiento**
<table>
  <tr>
    <th width="33%">En la configuración de la red neuronal, dejamos el número de ciclos de entrenamiento en 30, la tasa de aprendizaje en 0.001, y separamos un 20% de los datos para la validación. La arquitectura de la red neuronal quedó de la siguiente manera:</th>
    <th width="33%">Pasamos al entrenamiento de nuestro modelo y obtuvimos un 98% de exactitud y una pérdida de 0.05 en general, lo que evidencia que se trata de un modelo eficiente:</th>
    <th width="33%">En la exploración de los datos, vistos gráficamente, queda así:</th>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/ced1d9a1-619e-4841-b4f4-c22e92686c98" width="400"/></td>
    <td><img src="https://github.com/user-attachments/assets/21054fe4-626b-41c7-8e6f-ff65958f1692" width="450"/></td>
    <td><img src="https://github.com/user-attachments/assets/90355a0a-b759-4744-926c-0c8f9a22de74" width="650"/></td>
  </tr>
</table>


De esta manera, podemos observar que la predicción de nuestro modelo puede ser imprecisa, pero en menor medida en comparación con la predicción correcta.

**2.5 Despliegue**

Ya entrenado el modelo ajustado a nuestro problema, se configuró el formato del modelo como librería de Arduino para que así se programe el Arduno Nano 33 BLE Sense. 
<div align="center">
    <img src="https://github.com/user-attachments/assets/c49a1e48-d60d-44fc-9e90-fbac82d0534d" width="500"/>
</div>


## **3. Implementación del modelo**

Para implementar nuestro modelo de TinyML desarrollado en Edge Impulse y lo hemos integrado en el entorno de desarrollo de Arduino, utilizando la placa Arduino Nano 33 BLE Sense. Durante este proceso, nos encontramos con algunos errores que requirieron ajustes para garantizar el correcto funcionamiento del sistema. Inicialmente, el código solo se encargaba de ejecutar las predicciones del modelo, por lo que tuvimos que adaptarlo para que pudiera leer las coordenadas del acelerómetro en la placa y, de este modo, identificar los gestos realizados por el usuario (círculo, uno o tres).

```cpp
#include <Wire.h>
#include <Arduino_LSM9DS1.h>
#include <entregable_inferencing.h>
```
Utilizamos la biblioteca `Wire` para habilitar la comunicación I2C y la biblioteca `Arduino_LSM9DS1` para interactuar con el acelerómetro de tres ejes de la placa.

Para lograr que el modelo identificara los gestos, configuramos el acelerómetro para leer los valores de los ejes x, y y z. Estos valores son almacenados en un array que luego es procesado por el modelo.

```cpp
if (IMU.accelerationAvailable()) {
    IMU.readAcceleration(x, y, z);
    features[feature_index++] = x;
    features[feature_index++] = y;
    features[feature_index++] = z;
}
```
Aquí, los datos de aceleración se recogen y almacenan en el array `features[]`, que es utilizado posteriormente para realizar la inferencia.

Una vez que se llena el array con suficientes datos, el modelo de TinyML se ejecuta para clasificar el gesto realizado. Utilizamos la función `run_classifier` para ejecutar la inferencia.

```cpp
EI_IMPULSE_ERROR res = run_classifier(&features_signal, &result, false /* debug */);
```
Este código toma los datos recopilados del acelerómetro y los pasa al modelo para la clasificación, que devuelve la clase de gesto detectado (círculo, uno o tres).

Tras realizar la inferencia, se implementó un mecanismo visual utilizando los LEDs de la placa. Dependiendo del gesto detectado, un LED específico se enciende:

+ Rojo para el gesto de círculo.
+ Verde para el gesto de uno.
+ Azul para el gesto de tres.
```cpp
if (strcmp(ei_classifier_inferencing_categories[i], "circle") == 0 && result.classification[i].value > 0.8) {
    digitalWrite(LED_RED_PIN, HIGH);  // Enciende LED rojo para círculo
}
else if (strcmp(ei_classifier_inferencing_categories[i], "three") == 0 && result.classification[i].value > 0.8) {
    digitalWrite(LED_BLUE_PIN, HIGH);  // Enciende LED azul para número 3
}
else if (strcmp(ei_classifier_inferencing_categories[i], "one") == 0 && result.classification[i].value > 0.8) {
    digitalWrite(LED_GREEN_PIN, HIGH);  // Enciende LED verde para número 1
}
```
Una vez ajustado el código para que lea los datos del acelerómetro y realice la inferencia, procedimos a compilar y verificar que el modelo predecía correctamente el gesto realizado en tiempo real. Tras optimizar este proceso, implementamos la última parte del reto: encender los LEDs según las predicciones del modelo, de acuerdo con las condiciones explicadas previamente. Finalmente, se implementó una función para mostrar en el monitor serie los tiempos de procesamiento de la inferencia y los resultados de clasificación:

```cpp
ei_printf("Timing: DSP %d ms, inference %d ms, anomaly %d ms\r\n", result.timing.dsp, result.timing.classification, result.timing.anomaly);
```
Para ver el código completo de la implementación del modelo de TinyML en el Arduino Nano 33 BLE Sense lo puedes consultar [aquí](https://github.com/Magno-Luque/PI1/blob/main/PI1/Entregables/Entregable_3/nano_ble33_sense_accelerometer_continuous.ino).
## **4.  Resultados**

Después de implementarlo completamente, procedemos a comprobar de que si funciona correctamente de acuerdo a las indicación y mediciones plas madas en la implementación. Pa lo cual se realiza la pruba teniendo en cuenta las 3 condiciones señaladas anteriormente.

<p align="center">
  <a href="https://github.com/DenverCoder1/readme-typing-svg">
    <img src="https://readme-typing-svg.herokuapp.com?font=Time+New+Roman&color=000000&size=25&center=true&vCenter=true&width=600&height=100&lines=PRUEBA+DE+LA+FIGURA+CIRCULO">
  </a>
</p>



https://github.com/user-attachments/assets/d2f26939-d96b-4bc8-9734-4d7e1557c1ab




<table>
  <tr>
    <th width="50%"><img src="https://github.com/user-attachments/assets/89a21925-d64d-422d-8031-74bc8c9f0214" width="340" height="500" alt="circulo_o"></th>
    <th width="50%" align="justify" >Durante la prueba, el acelerómetro funcionaba a una frecuencia de muestreo de 119 Hz, lo que significa que capturaba 119 muestras de datos por segundo. Una vez finalizada la prueba, el modelo de inferencia determinó que el movimiento registrado tenía una alta probabilidad de corresponder a un patrón circular, con un 72.65% de confianza. Este porcentaje indica que, entre las clases evaluadas, "círculo" es la más probable. Dado que la predicción para "círculo" es significativamente más alta que para las otras clases ("tres" con un 3.51% y "uno" con un 23.83%), se puede concluir que el modelo ha identificado correctamente el movimiento como un círculo.</th>
  </tr>
</table>




<p align="center">
  <a href="https://github.com/DenverCoder1/readme-typing-svg">
    <img src="https://readme-typing-svg.herokuapp.com?font=Time+New+Roman&color=000000&size=25&center=true&vCenter=true&width=600&height=100&lines=PRUEBA+DEL+NÚMERO+TRES">
  </a>
</p>





https://github.com/user-attachments/assets/b9f35580-654e-4e3d-b8af-5e7997fac476




<table>
  <tr>
    <th width="50%"><img src="https://github.com/user-attachments/assets/5c762379-ece6-4910-b763-3738ba0de97f" width="310" height="500" alt="circulo_o" width="340" height="500" alt="circulo_o"></th>
    <th width="50%" align="justify" >En esta prueba, el modelo ha clasificado el movimiento como "tres" con una confianza del 41.80%, siendo la clase más probable. Sin embargo, la diferencia con la clase "círculo" (37.11%) es relativamente pequeña, lo que indica que el modelo no está completamente seguro y el movimiento podría estar entre ambas clases. Dado que la probabilidad de "tres" es la más alta, se puede asumir que el modelo ha determinado que el movimiento corresponde a esta clase, aunque con una menor certeza general en comparación con el ejemplo anterior.</th>
  </tr>
</table>


<p align="center">
  <a href="https://github.com/DenverCoder1/readme-typing-svg">
    <img src="https://readme-typing-svg.herokuapp.com?font=Time+New+Roman&color=000000&size=25&center=true&vCenter=true&width=600&height=100&lines=PRUEBA+DEL+NÚMERO+UNO">
  </a>
</p>



https://github.com/user-attachments/assets/116e8de5-6cc3-498f-9f6c-56855c298081




<table>
  <tr>
    <th width="50%"><img src="https://github.com/user-attachments/assets/b78d5fe7-01db-42b2-b975-1dc710a315f4" width="340" height="500" alt="circulo_o"></th>
    <th width="50%" align="justify" > Una vez finalizada la prueba, el modelo de inferencia determinó que el movimiento registrado tenía una alta probabilidad de corresspondencia al uno, puesto que brindo una certeza del 65.62%. Lo cual indica que, en comparación a las demas clases que han sido evaluadas, el uno es una predicción más probables, por lo cual se concluye de que el modelo a identificado correctamente el movimiento como un uno.</th>
  </tr>
</table>










## **5. Discusiones**

En este proyecto, hemos explorado la capacidad del Arduino Nano 33 BLE Sense para ejecutar un modelo de TinyML, lo que representa un avance significativo en el campo de la inteligencia artificial aplicada a dispositivos portátiles. La capacidad de predecir con precisión los gestos del usuario sin necesidad de conexión constante a la nube es un gran paso hacia la creación de dispositivos más autónomos y eficientes [5].

Un aspecto notable es la optimización del uso de recursos y energía. Al realizar el procesamiento en el dispositivo, se reduce la latencia y se mejora la experiencia del usuario, lo que es crucial en aplicaciones en tiempo real [6]. Además, esto permite que el dispositivo funcione en entornos donde la conectividad a Internet puede ser intermitente o inexistente, ampliando su aplicabilidad en diversas situaciones [7].

Sin embargo, es importante considerar las limitaciones actuales del modelo. La precisión de la predicción puede verse afectada por factores como la variabilidad en los movimientos del usuario y el ruido ambiental. Por lo tanto, futuras investigaciones deberían centrarse en mejorar la robustez del modelo y en la capacitación con un conjunto de datos más diverso para garantizar un rendimiento óptimo en diferentes condiciones [8].

## **6. Conclusiones**

En este proyecto, hemos demostrado la capacidad del Arduino Nano 33 BLE Sense para ejecutar un modelo de TinyML entrenado mediante Edge Impulse. Esto permite predecir con precisión si los movimientos del dispositivo corresponden a un círculo, el número 3 o el número 1. Esta implementación destaca la capacidad de los sistemas embebidos para realizar tareas complejas de reconocimiento de patrones sin necesidad de estar conectados constantemente a la nube y, al mismo tiempo, optimizar el uso de recursos y energía. Hemos abierto nuevas posibilidades para el desarrollo de aplicaciones inteligentes en dispositivos pequeños y de bajo consumo al combinar el aprendizaje automático con hardware eficiente, como el Arduino Nano 33 BLE Sense, y herramientas como Edge Impulse.

## **7. Referencias**

[1] P. Warden, TinyML: Machine Learning with TensorFlow Lite on Arduino and Ultra-Low-Power Microcontrollers, O'Reilly Media, 2019. [En Línea]. Disponible: [Accedido: Set. 05, 2024].

[2] "Magic Wand Project," YouTube, 2023. [En Línea]. Disponible: https://www.youtube.com/shorts/X7xZlTxPKVk [Accedido: Set. 05, 2024].


[3] Edge Impulse. (n.d.). TinyML on Arduino Nano 33 BLE Sense. Recuperado de [En Línea]. Disponible:https://docs.edgeimpulse.com/docs/edge-ai-hardware/mcu/arduino-nano-33-ble-sense [Accedido: Set. 05, 2024].

[4] Docs Arduino. (n.d) Accessing Accelerometer Data on Nano 33 BLE Sense [En Línea]. Disponible:https://docs.arduino.cc/tutorials/nano-33-ble-sense/imu-accelerometer/ [Accedido: Set. 06, 2024].

[5] A. López, J. Martínez, y R. González, "Aplicaciones de TinyML en dispositivos portátiles," Revista de Tecnología y Ciencia, vol. 15, no. 3, pp. 45-50, 2022.

[6] M. González, "Optimización de recursos en sistemas embebidos," Journal of Embedded Systems, vol. 12, no. 1, pp. 22-30, 2023.

[7] F. Martínez, "Conectividad y su impacto en dispositivos portátiles," Tech Insights, vol. 8, no. 2, pp. 10-15, 2021.

[8] L. Sánchez, "Desafíos en la implementación de modelos de aprendizaje automático," AI Review, vol. 19, no. 4, pp. 67-75, 2023.
