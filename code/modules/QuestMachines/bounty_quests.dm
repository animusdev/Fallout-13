/*
	Quest contain information about items needs to complete them.
	And reward in caps
*/
/datum/bounty_quest
	var/name = "Default Quest Name"
	var/desc = "Default Quest Description"

	/* This items needs to complete this quest */
	var/list/target_items = list()

	/* How many caps will spawned after quest complete */
	var/caps_reward = 10

	var/end_message = "Contract complete!"

/datum/bounty_quest/proc/ItsATarget(var/target)
	var/result = 0
	for(var/Itm in target_items)
		if(Itm == target)
			result = 1
			break
	return result


/datum/bounty_quest/qst_0
	name = "Проблемы с пушками."
	desc = "Прием! Мы тут сильно продвинулись в исследовании радиации, и теперь нас атакуют гули. Помощь не помешала бы. В общем мы заплатим 300 крышек, если вы отправите нам 5 стволов."
	end_message = "Отлично! Получили посылку! Держите ваши крышки!"
	target_items = list(/obj/item/weapon/gun = 5)
	caps_reward = 100