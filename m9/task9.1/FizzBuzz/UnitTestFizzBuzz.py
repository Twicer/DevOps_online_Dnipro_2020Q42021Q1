import unittest
from FizzBuzz import FizzBuzz

class TestFizzBuzz(unittest.TestCase):

	def test_FizzBuzz(self):
		self.assertEqual(FizzBuzz(5), 'Buzz')
		self.assertEqual(FizzBuzz(3), 'Fizz')
		self.assertEqual(FizzBuzz(15), 'FizzBuzz')
		self.assertEqual(FizzBuzz(-2), -2)

if __name__ == '__main__':
	unittest.main()