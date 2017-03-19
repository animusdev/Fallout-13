// Ensure the frequency is within bounds of what it should be sending/recieving at
/proc/sanitize_frequency(frequency, free = FALSE)
	. = round(frequency)
	if(free)
		. = Clamp(frequency, MIN_FREE_FREQ, MAX_FREE_FREQ)
	else
		. = Clamp(frequency, MIN_FREQ, MAX_FREQ)
	if(!(. % 2)) // Ensure the last digit is an odd number
		. += 1

// Format frequency by moving the decimal.
/proc/format_frequency(frequency)
	frequency = text2num(frequency)
	return "[round(frequency / 10)].[frequency % 10]"

/proc/format_encryption_key(key)
	if(length(key) > 4)
		key = copytext(key,1,5)
	CHECK_SYMBOL
	if(length(key) < 4)
		key += "0"
		goto CHECK_SYMBOL
	var/list/chars = string2charlist(key)
	key = ""
	for(var/i = 1, i < chars.len, i++)
		if(!numbers.Find(chars[i]))
			key += "0"
		else
			key += chars[i]
	return key