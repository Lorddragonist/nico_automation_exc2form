@echo off

REM REEMPLAZA LA SIGUIENTE LíNEA DENTRO DE LAS " COMILLAS DOBLES LA CARPETA DONDE DEJASTE EL PROYECTO "
cd /d "C:\Ejemplo\De\Ruta"
if %ERRORLEVEL% neq 0 (
    echo Error: No se pudo cambiar al directorio especificado.
    pause
    exit /b %ERRORLEVEL%
)

REM Verifica si Python está instalado
python --version
if %errorlevel% neq 0 (
    echo Python no está instalado. Por favor, instala Python antes de continuar.
    pause
    exit /b 1
)

REM Crear el entorno virtual
if exist venv (
    echo El ambiente virtual ya existe.
) else (
    python -m venv venv    
    echo ambiente creado
)
if %errorlevel% neq 0 (
    echo Error al crear el entorno virtual.
    pause
    exit /b 1
)

REM Activar el entorno virtual
call venv\Scripts\activate
if %errorlevel% neq 0 (
    echo Error al activar el entorno virtual.
    pause
    exit /b 1
)

REM Instalar las dependencias desde requirements.txt
pip install -r requirements.txt
if %errorlevel% neq 0 (
    echo Error al instalar las dependencias.
    pause
    exit /b 1
)

REM Instalar PlayWright
playwright install
if %errorlevel% neq 0 (
    echo Error al instalar playwright.
    pause
    exit /b 1
)

echo Dependencias se han instalado correctamente.
pause
