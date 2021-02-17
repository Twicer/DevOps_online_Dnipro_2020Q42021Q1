from FizzBuzz import FizzBuzz

def EnterData():
	
	while True:
		try:
			num = int(input('Enter number: '))
		except ValueError:
			print('>>> Incorrect data type')
		else:
			return num

print(FizzBuzz(EnterData()))

