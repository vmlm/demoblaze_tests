#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Define the required Python version and Allure version
PYTHON_VERSION=3.12.4

if ! command -v pyenv &> /dev/null
then
    echo "pyenv could not be found, please install before continuing"
fi

# Install the required Python version if not already installed
if ! pyenv versions --bare | grep -q "^$PYTHON_VERSION$"
then
    echo "Installing Python $PYTHON_VERSION..."
    pyenv install $PYTHON_VERSION
fi

# Create a virtual environment with the specified Python version in the project folder
echo "Creating virtual environment..."
pyenv virtualenv $PYTHON_VERSION venv

# Activate the virtual environment
echo "Activating virtual environment..."
pyenv activate venv

# Install project dependencies
echo "Installing project dependencies..."
pip install -r requirements.txt

# Inform the user of next steps
echo "Setup completed successfully."