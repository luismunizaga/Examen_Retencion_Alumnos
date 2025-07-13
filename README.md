# Análisis de Retención de Alumnos

Este proyecto analiza los factores que influyen en la retención de alumnos en una institución de educación superior, utilizando técnicas de análisis de datos y modelos de predicción en R. 

##  Dataset

El dataset utilizado proviene de un sistema académico institucional y contiene variables demográficas, académicas y administrativas de los estudiantes. Se utilizaron las siguientes variables para modelar la retención:

| Variable        | Descripción                                |
|-----------------|--------------------------------------------|
| edad            | Edad del estudiante                        |
| genero          | Género del estudiante (Mujer/Hombre)       |
| sede            | Sede universitaria                         |
| facultad        | Facultad académica                         |
| regimen         | Jornada (Diurno/Vespertino)                |
| tipo_de_carrera | Profesional o técnica                      |
| tipo_de_alumno  | Nuevo o antiguo                            |
| rendimiento     | Nivel de rendimiento (Alto/Medio/Bajo)     |
| irregularidad   | Situación académica                        |
| dedicacion      | Jornada completa o parcial                 |
| vigencia        | Si el estudiante sigue activo              |

##  Análisis Exploratorio

### Distribución de Retención

![Distribución Retención](./cfc21f96-7d82-4ace-ad8b-c5aa63787996.png)

Se observa un fuerte desbalance de clases: el 89% de los alumnos están activos (`retención = 1`) y el 11% no (`retención = 0`). Este desbalance afecta la capacidad del modelo para detectar correctamente los casos de deserción.

---

### Distribución de Edad por Retención

![Edad por Retención]()

Los estudiantes entre 18 y 25 años presentan una alta tasa de retención. La deserción es más frecuente en estudiantes mayores de 25 años.

---

### Importancia de Variables (Random Forest)

![Importancia de Variables]()

Según el modelo Random Forest, las variables más importantes para predecir la retención son:

- **Edad**
- **Rendimiento**
- **Tipo de alumno (nuevo)**

---

##  Modelos Implementados

Se implementó la función `predecir_retencion()` que permite usar:

- `logit`: Regresión logística
- `rf`: Random Forest

Ambos modelos logran una precisión del 89% en promedio.

### Matriz de Confusión - Random Forest

```text
          Reference
Prediction    0    1
         0  118   64
         1  930 8385

Precisión: 89.56%
Sensibilidad: 99.24%
Especificidad: 11.26%
```

##  Validación Técnica

- **Pruebas Unitarias** con `testthat`
- **Cobertura de Código**: 100%
- **Benchmarking**:
    - `logit`: ~123 ms
    - `rf`: ~10,400 ms

##  Estructura del Proyecto

- `modelo_retencion.R`: Función principal
- `Reporte SIAE.xlsx`: Dataset
- `analisis.qmd`: Documento Quarto (PDF)
- Imágenes: Visualizaciones clave

##  Conclusiones

- El modelo es preciso para detectar retención, pero tiene dificultades con la deserción debido al desbalance.
- Puede mejorarse con técnicas de balanceo o ajuste de umbral.
- La función `predecir_retencion()` es reutilizable y validada.

---

**Autor:** Luis Munizaga  
**Repositorio GitHub:** [github.com/luismunizaga/Analisis-retencion-alumnos](https://github.com/luismunizaga/Analisis-retencion-alumnos)
