#!/bin/bash

# REEMPLAZA LA SIGUIENTE LíNEA DENTRO DE LAS " COMILLAS DOBLES LA CARPETA DONDE DEJASTE EL PROYECTO "
cd "/Ejemplo/de/ruta/" || {
    echo "Error: No se pudo cambiar al directorio /Users/andre/OneDrive/Escritorio/UPWork/Nico."
    exit 1
}

# Activa el entorno virtual
source venv/bin/activate
if [ $? -ne 0 ]; then
    echo "Error: No se pudo activar el entorno virtual."
    exit 1
fi

# Ejecuta el script main.py
python Scripts/main.py
if [ $? -ne 0 ]; then
    echo "Error: La ejecución de main.py falló."
    cd ..
    deactivate
    exit 1
fi

# Desactiva el entorno virtual
deactivate
if [ $? -ne 0 ]; then
    echo "Error: No se pudo desactivar el entorno virtual."
    exit 1
fi

# Pausa para que el usuario vea el mensaje (puedes eliminar esta línea si no es necesaria)
read -p "Presiona [Enter] para continuar..."
