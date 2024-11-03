# Estudio de la Ecuación de Schrödinger en Diferentes Pozos de Potencial

## Descripción

Este proyecto consiste en un estudio numérico de la **ecuación de Schrödinger independiente del tiempo** para distintos pozos de potencial. Se utilizan **métodos numéricos basados en diferencias finitas** y **integración numérica** para discretizar la ecuación, permitiendo resolver el problema de autovalores para los niveles de energía y funciones de onda correspondientes. Además, se genera un documento en **LaTeX** que presenta los resultados y análisis del estudio.

## Requisitos

Para compilar y ejecutar este proyecto, asegúrate de tener instalados los siguientes programas:

- **Octave**: Para ejecutar los scripts numéricos.
- **LaTeX** (por ejemplo, **TeX Live** o **MiKTeX**): Para compilar el documento en PDF.
- **Make**: Para utilizar el `Makefile` que automatiza las tareas de compilación.

En cualquier caso también se debe poder ejecutar correctamente en Matlab.

El proyecto utiliza un `Makefile` para automatizar la ejecución de scripts de Octave y la compilación del documento LaTeX. A continuación, se detallan las diferentes opciones disponibles:

### Compilar Todo

make

### Representar un potencial concreto

make run_potential
