import unittest
from Count_Vowels import Count_Vowels


class TestCount_Vowels(unittest.TestCase):

	def test_Count_Vowels(self):
		self.assertEqual(Count_Vowels('aa eda 12 eou'), 7)
		self.assertEqual(Count_Vowels(''), 0)
		self.assertEqual(Count_Vowels('qwsxz 1231 ws.'), 0)

if __name__ == '__main__':
	unittest.main()