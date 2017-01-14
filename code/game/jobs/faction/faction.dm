var/human_factions = list()

proc/get_faction_datum(faction)
	if(!human_factions[faction])
		return null

	return human_factions[faction]

proc/get_faction_members(var/faction)
	var/list/mobs = list()
	for(var/mob/M in world)
		if(M.faction == faction)
			mobs += M
	return mobs

/datum/f13_faction
	var/name = "UNKNOWN"

	var/late_join = 0

	var/first_spawn = 0

	var/welcome_text = ""

	var/color = "#171717"

	var/list/verbs = list()

	var/head_status = null

	var/list/craft_recipes = list()

	var/voting = 0

mob/proc/begin_head_voting()
	set name = "Vote to new leader"
	set category = "Abilities"
	var/datum/f13_faction/F = get_faction_datum(src.faction)
	if(!F || !F.head_status)
		return 0

	if(F.voting)
		src << "<span class='warning'>Voting is going on.</span>"

	if(src.status == F.head_status)
		src << "<span class='notice'> You already [F.head_status].</span>"

	var/list/all_members = get_faction_members(F.name)
	var/list/all_head_candidates = list()
	for(var/mob/M in all_members)
		if(M.stat != DEAD && M.ckey)
			all_head_candidates += M
	if(all_head_candidates.len < 2)
		src << "<span class='notice'>You are the last member from your faction.</span>"
		src.set_status(F.head_status)
		return 1

	var/list/correct_candidates = list()
	for(var/mob/M in all_head_candidates)
		if(M in view())
			correct_candidates += M
	if(all_head_candidates.len/2 > correct_candidates.len)
		src << "<span class='warning'>To start a vote, you need more active members of your faction to be present at the moment.</span>"
		return 0
	//VOTE BEGIN

	say("Let's choice new [F.head_status].")
	var/list/choices = list()

	F.voting = 1

	var/global/voters_count
	voters_count = correct_candidates.len
	var/voting_started_time = world.time
	for(var/mob/M in correct_candidates)
		spawn(0)
			var/choice = input(M,"Make a choice") in correct_candidates
			if(choice == M)
				M.say("I'm voting for myself")
			else
				M.say("Vote to [choice]")
			choices[choice] += 1
			voters_count -= 1

	while(1)
		if(round((world.time - voting_started_time) / 600) > 2)
			break
		if(voters_count < 1)
			break
		sleep(20)
	var/mob/favorite = null
	for(var/mob/M in choices)
		if(favorite == null)
			favorite = M
			continue
		if(choices[M] > choices[favorite])
			favorite = M
	if(favorite == null)
		src << "<span class='warning'>No one has voted.</span>"
		return 0
	for(var/mob/M in choices)
		if(choices[M] == choices[favorite] && M != favorite)
			src << "<span class='warning'>You need to make a choice together.</span>"
			return 0
	if(favorite == src)
		say("So, i think i'm is a new [F.head_status]")
	else
		say("[favorite] is a new [F.head_status]")

	remove_everyone_from_status(F.head_status)

	favorite.set_status(F.head_status)

	F.voting = 0

	//END THIS SHIT

	return 1

mob/proc/set_faction(var/faction)
	var/datum/f13_faction/F = get_faction_datum(faction)
	var/datum/f13_faction/last_F = get_faction_datum(src.faction)
	if(!F)
		return 0
	if(F.name == src.faction)
		return 1
	if(last_F)
		src.verbs -= last_F.verbs
		src.allow_recipes -= last_F.craft_recipes

	src.faction = F.name
	src << "<span class='notice'>You are joined to <span style='color: [F.color];'>[F.name]</span> faction.</span>"

	src.allow_recipes += F.craft_recipes
	src.verbs += F.verbs


	if(F.welcome_text)
		src << F.welcome_text
	return 1

/datum/f13_faction/vault
	name = "Vault"
	first_spawn = 1
	color = "#005A20"
	head_status = "Overseer"
	verbs = list(/mob/proc/begin_head_voting)
	craft_recipes = list(/datum/table_recipe/vlt_encryption_key)
/datum/f13_faction/ncr
	name = "NCR"
	first_spawn = 1
	color = "#020080"
	head_status = "Sergeant"
	welcome_text = "Your current objectives:<br>\
1. As an NCR soldier you must uphold the law around town, kill any raiders you see,  find and kill everyone Legion member<br>\
2. As an NCR soldier you must protect the innocent wastelanders from the horrors the wasteland brings<br>\
3. Protect yourself above all others, your important to the NCR and we can't afford to lose you.<br>"
	craft_recipes = list(/datum/table_recipe/ncr_combat_armor, /datum/table_recipe/ncr_encryption_key)
/datum/f13_faction/legion
	name = "Legion"
	first_spawn = 1
	head_status = "Legat"
	color = "#C24D44"
	craft_recipes = list(/datum/table_recipe/legion_recruit_armor, /datum/table_recipe/legion_recruit_helm, \
						 /datum/table_recipe/legion_encryption_key)
	welcome_text = "Your current objectives:<br>\
	1. As a member of The Legion you must obey all orders given by anyone out ranking out<br>\
	2. You must enslave the occupants of the wasteland, kill any that resist unless they can be over powered<br>\
	3. As a Legion solider you will kill any NCR you come across, fight to your death for Caesar!!"
/datum/f13_faction/wasteland
	name = "Wasteland"
	late_join = 1
/datum/f13_faction/den
	name = "Den"
	color = "#804B00"
	first_spawn = 1
	head_status = "Sheriff"
	verbs = list(/mob/proc/begin_head_voting)
	craft_recipes = list(/datum/table_recipe/den_encryption_key)