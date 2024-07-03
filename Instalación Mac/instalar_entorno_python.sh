#!/bin/bash

# Cambiar al directorio donde se encuentra el entorno virtual y el script
cd "/Users/andre/OneDrive/Escritorio/UPWork/Nico" || {
    echo "Error: No se pudo cambiar al directorio /Users/andre/OneDrive/Escritorio/UPWork/Nico."
    exit 1
}

# Verifica si Python está instalado
if ! command -v python &> /dev/null
then
    echo "Python no está instalado. Por favor, instala Python antes de continuar."
    exit 1
fi

# Crear el entorno virtual
if [ -d "venv" ]; then
    echo "El ambiente virtual ya existe."
else
    python -m venv venv
    if [ $? -ne 0 ]; then
        echo "Error al crear el entorno virtual."
        exit 1
    fi
    echo "Ambiente creado"
fi

# Activar el entorno virtual
source venv/bin/activate
if [ $? -ne 0 ]; then
    echo "Error al activar el entorno virtual."
    exit 1
fi

# Instalar las dependencias desde requirements.txt
pip install -r requirements.txt
if [ $? -ne 0 ]; then
    echo "Error al instalar las dependencias."
    exit 1
fi

echo "Dependencias se han instalado correctamente."

# Pausa para que el usuario vea el mensaje (puedes eliminar esta línea si no es necesaria)
read -p "Presiona [Enter] para continuar..."
