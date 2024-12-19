#!/bin/bash
case "$OSTYPE" in
  darwin*)
    echo "- detectado macOS."   
    if ! python3 -m virtualenv --version > /dev/null 2>&1; then
        echo "virtualenv no está instalado. Verificando pip..."
        
        if ! pip3 --version > /dev/null 2>&1; then
            echo "pip3 no está instalado. Instalando pip..."
            curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
            python3 get-pip.py
        fi
        
        echo "instalando virtualenv..."
        pip3 install virtualenv
    else
        echo "virtualenv ya está instalado."
    fi
    ;;
  
  linux*) 
    echo "- detectado Linux."
   
    if ! python3 -m virtualenv --version > /dev/null 2>&1; then
        echo "virtualenv no está instalado. Por favor, instálalo según tu distribución."
        exit 1
    else
        echo "- virtualenv ya está instalado."
    fi
    ;;
  
  *) 
    echo "- sistema operativo no soportado."
    exit 1
    ;;
esac



if [ -d "app/.venv" ]; then
    echo "- omitiendo entorno virtual."
else
    echo "creando el entorno virtual..."
    virtualenv app/.venv
    echo "- entrando en entorno virtual"
    source app/.venv/bin/activate
    echo "- Instalando dependencias desde requirements.txt..."
    pip install -r app/requirements.txt
fi

echo "- iniciando la aplicación..."
python app/Main.py

read -p "Presiona Enter para continuar..."

