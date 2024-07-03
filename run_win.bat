@echo off
REM Cambiar al directorio donde se encuentra el entorno virtual y el script
cd /d "C:\Users\andre\OneDrive\Escritorio\UPWork\Nico"
if %ERRORLEVEL% neq 0 (
    echo Error: No se pudo cambiar al directorio %SCRIPT_DIR%.
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
