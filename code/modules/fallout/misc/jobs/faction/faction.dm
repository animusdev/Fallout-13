/mob/var/social_faction

var/human_factions = list()

proc/get_faction_by_freq(freq)
	for(var/F in human_factions)
		var/datum/f13_faction/datum = get_faction_datum(F)
		if(freq == datum.freq)
			return datum.name
	return null

proc/get_faction_datum(faction)
	if(!human_factions[faction])
		return null

	return human_factions[faction]

proc/get_faction_members(var/faction)
	var/list/mobs = list()
	for(var/mob/M in world)
		if(M.social_faction == faction)
			mobs += M
	return mobs

/datum/f13_faction
	var/name = "UNKNOWN"
	var/id = "none"
	var/welcome_text = ""
	var/color = "#171717"
	var/list/verbs = list()
	var/head_status = null
	var/list/craft_recipes = list()
	var/flags = null
	var/voting = 0

	var/freq
	var/encryption_key

/datum/f13_faction/New()
	..()
	if(flags & HAVE_FREQ)
		freq = sanitize_frequency(rand(MIN_FREQ, MAX_FREQ))
		encryption_key = format_encryption_key(rand(0, 9999))

mob/proc/begin_head_voting()
	set name = "Leader Voting"
	set category = "Faction"

	if(stat == DEAD)
		return

	var/datum/f13_faction/F = get_faction_datum(src.social_faction)

	if(!F || !F.head_status)
		return 0

	if(F.voting)
		to_chat(src, "<span class='warning'>Voting is going on.</span>")
		return 0

	if(src.status == F.head_status)
		to_chat(src, "<span class='notice'>You already [F.head_status].</span>")
		return 0

	if(alert("You are sure?",,"Yes","No")=="No")
		return 0

	var/list/all_members = get_faction_members(F.name)
	var/list/all_head_candidates = list()
	for(var/mob/M in all_members)
		if(M.stat != DEAD && M.ckey)
			all_head_candidates += M
	if(all_head_candidates.len < 2)
		to_chat(src, "<span class='notice'>You are the last member of your faction.</span>")
		src.set_status(F.head_status)
		return 1

	var/list/correct_candidates = list()
	for(var/mob/M in all_head_candidates)
		if(M in view())
			correct_candidates += M
	if(all_head_candidates.len/2 > correct_candidates.len)
		to_chat(src, "<span class='warning'>To start a vote, you need more active members of your faction to be present at the moment.</span>")
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
				M.say(pick("I'm voting for myself", "I'm gonna be the new [F.head_status]!", "No one other but myself is worthy."))
			else
				if(prob(1))
					if(prob(50))
						M.say("TRUMP FOREVER! MAKE WASTELAND GREAT AGAIN!!!")
					else
						M.say("PUTIN THE BEST!!!")
					sleep(20)
					M.say("I changed my mind...")
				M.say(pick("I vote for [choice].", "[choice] - I choose you!", "I choose [choice] to be [F.head_status].", "I believe [choice] is worthy to be our leader."))
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
		to_chat(src, "<span class='warning'>Sadly, no one has voted.</span>")
		F.voting = 0
		return 0
	for(var/mob/M in choices)
		if(choices[M] == choices[favorite] && M != favorite)
			to_chat(src, "<span class='warning'>You need to make a choice together.</span>")
			say("We need to make a choice together.")
			F.voting = 0
			return 0
	if(favorite == src)
		say("I think, I'm a new [F.head_status] now")
	else
		say("[favorite] is a new [F.head_status]")

	remove_everyone_from_status(F.head_status)

	favorite.set_status(F.head_status)

	F.voting = 0

	//END THIS SHIT

	return 1

mob/proc/set_faction(var/faction)
	var/datum/f13_faction/F = get_faction_datum(faction)
	var/datum/f13_faction/last_F = get_faction_datum(src.social_faction)
	if(!F)
		return 0
	if(F.name == src.social_faction)
		return 1
	if(last_F)
		src.verbs -= last_F.verbs
		src.allow_recipes -= last_F.craft_recipes
		src.faction -= last_F.name

	src.social_faction = F.name
	src.faction += F.name
	to_chat(src, "<span class='notice'>You have joined the <span style='color: [F.color];'>[F.name]</span> faction.</span>")
	if(F.flags & HAVE_FREQ)
		src.add_memory("[F.name] is using freq ([F.freq]) with encryption key ([F.encryption_key])")
	src.allow_recipes += F.craft_recipes
	src.verbs += F.verbs


	if(F.welcome_text)
		to_chat(src, F.welcome_text)
	return 1

/datum/f13_faction/vault
	name = "Vault"
	color = "#005A20"
	id = "vault"
	head_status = "Overseer"
	flags = HAVE_FREQ
	verbs = list(/mob/proc/begin_head_voting)
//	craft_recipes = list(/datum/table_recipe/vlt_encryption_key)

/datum/f13_faction/ncr
	name = "NCR"
	id = "ncr"
	color = "#020080"
	flags = HAVE_FREQ | HAVE_FLAG
	head_status = "Squad Leader"
	verbs = list(/mob/proc/begin_head_voting)
	welcome_text = "Your current objectives are:<br>\
1. As an NCR soldier you must uphold the law around the town, exterminate any raiders you see, seek and destroy the Legion members.<br>\
2. As an NCR soldier you must protect the innocent wastelanders from the horrors of the wasteland.<br>\
3. Take your survival as your main goal after protecting the citizens - you are important to the NCR and we can't afford to lose you!<br>"
//	craft_recipes = list(/datum/table_recipe/ncr_combat_armor, /datum/table_recipe/ncr_encryption_key)

/datum/f13_faction/legion
	name = "Legion"
	head_status = "Legat"
	color = "#C24D44"
	flags = HAVE_FREQ | HAVE_FLAG
//	craft_recipes = list(/datum/table_recipe/legion_recruit_armor, /datum/table_recipe/legion_recruit_helm, \
						 /datum/table_recipe/legion_encryption_key)
	welcome_text = "Your current objectives:<br>\
	1. As a member of the Legion you must obey all orders given by anyone outranking you.<br>\
	2. You must enslave the occupants of the wasteland, and suppress any resistance unless they can't be overpowered.<br>\
	3. As a Legion solider you will torture and kill any NCR member you come across, fight to your death in a name of Caesar!"

/datum/f13_faction/wasteland
	name = "Wasteland"
	id = "none"

/datum/f13_faction/den
	name = "Den"
	color = "#804B00"
	id = "den"
	head_status = "Sheriff"
	flags = HAVE_FREQ
	verbs = list(/mob/proc/begin_head_voting)
//	craft_recipes = list(/datum/table_recipe/den_encryption_key)