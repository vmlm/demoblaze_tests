@echo off
set PYTHON_VERSION=3.12.4

REM Check if pyenv is installed
pyenv --version > nul 2>&1
if errorlevel 1 (
    echo pyenv could not be found, please install before continuing
    exit /b 1
)

REM Install Python version if not already installed
pyenv versions --bare | findstr /i "\<%PYTHON_VERSION%\>" > nul
if errorlevel 1 (
    echo Installing Python %PYTHON_VERSION%...
    pyenv install %PYTHON_VERSION%
)

REM Create virtual environment and activate
echo Creating virtual environment...
pyenv virtualenv %PYTHON_VERSION% venv

echo Activating virtual environment...
pyenv activate venv

REM Install project dependencies
echo Installing project dependencies...
pip install -r requirements.txt

echo Setup completed successfully.