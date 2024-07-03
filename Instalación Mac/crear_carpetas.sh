#!/bin/bash

# Cambiar al directorio donde se encuentra el entorno virtual y el script
cd "/Users/andre/OneDrive/Escritorio/UPWork/Nico" || {
    echo "Error: No se pudo cambiar al directorio /Users/andre/OneDrive/Escritorio/UPWork/Nico."
    exit 1
}

# Verificar y crear la carpeta Sources si no existe
if [ -d "Sources" ]; then
    echo "La carpeta Sources ya existe."
else
    mkdir Sources
    echo "La carpeta Sources se ha creado correctamente."
fi

# Verificar y crear la carpeta Settings si no existe
if [ -d "Settings" ]; then
    echo "La carpeta Settings ya existe."
else
    mkdir Settings
    echo "La carpeta Settings se ha creado correctamente."
fi

# Verificar si hubo algún error en la creación de carpetas
if [ $? -ne 0 ]; then
    echo "Error: No se pudo crear las carpetas Sources ni Settings."
    exit 1
fi

# Pausa para que el usuario vea el mensaje (puedes eliminar esta línea si no es necesaria)
read -p "Presiona [Enter] para continuar..."
