@echo off
REM REEMPLAZA LA SIGUIENTE LíNEA DENTRO DE LAS " COMILLAS DOBLES LA CARPETA DONDE DEJASTE EL PROYECTO "
cd /d "C:\Ejemplo\De\Ruta"
if %ERRORLEVEL% neq 0 (
    echo Error: No se pudo cambiar al directorio %SCRIPT_DIR%.
    pause
    exit /b %ERRORLEVEL%
)

if exist Sources (
    echo La carpeta Sources ya existe
) else (
    mkdir Sources
    echo La carpeta Sources se ha creado correctamente.
)

if exist Settings (
    echo La carpeta Settings ya existe
) else (
    mkdir Settings
    echo La carpeta Settings se ha creado correctamente.
)

if %ERRORLEVEL% neq 0 (
    echo Error: No se pudo crear las carpetas Sources ni Settings.
    pause
    exit /b %ERRORLEVEL%
)

pause