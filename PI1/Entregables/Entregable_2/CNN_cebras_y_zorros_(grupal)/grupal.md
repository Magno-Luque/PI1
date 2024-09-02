<img src="https://github.com/Magno-Luque/PI1/blob/main/PI1/Entregables/Entregable_1/image.png" alt="alt text" width="800">

# Tema:
### Red_neuronal_con_Keras - CNN

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

# **Introducción**

En este trabajo, vamos a desarrollar, entrenar y optimizar un modelo de red neuronal convolucional (CNN) desde cero. Nuestro objetivo es construir un modelo robusto para la clasificación de imágenes, específicamente para distinguir entre imágenes de cebras y zorros. Para ello, utilizaremos un dataset obtenido de Kaggle.

Primero, comenzaremos con la preparación de los datos. Limpiamos y organizamos el dataset en tres conjuntos: entrenamiento, validación y prueba. Esta división es fundamental para poder entrenar el modelo de manera efectiva y evaluar su rendimiento de forma precisa. 

A continuación, diseñaremos la arquitectura de nuestra red neuronal, que se encargará de aprender a reconocer y clasificar las imágenes. Pasaremos luego a entrenar el modelo utilizando los datos de entrenamiento. Durante este proceso, observaremos la capacidad del modelo para hacer predicciones precisas y prestaremos especial atención a cualquier signo de **overfitting**. 

El **overfitting** es un problema común en el entrenamiento de modelos de machine learning, donde el modelo aprende demasiado bien los detalles del conjunto de entrenamiento, pero falla al generalizar cuando se enfrenta a nuevos datos. Para mitigar este problema, aplicaremos técnicas de **data augmentation**. Esta estrategia consiste en ampliar artificialmente el conjunto de datos de entrenamiento mediante diversas transformaciones de las imágenes, como rotaciones, escalados, y otros ajustes. Esto nos ayudará a mejorar la capacidad del modelo para generalizar, lo que se reflejará en un mejor rendimiento en los datos de validación.

Finalmente, implementaremos funciones de visualización que nos permitirán analizar en detalle cómo está funcionando nuestro modelo. Estas visualizaciones nos mostrarán las curvas de aprendizaje, que comparan la precisión y la pérdida entre los conjuntos de entrenamiento y validación. Este análisis es clave para entender cómo podemos seguir mejorando nuestro modelo y asegurarnos de que está funcionando correctamente.

[ENTREGABLE](https://github.com/Magno-Luque/PI1/blob/main/PI1/Entregables/Entregable_2/CNN_cebras_y_zorros_(grupal)/Entregable_2.ipynb)
