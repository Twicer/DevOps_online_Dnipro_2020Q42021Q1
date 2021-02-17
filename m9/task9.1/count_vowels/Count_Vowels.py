def Count_Vowels(string_list):
	VOWELS = 'aeuio'
	count = 0

	for usr_srt in string_list:
		for letter in usr_srt:
			if letter.lower() in VOWELS:
				count += 1
	return count