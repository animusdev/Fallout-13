/*
	Quest contain information about items needs to complete them.
	And reward in caps
*/
/datum/bounty_quest
	var/name = "Default Quest Name"
	var/desc = "Default Quest Description"
	var/employer = "Default Employer"

	/* This items needs to complete this quest */
	var/list/target_items = list()

	/* How many caps will spawned after quest complete */
	var/caps_reward = 10

	/* Will show to player, when quest is complete */
	var/end_message = "Contract complete!"

	var/need_message = "Need some items"

	var/employer_icon_folder = "icons/bounty_employers/"

	var/employer_icon = "employer_00.png"

/datum/bounty_quest/proc/ItsATarget(var/target)
	for(var/target_type in target_items)
		if(istype(target, target_type))
			return 1
	return 0

/datum/bounty_quest/proc/GetIconWithPath()
	return text2path("[employer_icon_folder][employer_icon]")

/datum/bounty_quest/qst_0
	name = "Проблемы с пушками."
	desc = "Прием! Мы тут сильно продвинулись в исследовании радиации, и теперь нас атакуют гули. Помощь не помешала бы. В общем мы заплатим 300 крышек, если вы отправите нам 5 стволов."
	employer = "Some guys..."
	employer_icon = "employer_04.png"
	need_message = "5 единиц любого огнестрельного оружия"
	end_message = "Отлично! Получили посылку! Держите ваши крышки!"
	target_items = list(/obj/item/weapon/gun = 5)
	caps_reward = 100