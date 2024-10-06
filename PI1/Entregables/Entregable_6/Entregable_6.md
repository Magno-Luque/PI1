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
### Ssimulación de esfuerzos mecánicos (Estáticos)

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

En la ingeniería contemporánea, la simulación y el análisis estructural son herramientas esenciales para optimizar diseños antes de su fabricación física. SimScale se ha destacado en este campo al ofrecer una plataforma de simulación basada en la nube que permite a los ingenieros realizar análisis complejos sin necesidad de infraestructura local avanzada. Según Murad [1], esta accesibilidad no solo reduce los costos iniciales, sino que también facilita la colaboración multidisciplinaria, permitiendo a los equipos trabajar de manera eficiente desde cualquier ubicación.

El Análisis de Elementos Finitos (FEA) es una técnica fundamental para evaluar la integridad y el comportamiento de estructuras sometidas a diversas cargas. Xu y Neumann [2] demostraron que el uso de modelos paramétricos basados en nubes de puntos 3D mejora significativamente la precisión del FEA, proporcionando una representación más exacta de la geometría y, por ende, resultados más fiables en términos de deformaciones y tensiones.

Además, la optimización estructural es crucial para diseñar estructuras eficientes y seguras. Rostami et al. [3] introdujeron un método evolucionario estructural extendido (XFEM) que, combinado con el análisis de incertidumbres en materiales y cargas, permite una optimización robusta bajo condiciones variables. Este enfoque asegura que los diseños no solo sean eficientes, sino también resilientes frente a posibles variaciones en su entorno operativo.

En este proyecto, se utilizó SimScale para realizar un análisis estructural estático de un objeto diseñado para ser insertado en el suelo bajo una carga axial. El objetivo principal es evaluar la resistencia del modelo, asegurando que los materiales seleccionados, como el Magnesio y la Poliamida (PA), puedan soportar las cargas aplicadas sin fallos estructurales. La combinación de las capacidades avanzadas de SimScale y las metodologías de FEA y optimización estructural mencionadas proporciona una base sólida para validar la viabilidad y durabilidad del diseño propuesto.

## **2. Metodología**
Para llevar a cabo el análisis estructural del objeto diseñado para ser insertado en el suelo, se utilizó la plataforma de simulación basada en la nube SimScale. La metodología seguida se divide en varias etapas clave que abarcan desde la definición de la geometría hasta la ejecución de la simulación. A continuación, se detallan los pasos realizados:

