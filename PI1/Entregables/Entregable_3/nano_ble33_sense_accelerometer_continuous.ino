#include <Wire.h>
#include <Arduino_LSM9DS1.h>
#include <entregable_inferencing.h>  // Cambiado el encabezado

// Define el tamaño de la ventana de características
#define FEATURE_SIZE 100 // Ajusta según el tamaño necesario

// Pines para controlar el LED RGB integrado
#define LED_RED_PIN   (22)  // R
#define LED_GREEN_PIN (23)  // G
#define LED_BLUE_PIN  (24)  // B

// Array para almacenar las características
static float features[FEATURE_SIZE * 3];

// Array para almacenar x, y, z
static int feature_index = 0;

// Variables para los datos del acelerómetro
float x, y, z;

/**
 * @brief Copia los datos de características crudos en out_ptr
 * Función llamada por la biblioteca de inferencia
 *
 * @param[in] offset El desplazamiento
 * @param[in] length La longitud
 * @param out_ptr El puntero de salida
 *
 * @return 0
 */
int raw_feature_get_data(size_t offset, size_t length, float *out_ptr) {
    memcpy(out_ptr, features + offset, length * sizeof(float));
    return 0;
}

/**
 * @brief Función de configuración de Arduino
 */
void setup() {
    Serial.begin(115200);
    while (!Serial);

    Serial.println("Edge Impulse Inferencing Demo");

    // Inicializa el acelerómetro
    if (!IMU.begin()) {
        Serial.println("Failed to initialize IMU!");
        while (1);
    }

    Serial.print("Accelerometer sample rate = ");
    Serial.print(IMU.accelerationSampleRate());
    Serial.println("Hz");

    // Configuración de los pines de los LEDs
    pinMode(LED_RED_PIN, OUTPUT);
    pinMode(LED_GREEN_PIN, OUTPUT);
    pinMode(LED_BLUE_PIN, OUTPUT);

    // Asegúrate de que todos los LEDs estén apagados al inicio
    digitalWrite(LED_RED_PIN, LOW);
    digitalWrite(LED_GREEN_PIN, LOW);
    digitalWrite(LED_BLUE_PIN, LOW);
}

/**
 * @brief Función principal de Arduino
 */
void loop() {
    // Verifica si están disponibles los datos de aceleración
    if (IMU.accelerationAvailable()) {
        IMU.readAcceleration(x, y, z);

        // Almacena los datos en el array de características
        if (feature_index < FEATURE_SIZE * 3) {
            features[feature_index++] = x;
            features[feature_index++] = y;
            features[feature_index++] = z;
        }

        // Verifica si se ha llenado el array de características
        if (feature_index >= FEATURE_SIZE * 3) {
            feature_index = 0; // Restablece el índice para la próxima serie de datos

            ei_impulse_result_t result = { 0 };  // El array de características está almacenado en la memoria flash
            signal_t features_signal;
            features_signal.total_length = sizeof(features) / sizeof(features[0]);
            features_signal.get_data = &raw_feature_get_data;

            // Ejecuta el clasificador
            EI_IMPULSE_ERROR res = run_classifier(&features_signal, &result, false /* debug */);

            if (res != EI_IMPULSE_OK) {
                ei_printf("ERR: Failed to run classifier (%d)\n", res);
                return;
            }

            ei_printf("run_classifier returned: %d\r\n", res);
            print_inference_result(result);

            // Apaga todos los LEDs antes de encender el correspondiente
            digitalWrite(LED_RED_PIN, LOW);
            digitalWrite(LED_GREEN_PIN, LOW);
            digitalWrite(LED_BLUE_PIN, LOW);

            // Dependiendo del resultado de la inferencia, encender el LED correspondiente
            for (uint16_t i = 0; i < EI_CLASSIFIER_LABEL_COUNT; i++) {
                if (strcmp(ei_classifier_inferencing_categories[i], "circle") == 0 && result.classification[i].value > 0.8) {
                    digitalWrite(LED_RED_PIN, HIGH);  // Enciende LED rojo para círculo
                }
                else if (strcmp(ei_classifier_inferencing_categories[i], "three") == 0 && result.classification[i].value > 0.8) {
                    digitalWrite(LED_BLUE_PIN, HIGH);  // Enciende LED azul para número 3
                }
                else if (strcmp(ei_classifier_inferencing_categories[i], "one") == 0 && result.classification[i].value > 0.8) {
                    digitalWrite(LED_GREEN_PIN, HIGH);  // Enciende LED verde para número 1
                }
            }

            delay(1000);  // Ajusta el retraso según sea necesario
        }
    }
    delay(100);  // Ajusta el retraso para el ciclo principal según sea necesario
}

/**
 * @brief Imprime los resultados de la inferencia
 */
void print_inference_result(ei_impulse_result_t result) {
    // Imprime cuánto tiempo se tardó en realizar la inferencia
    ei_printf("Timing: DSP %d ms, inference %d ms, anomaly %d ms\r\n", result.timing.dsp, result.timing.classification, result.timing.anomaly);

    // Imprime los resultados de la predicción (clasificación)
    ei_printf("Predictions:\r\n");
    for (uint16_t i = 0; i < EI_CLASSIFIER_LABEL_COUNT; i++) {
        ei_printf("  %s: ", ei_classifier_inferencing_categories[i]);
        ei_printf("%.5f\r\n", result.classification[i].value);
    }

    // Imprime el resultado de anomalía (si existe)
#if EI_CLASSIFIER_HAS_ANOMALY
    ei_printf("Anomaly prediction: %.3f\r\n", result.anomaly);
#endif
}
