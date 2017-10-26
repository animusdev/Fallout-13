var/list/translit_symbols = list("�" = "a", "�" = "b", "�" = "v", "�" = "g", "�" = "d", "�" = "e", "�" = "yo", "�"= "j", "�" = "z", "�" = "i", \
 "�" = "y", "�" = "k", "�" = "l", "�" = "m", "�" = "n", "�" = "o", "�" = "p", "�" = "r", "�" = "c", "�" = "t", "�" = "y", \
 "�" = "f", "�" = "h", "�" = "tc", "�" = "ch", "�" = "sh", "�" = "sh", "�" = "i", "�" = "e", "�" = "yu", "�" = "ya", \
 "�" = "", "�" = "")
var/static/list/phrases_storage = list("attack" = "assault,sic,strike,rush,charge,bit,target,open,fuck,���,����,����,���,���,���,����,����,�����,���,���", "follow" = "come,to me,after,with,escort,convoy,chase,������,���,����,�� ���,� ����,�����,�� ����,����,����,����,������", \
"stop" = "quit,leave,drop,freeze,pause,cease,layoff,������,����,����������,����,���������,�������,��,���,������,����,������,������", "stay" = "wait,hold,still,idle,������,����,����,�� ��������", \
"randy" = "rand,����,����", "bear" = "grizzly,���,������,�������", "brahmin" = "cow,������,�����,��", \
"me" = "my,mine,����,����,�,���", "anybody" = "every,each,all,���,����", "dance" = "����,�����", "defend" = "guard,protect,secur,enforce,watch,�����,�����,�����,����,������", \
"none" = "neutral,wasteland,settler,farm,�������,������,�������,�����,����,����", "city" = "citiz,mayor,sherif,�����,���,���,�����,�����", "raiders" = "bandit,criminal,raid,gang,psych,insane,maniac,sadist,����,�����,����,�����,����,���,����,������,�����", "vault" = "bunker,������,������", "bs" = "bro,steel,knight,paladin,elder,����,����,�����,�������,���������", "enclave" = "usa,���,������", "ahs" = "hubolog,adept,�������,�����", "ncr" = "california,republic,���,���������,���������", "legion" = "caesar,������,������", "followers" = "follower,apocalypse,���������,�����������", "acolytes" = "acolyt,atom,ghoul,������,����,���", \
"enemy" = "foe,bad,bully,evil,danger,threat,monster,asshole,fag,traitor,villain,dick,douche,prick,spy,agent,����,���,����,���,����,���,����,���,����,������,���,�����", \
"friend" = "buddy,master,good,kind,ally,partner,����,����,����,�����,���,���,����,���", "pull" = "grab,bring,get,drag,fetch,take,haul,tow,deliver,rescue,save,help,�����,����,����,����,����,������,���,������,����,����", \
"doge" = "dog,pup,hound,mongrel,pooch,bowwow,����,��,�����,�����,���,���,����,����", \
"smeagol" = "gollum,hobbit,������,�����,���,���,����,�����,��������")


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