### 2.1. Geometría y Contactos
![](https://github.com/user-attachments/assets/bb823a70-86be-4cfb-9d9d-f99e0bb0242f)

Primero, se importó el modelo 3D del objeto en **SimScale**. El objeto consiste en un tubo con una punta diseñada para la inserción en el suelo. Se establecieron los contactos entre las diferentes partes del objeto utilizando el tipo de **conexión Bonded**, lo que garantiza que las partes interactúen como un único cuerpo durante la simulación. Este tipo de conexión es crucial para asegurar que no haya deslizamientos o separaciones entre la punta y el cuerpo principal durante la aplicación de la carga.

![](https://github.com/user-attachments/assets/66d8705a-5a2b-43d9-a31c-f4897d865ae4)
![](https://github.com/user-attachments/assets/a1ebe3a1-a006-428e-aba2-6c4ad62009fd)

### 2.2. Asignación de Materiales
Se asignaron los materiales seleccionados a las respectivas partes del modelo:

**Punta de Magnesio (Magnesium):** 

+ Densidad: 1.74 g/cm³.

+ Resistencia a la tracción: Aproximadamente 130-250 MPa.

+ Dureza: 40-100 HB (Brinell hardness).

+ Conductividad térmica: 156 W/mK.

+ Resistencia a la corrosión: Susceptible a la corrosión, pero mejorable mediante tratamientos superficiales como el anodizado.

El magnesio fue elegido para la punta del objeto debido a su baja densidad, lo que reduce el esfuerzo necesario para insertarlo en el suelo sin añadir peso excesivo al diseño. Además, su alta resistencia a la tracción garantiza que la punta pueda soportar fuerzas de inserción repetidas sin deformarse. Para mitigar su susceptibilidad a la corrosión en ambientes húmedos, se aplicaron tratamientos superficiales como el anodizado, mejorando así su durabilidad y asegurando una mayor vida útil del objeto.

![](https://github.com/user-attachments/assets/7da976e5-20d1-439e-9180-e17c0c2cb7a9)


**Cuerpo Medio de Poliamida (PA):** 

+ Densidad: 1.14 g/cm³.

+ Resistencia a la tracción: 75-90 MPa.

+ Dureza: 80-90 Shore D.

+ Absorción de agua: 2.5-5%.
  
+ Resistencia al desgaste: Muy alta, resistente a la fricción y desgaste.
  
+ Flexibilidad: Distribuye tensiones evitando concentraciones de esfuerzo.

La poliamida (PA) fue seleccionada para el cuerpo principal del objeto por su excelente resistencia al desgaste y alta durabilidad en contacto repetido con el suelo. Su flexibilidad permite una distribución uniforme de las tensiones aplicadas durante la inserción, evitando concentraciones de esfuerzo que podrían causar deformaciones. Aunque PA absorbe algo de agua, su resistencia mecánica la hace adecuada para ambientes agrícolas donde la humedad puede ser un factor, asegurando así la integridad estructural del objeto a lo largo del tiempo.

![](https://github.com/user-attachments/assets/7330e7e1-d550-4902-be6f-77721d73712d)


Las propiedades mecánicas de cada material, como el módulo de Young, el coeficiente de Poisson y la densidad, fueron configuradas en SimScale para reflejar sus comportamientos reales bajo cargas.

### 2.3. Condiciones de Frontera
Para simular las condiciones reales de uso del objeto, se establecieron las siguientes condiciones de frontera:

**Soporte fijo en la parte superior:** La parte superior del objeto fue fijada completamente, simulando la restricción al ser presionada hacia el suelo. Esto impide cualquier desplazamiento o rotación en esa área durante la simulación. Se optó por **Fixed Support** ya que esta configuración refleja con precisión cómo el objeto estaría firmemente sujeto en una aplicación real, asegurando que las cargas se transfieran de manera adecuada a través de la estructura

![](https://github.com/user-attachments/assets/57c539f5-bf04-4a15-b62a-c63356eea7ec)

**Aplicación de fuerza axial:** Se aplicó una fuerza de **300 N** en la punta del objeto en la dirección del eje Z, representando la carga axial durante la inserción en el suelo. Esta fuerza fue seleccionada como un valor razonable para simular la carga de inserción manual en suelos agrícolas, asegurando que no se excedan los límites de los materiales utilizados.

![](https://github.com/user-attachments/assets/12a08614-30ed-4447-a7ab-42481cade547)

### 2.4. Configuración de la Malla
El mallado es un paso fundamental para garantizar la precisión de los resultados del análisis. Se configuró una malla con un **nivel de refinamiento (fineness) de 6.6**, lo que representa un nivel de refinamiento medio-fino. Este ajuste permite capturar los detalles geométricos y las variaciones en las tensiones sin incrementar excesivamente el tiempo de cómputo.

![](https://github.com/user-attachments/assets/dcc10603-520d-4f71-8b9f-1fcf872767bc)


Se utilizó un **refinamiento local** en las áreas críticas, como la punta del objeto y la transición entre materiales, para mejorar la calidad de la malla y reducir la relación de aspecto de los elementos tetraédricos en estas zonas.

![](https://github.com/user-attachments/assets/ab842942-7046-4d5a-85c6-6da5f26bcfcf)

### 2.5. Ejecución de la Simulación
Con la configuración de materiales, condiciones de frontera y malla establecidas, se procedió a ejecutar la simulación. El análisis se configuró para ser un análisis estático de compresión, donde se aplicó una fuerza de 300 N en la punta del objeto. La simulación se ejecutó en un tiempo total de **6 minutos**, tiempo en el cual SimScale procesó los cálculos necesarios para determinar las tensiones y desplazamientos en el modelo.

![](https://github.com/user-attachments/assets/60e1462a-0f29-4c2c-939f-75ab6b0807e3)

Durante la configuración, se aseguró que la malla fuera lo suficientemente densa en las áreas de mayor interés para capturar con precisión las tensiones y deformaciones. Además, se verificaron las propiedades de los materiales para garantizar que reflejaran adecuadamente sus comportamientos reales bajo cargas aplicadas.

## **3. Resultados**

![](https://github.com/user-attachments/assets/68a2d4ee-7368-4844-8c87-1e87a93b0ead)
En la simulación de esfuerzos de **Von Mises**, los resultados muestran una concentración significativa de tensiones en la punta del objeto, fabricada con magnesio, lo que es esperado dado su rol principal de inserción en el suelo. Aunque los esfuerzos son elevados en esta zona, permanecen dentro de los límites elásticos del material, lo que sugiere que el magnesio puede soportar la carga aplicada sin deformación permanente. En cuanto al cuerpo de poliamida (PA), las tensiones se distribuyen de manera uniforme y son considerablemente menores, lo que confirma su capacidad para absorber y disipar las tensiones sin provocar puntos críticos de fallo. Bajo una fuerza de 300N, ambos materiales cumplen con los requisitos de resistencia y durabilidad, validando su idoneidad para el uso en condiciones reales.

![](https://github.com/user-attachments/assets/e2abe0c1-ae08-4a26-bca3-b654995a3bef)
El análisis del **esfuerzo de Cauchy** en la dirección SIZZ revela una distribución de tensiones que se mantiene en un rango seguro, con predominancia de valores medios, lo que sugiere que el diseño maneja adecuadamente la carga axial. Tanto la punta de magnesio como el cuerpo de poliamida (PA) soportan la fuerza sin que se observen concentraciones críticas de tensiones que puedan comprometer la estructura. Esto refuerza la conclusión de que el diseño está bien optimizado para soportar esfuerzos axiales de inserción, asegurando la funcionalidad bajo las condiciones aplicadas.

![](https://github.com/user-attachments/assets/1f87a9d5-22cc-4f33-9c58-52c2b2dd3d93)
Finalmente, en el análisis de **desplazamiento en la dirección Z**, se detecta un desplazamiento progresivo hacia la punta, con mayor movimiento en esa zona, lo que es coherente con el tipo de fuerza aplicada. El desplazamiento es moderado y dentro de los límites previstos, lo que confirma que el diseño mantiene su estabilidad estructural general. Las zonas superiores muestran desplazamientos mínimos, lo que indica que el objeto absorbe la carga de manera eficiente y que la funcionalidad del diseño no se ve comprometida.

## **4. Discusión**

El análisis de los resultados obtenidos a partir de las simulaciones realizadas con SimScale revela información crucial sobre el comportamiento estructural del objeto diseñado. En primer lugar, la concentración de esfuerzos de Von Mises en la punta de magnesio confirma que este material es apropiado para la función de inserción, dado que su alta resistencia a la tracción permite soportar las cargas aplicadas sin riesgo de deformación permanente. Esto valida la elección del magnesio, no solo por su ligereza, sino también por su capacidad para resistir los esfuerzos asociados con el contacto directo con el suelo. En contraste, la distribución uniforme de tensiones en el cuerpo de poliamida (PA) demuestra su efectividad en la absorción de esfuerzos, lo que minimiza la posibilidad de fallos estructurales.

Adicionalmente, el análisis del esfuerzo de Cauchy en la dirección SIZZ indica que el diseño es capaz de manejar adecuadamente la carga axial. La ausencia de concentraciones críticas en ambas partes del objeto sugiere que el diseño ha sido optimizado para soportar las tensiones esperadas en condiciones reales de uso. Estos resultados son alentadores, ya que refuerzan la resiliencia del diseño y la funcionalidad del objeto bajo las condiciones de inserción.

El análisis de desplazamiento en la dirección Z proporciona información valiosa sobre la estabilidad del modelo. La progresión del desplazamiento hacia la punta, sin alcanzar valores excesivos, confirma que el objeto mantiene su integridad estructural. La combinación de materiales seleccionados no solo asegura un comportamiento adecuado bajo carga, sino que también es respetuosa con el medio ambiente, alineándose con las tendencias actuales en diseño sostenible.

### **4.1. Limitaciones**
Aunque el análisis realizado proporciona una comprensión sólida del comportamiento estructural del objeto, existen ciertas limitaciones que deben considerarse:

Al principio, intentamos realizar una simulación de un modelo más completo, como se muestra en las siguientes imagenes:

| Evidencia 1 | Evidencia 2 |
|---|---|
| <img src="https://github.com/user-attachments/assets/f9b106fc-e709-4381-81ff-2127c0b2a7e6" width="900"/> | <img src="https://github.com/user-attachments/assets/3a35ae49-f5b6-4aa7-91dc-35a9dad82340" width="900"/> |
| Evidencia 3 | Evidencia 4 |
| <img src="https://github.com/user-attachments/assets/e9440de7-46e3-4c9a-8c1d-59f643288f55" width="900"/> | <img src="https://github.com/user-attachments/assets/2d4b2284-bdc6-4275-9b8a-9f363402d350" width="900"/> |
| Evidencia 5 | Evidencia 6 |
| <img src="https://github.com/user-attachments/assets/7f506a71-b6a1-4e2f-9ea8-adc696d23e33" width="900"/> | <img src="https://github.com/user-attachments/assets/31bb5b65-f799-4005-939f-6880d7d07fba" width="900"/> |
| Evidencia 7 | Evidencia 8 |
| <img src="https://github.com/user-attachments/assets/3df951c1-1ef0-461b-b540-42757999fe5a" width="900"/> | <img src="https://github.com/user-attachments/assets/5f39fede-e283-44f0-8b0b-05b3b89730e1" width="900"/> |
| Evidencia 9 | Evidencia 10 |
| <img src="https://github.com/user-attachments/assets/fae505c2-fe24-4bbf-95fb-ca06f3e60d05" width="900"/> | <img src="https://github.com/user-attachments/assets/da8a078b-536c-4870-a4ae-74e0767f0cd9" width="900"/> |
| Evidencia 11 | Evidencia 12 |
| <img src="https://github.com/user-attachments/assets/a92124bb-b6dd-4fde-8c1a-ab9d726316d9" width="900"/> | <img src="https://github.com/user-attachments/assets/b45b05ee-4b3a-465e-b5b0-8a08f8884e76" width="900"/> |



![](https://github.com/user-attachments/assets/72c830f4-f09d-4da6-a199-d9ed6de07908)

En esta última imagen, se puede observar la cancelación de la simulación al 0%. El error que aparece en rojo indica que la máquina se quedó sin memoria durante la ejecución, lo que provocó una interrupción en el proceso. Aunque la simulación fue preparada correctamente y la malla se generó sin problemas (con 259,791 nodos), la instancia utilizada no pudo manejar el cálculo necesario para el modelo más complejo. Esto limitó nuestra capacidad de realizar el análisis inicial en una simulación más detallada, lo que nos obligó a optar por una versión simplificada del modelo.

![](https://github.com/user-attachments/assets/7448fefb-cf97-46ed-8b77-a176601ab5ea)

El problema mencionado anteriormente no solo ocurrió una vez, sino que se repitió en varias ocasiones. Aquí, el error específico señalado es que la matriz de la solución no se puede factorizar. Este tipo de error generalmente se asocia con un movimiento rígido no restringido, grados de libertad sobreconstriñidos o una mala calidad de malla. A pesar de realizar ajustes en los grados de libertad y en la calidad de la malla, el error persistió, lo que nos llevó a realizar cambios en el diseño del modelo y simplificar las condiciones de frontera para poder avanzar en el análisis.

![](https://github.com/user-attachments/assets/6a080448-f631-4f0b-a50e-a5c7214008b8)

Finalmente, al reducir el modelo a solo dos piezas, logramos realizar la simulación, pero nos encontramos con una limitación importante: el uso restringido de herramientas avanzadas de análisis, como el "inspection point". Esta herramienta es crucial para obtener valores detallados de puntos específicos en el modelo, como los valores de MPa en áreas críticas. Al no poder utilizar esta funcionalidad, la precisión de los resultados y la profundidad del análisis se vieron afectadas. En consecuencia, no fue posible discutir con mayor precisión los datos importantes, como las tensiones localizadas o los puntos de deformación máxima.

Estas limitaciones no solo afectaron el desarrollo del análisis, sino que también influyeron en la precisión y el alcance de las conclusiones. Aunque los resultados obtenidos son válidos, una mayor capacidad computacional y la posibilidad de utilizar herramientas avanzadas de inspección habrían permitido una evaluación más detallada y precisa del comportamiento estructural del objeto.

## **5. Conclusión**

El análisis estructural realizado utilizando SimScale ha permitido validar el diseño de un objeto destinado a ser insertado en el suelo bajo cargas axiales. Los materiales seleccionados, magnesio para la punta y poliamida (PA) para el cuerpo, han demostrado ser adecuados para soportar las tensiones y deformaciones generadas durante la simulación. El magnesio, gracias a su alta resistencia a la tracción y su ligereza, soporta las cargas de inserción sin deformación permanente, mientras que la poliamida ofrece flexibilidad y resistencia al desgaste, distribuyendo de manera eficiente las tensiones a lo largo del cuerpo del objeto.

El análisis de tensiones de Von Mises y el esfuerzo de Cauchy indicaron que ambos materiales cumplen con los límites de elasticidad y no presentan concentraciones críticas de tensiones que pudieran comprometer la integridad estructural. Asimismo, el análisis de desplazamientos mostró que la estabilidad del diseño se mantiene dentro de los límites esperados, con deformaciones controladas que no afectan su funcionalidad.

Sin embargo, las limitaciones encontradas en el proceso, como la imposibilidad de ejecutar la simulación con un modelo más complejo debido a restricciones computacionales y el uso limitado de herramientas avanzadas como el "inspection point", redujeron la precisión en algunos aspectos del análisis. Estas limitaciones destacan la necesidad de contar con mayor capacidad computacional y acceso a herramientas más robustas para futuros estudios y mejoras en el diseño.

En resumen, el diseño propuesto es viable y adecuado para su uso en aplicaciones agrícolas, logrando cumplir con los requisitos de resistencia y durabilidad bajo las condiciones simuladas. No obstante, sería recomendable continuar con investigaciones adicionales que incluyan pruebas experimentales y simulaciones más detalladas para optimizar aún más el diseño y obtener resultados más precisos.

## **6. Referencias**

[1] Murad, J. (2021). Harnessing the Power of the Cloud - Computational Fluid Dynamics With SimScale. Volume 1: Aerospace Engineering Division Joint Track; Computational Fluid Dynamics.  [Online]. Disponible: https://doi.org/10.1115/fedsm2021-66406. [Accedido: 06-Oct-2024].

[2] Xu, W., & Neumann, I. (2020). Finite Element Analysis based on A Parametric Model by Approximating Point Clouds. Remote. Sens., 12, 518. [Online]. Disponible: https://doi.org/10.3390/rs12030518. [Accedido: 06-Oct-2024].

[3] Rostami, S., Kolahdooz, A., & Zhang, J. (2021). Robust topology optimization under material and loading uncertainties using an evolutionary structural extended finite element method. Engineering Analysis with Boundary Elements. [Online]. Disponible: https://doi.org/10.1016/j.enganabound.2021.08.023. [Accedido: 06-Oct-2024].
