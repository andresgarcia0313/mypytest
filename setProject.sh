#!/bin/bash

# Configuración inicial
PROJECT_NAME="."

echo "Iniciando la creación del proyecto $PROJECT_NAME..."

# Crear estructura del proyecto
echo "Creando directorios..."
mkdir -p $PROJECT_NAME/{.github/workflows,tests}

# Crear el archivo principal con principios SOLID
echo "Creando suma.py..."
cat <<EOL > $PROJECT_NAME/suma.py
def suma(a, b):
    """
    Devuelve la suma de dos números.
    Principio de Responsabilidad Única (SRP): 
    Esta función tiene una sola responsabilidad: sumar dos números.
    """
    return a + b
EOL

# Crear pruebas unitarias para suma
echo "Creando tests/test_suma.py..."
cat <<EOL > $PROJECT_NAME/tests/test_suma.py
import unittest
from suma import suma

class TestSuma(unittest.TestCase):
    """
    Principio de Responsabilidad Única (SRP): 
    Este archivo solo contiene pruebas para la función suma.
    """

    def test_suma_positivos(self):
        self.assertEqual(suma(2, 3), 5)

    def test_suma_negativos(self):
        self.assertEqual(suma(-2, -3), -5)

    def test_suma_mixtos(self):
        self.assertEqual(suma(-2, 3), 1)

if __name__ == "__main__":
    unittest.main()
EOL

# Crear archivo de dependencias
echo "Creando requirements.txt..."
cat <<EOL > $PROJECT_NAME/requirements.txt
# Dependencias del proyecto
# (Por ahora vacío, unittest es parte de la librería estándar)
EOL

# Crear configuración de GitHub Actions
echo "Creando workflow de GitHub Actions..."
cat <<EOL > $PROJECT_NAME/.github/workflows/ci.yml
name: CI Pipeline

on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main

jobs:
  test:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v3

    - name: Set up Python
      uses: actions/setup-python@v4
      with:
        python-version: "3.x"

    - name: Install dependencies
      run: |
        python -m pip install --upgrade pip
        pip install -r requirements.txt

    - name: Run tests
      run: |
        python -m unittest discover -s tests
EOL

# Finalizar configuración
echo "Creación de proyecto completada. Estructura generada:"
tree $PROJECT_NAME

echo "¡Proyecto $PROJECT_NAME creado con éxito!"
