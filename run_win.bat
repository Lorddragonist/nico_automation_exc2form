@echo off
REM REEMPLAZA LA SIGUIENTE LíNEA DENTRO DE LAS " COMILLAS DOBLES LA CARPETA DONDE DEJASTE EL PROYECTO "
cd /d "C:\Ejemplo\De\Ruta"
if %ERRORLEVEL% neq 0 (
    echo Error: No se pudo cambiar al directorio.
    pause
    exit /b %ERRORLEVEL%
)

REM Activa el entorno virtual
call venv\Scripts\activate.bat
if %ERRORLEVEL% neq 0 (
    echo Error: No se pudo activar el entorno virtual.
    pause
    exit /b %ERRORLEVEL%
)

REM Ejecuta el script main.py
python Scripts/main.py
if %ERRORLEVEL% neq 0 (
    echo Error: La ejecución de main.py falló.
    cd ..
    deactivate
    pause
    exit /b %ERRORLEVEL%
)

REM Desactiva el entorno virtual
deactivate
if %ERRORLEVEL% neq 0 (
    echo Error: No se pudo desactivar el entorno virtual.
    pause
    exit /b %ERRORLEVEL%
)

pause
