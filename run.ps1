python -m pip install --upgrade pip

if (-not (Get-Package -Name virtualenv -ErrorAction SilentlyContinue)) {
    Write-Host "Instalando virtualenv..."
    pip install virtualenv
}

if (Test-Path "app\.venv") {
    Write-Host "Omitiendo entorno virtual."
} else {
    Write-Host "Creando el entorno virtual..."
    python -m venv app\.venv
}

if (-not (Test-Path "app\.venv\Scripts\Activate.ps1")) {
    Write-Host "Instalando dependencias desde requirements.txt..."
    pip install -r app\requirements.txt
}

& .\app\.venv\Scripts\Activate.ps1

Write-Host "Iniciando dashboard..."
python app\Main.py

Read-Host -Prompt "Presiona Enter para continuar"
