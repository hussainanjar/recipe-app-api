from django.test import TestCase

from .calc import add, substract


class CalcTest(TestCase):

    def test_add_numbers(self):
        """Test that two numbers are added together"""
        self.assertEqual(add(3, 8), 11)

    def test_substract_numbers(self):
        """Test that two numbers are substracted properly"""
        self.assertEqual(substract(11, 5), 6)
