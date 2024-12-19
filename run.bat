@echo off
python -m pip install --upgrade pip

pip show virtualenv >nul 2>&1
if %errorlevel% neq 0 (
    echo - instalando virtualenv...
    pip install virtualenv
)

if exist "app\.venv" (
    echo - omitiendo entorno virtual.
) else (
    echo Creando el entorno virtual...
    python -m venv app\.venv
    echo - entrando a entorno virtual
    call .\app\.venv\Scripts\activate.bat
    echo - instalando dependencias desde requirements.txt...
    python -m pip install --upgrade pip
    pip install -r app\requirements.txt
)

echo iniciando la aplicacion
python app\Main.py

pause
