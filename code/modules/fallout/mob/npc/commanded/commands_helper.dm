var/list/translit_symbols = list("а" = "a", "б" = "b", "в" = "v", "г" = "g", "д" = "d", "е" = "e", "Є" = "yo", "ж"= "j", "з" = "z", "и" = "i", \
 "й" = "y", "к" = "k", "л" = "l", "м" = "m", "н" = "n", "о" = "o", "п" = "p", "р" = "r", "с" = "c", "т" = "t", "у" = "y", \
 "ф" = "f", "х" = "h", "ц" = "tc", "ч" = "ch", "ш" = "sh", "щ" = "sh", "ы" = "i", "э" = "e", "ю" = "yu", "€" = "ya", \
 "ь" = "", "ъ" = "")
var/static/list/phrases_storage = list("attack" = "фас,мочи,бей,атак,ебашь,уеб", "follow" = "пиздуй,иди,сюда,ко мне,к ноге,р€дом,за мной", \
"stop" = "хватит,стоп,остановись,харе,перестань", "stay" = "сто€ть,стой,на месте,не двигайс€", \
"andrew" = "эндрю,андре", "bear" = "мишк,медвед,косолап", "brahmin" = "брамин,коров", \
"me" = "мен€,мной,€,мне", "everyone" = "все,кажд", "dance" = "танц,пл€ши", "defend" = "защищ,защит,спас,хран", \
"legion" = "легион", "ncr" = "нкр", "enemy" = "враг", "friend" = "друг,друз", "pull" = "тащи,неси", "dog" = "псин,пЄс,собак")


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