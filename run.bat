@echo off
python -m pip install --upgrade pip

pip show virtualenv >nul 2>&1
if %errorlevel% neq 0 (
    echo Instalando virtualenv...
    pip install virtualenv
)

if exist "app\.venv" (
    echo Omitiendo entorno virtual.
) else (
    echo Creando el entorno virtual...
    python -m venv app\.venv
    echo Instalando dependencias desde requirements.txt...
    pip install -r app\requirements.txt
)

call .\app\.venv\Scripts\activate.bat


echo Iniciando la aplicacion...
python app\Main.py

pause
