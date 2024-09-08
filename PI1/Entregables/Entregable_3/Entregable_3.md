<div style="position: relative; height: 100px;">
    <a href="https://www.cayetano.edu.pe/" style="position: absolute; top: 0; right: 0;">
        <img src="https://img.shields.io/badge/UPCH-%20-101010?style=for-the-badge&logo=universities&logoColor=white&labelColor=FFD700" alt="UPCH Badge">
    </a>
</div>




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

La placa Arduino Nano 33 BLE Sense, que permite aplicar inteligencia artificial, nos permitió capturar muestras de movimientos (posiciones en los ejes x, y, z) correspondientes a las clases círculo, uno y tres utilizando la plataforma Edge Impulse. Este sitio ofrece herramientas para recolectar datos, diseñar modelos y desplegarlos.

A continuación, se puede evidenciar lo mencionado:

![image](https://github.com/user-attachments/assets/253828d6-ea4a-472e-b318-6a4f4cb7f7c6)
![image-1](https://github.com/user-attachments/assets/3514173a-4f52-4208-8b32-da9c4a096ef7)

Se tomaron un total de 100 muestras para cada clase, las cuales se dividieron en un 80% y un 20% entre datos de entrenamiento y prueba, respectivamente, como se muestra a continuación:

![image](https://github.com/user-attachments/assets/295a4821-ab9f-4d32-b0f5-8c51157b6f6d)

**2.2 Diseño de impulso**

Para la creación del impulso en la plataforma Edge Impulse, como se observa en la imagen, los datos de series de tiempo consistieron en los ejes de entrada obtenidas por los sensores del Arduino Nano 33 BLE Sense como un acelerómetro, un giroscopio y un magnetómetro (accX, accY, accZ, gyrX, gyrY, gyrZ, magX, magY y magZ); se utilizó un tamaño de ventana de 3 segundos para procesar los datos, y lo demás se dejó por defecto. En el análisis espectral se verifica el bloque de procesamiento de los ejes de entrada. A continuación, tenemos el bloque de aprendizaje, que en este caso es de clasificación, tomando como entrada las características espectrales y como salida las tres clases (círculo, tres, uno). Por último, se mencionan las características de salida que corresponden a estas tres clases.

![image-2](https://github.com/user-attachments/assets/65546862-c414-46ed-98e8-abe1bff814ce)

**2.3 Características espectrales**

Con respecto a este punto, se dejó la configuración de los parámetros por defecto. Por otro lado, al generar características, se tomó un total de 161 ms en tiempo de procesamiento y un uso máximo de RAM de 12 KB, quedando de la siguiente manera:

![image-3](https://github.com/user-attachments/assets/13736379-e394-43e6-8453-169251b0fff2)

**2.4 Clasificación y entrenamiento**

En la configuración de la red neuronal, dejamos el número de ciclos de entrenamiento en 30, la tasa de aprendizaje en 0.001, y separamos un 20% de los datos para la validación. La arquitectura de la red neuronal quedó de la siguiente manera:

![image-4](https://github.com/user-attachments/assets/ced1d9a1-619e-4841-b4f4-c22e92686c98)

Pasamos al entrenamiento de nuestro modelo y obtuvimos un 98% de exactitud y una pérdida de 0.05 en general, lo que evidencia que se trata de un modelo eficiente:

![image-5](https://github.com/user-attachments/assets/21054fe4-626b-41c7-8e6f-ff65958f1692)

En la exploración de los datos, vistos gráficamente, queda así:

![image-6](https://github.com/user-attachments/assets/90355a0a-b759-4744-926c-0c8f9a22de74)

De esta manera, podemos observar que la predicción de nuestro modelo puede ser imprecisa, pero en menor medida en comparación con la predicción correcta.

**2.5 Despliegue**

Ya entrenado el modelo ajustado a nuestro problema, se configuró el formato del modelo como librería de Arduino para que así se programe el Arduno Nano 33 BLE Sense. 

![image-7](https://github.com/user-attachments/assets/c49a1e48-d60d-44fc-9e90-fbac82d0534d)


## **3. Implementación del modelo**

## **4.  Resultados**

## **5. Conclusiones**

En este proyecto, hemos demostrado la capacidad del Arduino Nano 33 BLE Sense para ejecutar un modelo de TinyML entrenado mediante Edge Impulse. Esto permite predecir con precisión si los movimientos del dispositivo corresponden a un círculo, el número 3 o el número 1. Esta implementación destaca la capacidad de los sistemas embebidos para realizar tareas complejas de reconocimiento de patrones sin necesidad de estar conectados constantemente a la nube y, al mismo tiempo, optimizar el uso de recursos y energía. Hemos abierto nuevas posibilidades para el desarrollo de aplicaciones inteligentes en dispositivos pequeños y de bajo consumo al combinar el aprendizaje automático con hardware eficiente, como el Arduino Nano 33 BLE Sense, y herramientas como Edge Impulse.

## **6. Referencias**

[1] P. Warden, TinyML: Machine Learning with TensorFlow Lite on Arduino and Ultra-Low-Power Microcontrollers, O'Reilly Media, 2019.

[2] "Magic Wand Project," YouTube, 2023. [Enlace: https://www.youtube.com/shorts/X7xZlTxPKVk].

[3] Edge Impulse. (n.d.). TinyML on Arduino Nano 33 BLE Sense. Recuperado de [Enlace: https://docs.edgeimpulse.com/docs/edge-ai-hardware/mcu/arduino-nano-33-ble-sense]

