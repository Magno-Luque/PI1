![alt text](image.png)

# Tema:
### Regresión en aprendizaje automático para predecir la concentración de ozono en el Condado de Baldwin, Alabama, EE.UU., basada en registros de 2022-2023

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

La calidad del aire se ha convertido en un tema de creciente preocupación a nivel global, especialmente en entornos urbanos donde la contaminación puede tener efectos adversos significativos en la salud pública y el medio ambiente. Entre los contaminantes atmosféricos, la concentración de ozono troposférico se destaca como un elemento crítico, ya que niveles elevados de este gas pueden provocar problemas respiratorios y contribuir a enfermedades cardiovasculares. Este informe se centra en el análisis de los niveles de ozono en el Condado de Baldwin, Alabama, durante los años 2022 y 2023, con el objetivo de predecir su comportamiento en los meses siguientes.

Para llevar a cabo esta predicción, se emplea la regresión lineal, una técnica de machine learning que permite modelar la relación entre variables y realizar inferencias sobre datos futuros. La regresión lineal es un método estadístico que busca establecer una relación lineal entre una variable dependiente y una o más variables independientes, facilitando la comprensión de cómo diferentes factores pueden influir en la calidad del aire.

El informe se estructura en varias secciones: comienza con la metodología utilizada para el análisis, seguido de los resultados obtenidos, y concluye con una discusión de los hallazgos y recomendaciones.

## **2. Metodología**

Nuestro modelo predictivo se basa en la implementación de técnicas de series temporales, que se incluirá el siguiente enfoque:  Retardos como regresores de un modelo (Alonso Rodriguez, 2021). Es importante señalar que, para llevar a cabo la predicción de un modelo, es necesario que los datos de entrenamiento estén bien preparados, para así aplicar estas técnicas de manera adecuada y capturar patrones en los datos temporales.

Las etapas se basaron en los siguientes:

### 2.1 Obtención de los datos:
En esta etapa se obtuvieron los DataFrames de la base de datos de la Agencia de Protección Ambiental de Estados Unidos (EPA), específicamente, información de la calidad de aire de los años 2022 y 2023 en el Condado de Baldwin, Alabama, EE. UU. En esta, se registraron datos diarios correspondiente al estado del aire exterior para el Ozono como contaminante. 
### 2.2 Preparación de los datos:
En esta etapa, se observó que la información de los valores únicos de cada columna, podemos notar que hay valores que se repiten, ya sea del tipo objeto, entero o flotante, y por ende procedemos a eliminar las columnas que no aportan  información valiosa para nuestro modelo. En la siguiente imagen podemos visualizar las características que  no son de valor único.


## **3. Resultados**

## **4. Discusión [opcional]**

## **5. Referencias [en IEEE]**

- [1] I. Lee, “Series de Tiempo: Forecasting con XGBoost,” Medium, Apr. 10, 2023. [En Línea] . Disponible:  https://ivan-lee.medium.com/series-de-tiempo-con-xgboost-f732f1da3056.  [Accedido: Ago. 25, 2024].

- [2]R. Holbrook, "Time Series," Kaggle. [En línea]. Disponible: https://www.kaggle.com/learn/time-series.  [Accedido: Ago. 25, 2024].

- [3] Alabama Department of Environmental Management, "2023 Annual Ambient Air Quality Monitoring Plan," Jul. 26, 2023. [En línea]. Disponible: https://adem.alabama.gov/programs/air/airquality/2023AmbientAirPlan.pdf. [Accedido: Ago. 25, 2024].

- [4] Alabama Department of Environmental Management, "2022 Ambient Air Monitoring Network Plan," Jul. 01, 2022. [En línea]. Disponible: https://adem.alabama.gov/programs/air/airquality/2022AmbientAirPlan.pdf. [Accedido: Ago. 25, 2024].

- [5] A. Ospina Montoya y M. A. Garrido Tamayo, "Técnicas de medición de ozono: Métodos tradicionales frente al método de cámara de absorción con led ultravioleta como fuente de luz," Gestión y Ambiente, vol. 16, no. 2, pp. 95-104, ago. 2013. Disponible en: https://www.redalyc.org/articulo.oa?id=16942824020008. [Accedido: Ago. 25, 2024].
 
- [6] A. Alonso-Rodriguez, «La predicción de series temporales mediante el modelo de regresión», AJEE, n.º 54, pp. 261–280, mar. 2021.

