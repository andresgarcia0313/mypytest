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
