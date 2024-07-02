# Proyecto de Automatización de Formulario Web
## Descripción
Este proyecto automatiza el proceso de llenado de un formulario web utilizando datos de un archivo Excel. La estructura del proyecto está organizada en diferentes módulos para facilitar su mantenimiento y escalabilidad.

## Estructura del Proyecto
### Settings/
**settings.xlsx:** Define las columnas que se utilizarán para llenar el formulario web.
### Sources/
**Test.xlsx:** Archivo Excel que contiene la información a leer y procesar. Se puede cambiar de nombre o de estructura, lo importante es que esté en xlsx
### Scripts/
**settings_.py:** Lee las configuraciones definidas en settings.py y exporta las condiciones como un DataFrame.
**file_reader.py:** Lee el archivo Excel Test.xlsx y extrae las columnas según las configuraciones definidas, retornando la información en un DataFrame.
**web_side.py:** Toma el DataFrame y comienza a llenar el formulario web fila por fila.
**main.py:** Actúa como una tubería (pipeline) que orquesta la ejecución de los otros scripts.

## Instrucciones de Uso
#### Configuración Inicial:

Define las columnas que deseas utilizar para llenar el formulario en Settings/settings.xlsx.
Coloca tu archivo Excel con los datos en la carpeta Sources.

## Ejecución del Proyecto:

Ejecuta main.py para iniciar el proceso de automatización. Este archivo coordinará la ejecución de los scripts necesarios en el orden correcto.

## Funcionalidades de los Scripts
**Settings/settings.py:** Establece las columnas que se utilizarán para el llenado del formulario web.
**Scripts/settings_.py:** Lee las configuraciones y las exporta como un DataFrame.
**Scripts/file_reader.py:** Lee el archivo Excel y extrae las columnas necesarias según las configuraciones definidas.
**Scripts/web_side.py:** Toma el DataFrame y llena el formulario web fila por fila.
**main.py: Orquesta la ejecución de los scripts anteriores para completar el proceso de automatización.

## Requisitos
Python 3.x
