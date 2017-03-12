var/list/translit_symbols = list("а" = "a", "б" = "b", "в" = "v", "г" = "g", "д" = "d", "е" = "e", "ё" = "yo", "ж"= "j", "з" = "z", "и" = "i", \
 "й" = "y", "к" = "k", "л" = "l", "м" = "m", "н" = "n", "о" = "o", "п" = "p", "р" = "r", "с" = "c", "т" = "t", "у" = "y", \
 "ф" = "f", "х" = "h", "ц" = "tc", "ч" = "ch", "ш" = "sh", "щ" = "sh", "ы" = "i", "э" = "e", "ю" = "yu", "я" = "ya", \
 "ь" = "", "ъ" = "")
var/static/list/phrases_storage = list("attack" = "фас,мочи,бей,атак,ебашь,уеб", "follow" = "пиздуй,иди,сюда,ко мне,к ноге,рядом,за мной", \
"stop" = "хватит,стоп,остановись,харе,перестань", "stay" = "стоять,стой,на месте,не двигайся", \
"andrew" = "эндрю,андре", "bear" = "мишк,медвед,косолап", "brahmin" = "брамин,коров", \
"me" = "меня,мной,я,мне", "everyone" = "все,кажд", "dance" = "танц,пляши", "defend" = "защищ,защит,спас,хран", \
"legion" = "легион", "ncr" = "нкр", "enemy" = "враг", "friend" = "друг,друз", "pull" = "тащи,неси", "dog" = "псин,пёс,собак", \
"smeagol" = "смегол,лысый,хобит,пучеглазый")


proc/translit(text)
	return sanitize_simple(text, translit_symbols)

proc/parse_phrase(text, name)
	if(findtext(text,name))
		return 1
	if(name in phrases_storage)
		var/names = phrases_storage[name]
		names = splittext(names,",")
		for(var/N in names)
			if(findtext(text,"[N]"))
				return 1
	var/translit = translit(text)
	if(findtext(translit,name))
		if(phrases_storage[name])
			phrases_storage[name] += ",[translit]"
		else
			phrases_storage[name] = translit
		return 1
	return 0