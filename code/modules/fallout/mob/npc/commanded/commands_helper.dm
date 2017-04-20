var/list/translit_symbols = list("а" = "a", "б" = "b", "в" = "v", "г" = "g", "д" = "d", "е" = "e", "Є" = "yo", "ж"= "j", "з" = "z", "и" = "i", \
 "й" = "y", "к" = "k", "л" = "l", "м" = "m", "н" = "n", "о" = "o", "п" = "p", "р" = "r", "с" = "c", "т" = "t", "у" = "y", \
 "ф" = "f", "х" = "h", "ц" = "tc", "ч" = "ch", "ш" = "sh", "щ" = "sh", "ы" = "i", "э" = "e", "ю" = "yu", "€" = "ya", \
 "ь" = "", "ъ" = "")
var/static/list/phrases_storage = list("attack" = "assault,sic,strike,rush,charge,bit,target,fuck,фас,мочи,кус,бей,атак,ебашь,уеб", "follow" = "come,to me,after,with,escort,convoy,chase,пиздуй,иди,сюда,ко мне,к ноге,р€дом,за мной,пров,прес", \
"stop" = "quit,leave,drop,freeze,pause,cease,layoff,хватит,стоп,остановись,харе,перестань,фу", "stay" = "wait,hold,still,idle,сто€ть,стой,мест,не двигайс€", \
"randy" = "rand,рэнд,ренд", "bear" = "grizzly,миш,медвед,косолап", "brahmin" = "cow,брамин,коров", \
"me" = "my,mine,мен€,мной,€,мне", "anybody" = "every,each,all,все,кажд", "dance" = "танц,пл€ши", "defend" = "guard,protect,secur,enforce,watch,защищ,защит,берег,хран,сторожи", \
"legion" = "легион", "ncr" = "нкр", "enemy" = "foe,bad,bully,bandit,evil,danger,threat,monster,asshole,traitor,villain,criminal,dick,raid,spy,agent,враг,плох,зло,опас,угр,рейд,хулиг,банд,пред,прес,враж,мудак,пидор", "friend" = "buddy,master,good,ally,partner,друг,друз,повел,хоз,хор,союз,партнер", "pull" = "grab,bring,get,drag,fetch,take,drag,haul,tow,deliver,rescue,save,help,тащи,неси,хват,возьми,вз€,спас,букс", "doge" = "dog,pup,hound,mongrel,pooch,bowwow,псин,пЄс,собак,кобел,щен,пса,волк", \
"smeagol" = "gollum,hobbit,смегол,лысый,голый,урод,хобит,пучеглазый")


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