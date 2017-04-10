/mob/var/social_faction

var/human_factions = list()

proc/get_faction_by_freq(freq)
	for(var/F in human_factions)
		var/datum/f13_faction/datum = get_faction_datum(F)
		if(freq == datum.freq)
			return datum.id
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
	var/full_name = "UNKNOWN"
	var/id = "none"
	var/flags = null
	var/list/jobs = list()

	var/welcome_text = "" //Showing text on faction joining
	var/color = "#171717"
	var/description = "No description"
	var/preview_image = 'html/factions/neutral.png'

	var/head_status = null //Main status at this faction. Currently using for leader voting

// Frequency settings
	var/freq
	var/encryption_key

	var/tmp/voting = 0 //Have head voting now
	var/list/craft_recipes = list() //recipes which can craft every member of this faction
	var/list/verbs = list() //Verbs which had every member

/datum/f13_faction/New()
	..()
	if(flags & HAVE_FREQ)
		freq = sanitize_frequency(rand(MIN_FREQ, MAX_FREQ))
		encryption_key = format_encryption_key(rand(0, 9999))
	for(var/datum/job/job in SSjob.occupations)
		if(job.faction == src.id)
			jobs += job
	if(preview_image)
		register_asset("[id].png", preview_image)

//Vote for new leader. At voting involvement near staying members
//This proc is so big, but it's easy to understand.
mob/proc/begin_head_voting()
	set name = "Leader Voting"
	set category = "Faction"

	if(stat)
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

	if(alert("Are you sure?",,"Yes","No")=="No")
		return 0

	var/list/all_members = get_faction_members(F.id)
	var/list/all_head_candidates = list()
	for(var/mob/M in all_members)
		if(!M.stat && M.ckey)
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
				M.say(pick("I vote for [choice].", "[choice] - I choose you!!!", "I choose [choice] to be [F.head_status].", "I believe [choice] is worthy to be our leader."))
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
	if(F.id == src.social_faction)
		return 1
	if(last_F)
		src.verbs -= last_F.verbs
		src.allow_recipes -= last_F.craft_recipes
		src.faction -= last_F.id

	src.social_faction = F.id
	src.faction += F.id

	src.allow_recipes += F.craft_recipes
	src.verbs += F.verbs

	return 1

/datum/f13_faction/neutral
	name = "Neutral"
	full_name = "No Faction"
	id = "none"

/datum/f13_faction/city
	name = "City"
	color = "#804B00"
	id = "city"
	head_status = "Mayor"
	preview_image = 'html/factions/city.png'
	full_name = "City Dwellers"
	flags = HAVE_FREQ
	verbs = list(/mob/proc/begin_head_voting)

/datum/f13_faction/raider
	name = "Raiders"
	color = "#804B00"
	id = "raiders"
	head_status = "Gang Leader"
	preview_image = 'html/factions/raider.png'
	full_name = "Chaotic Evil"
	verbs = list(/mob/proc/begin_head_voting)

/datum/f13_faction/vault
	name = "Vault"
	color = "#005A20"
	id = "vault"
	full_name = "Vault-Tec Industries"
	preview_image = 'html/factions/vault.png'
	head_status = "Overseer"
	flags = HAVE_FREQ
	verbs = list(/mob/proc/begin_head_voting)
//	craft_recipes = list(/datum/table_recipe/vlt_encryption_key)

/datum/f13_faction/brotherhood
	name = "Brotherhood"
	color = "#005A20"
	id = "bs"
	full_name = "Brotherhood of Steel"
	preview_image = 'html/factions/brotherhood.png'
	head_status = "Elder"
	flags = HAVE_FREQ
	verbs = list(/mob/proc/begin_head_voting)

/datum/f13_faction/enclave
	name = "Enclave"
	color = "#005A20"
	id = "enclave"
	full_name = "Enclave"
	preview_image = 'html/factions/enclave.png'
	head_status = "General"
	flags = HAVE_FREQ
	verbs = list(/mob/proc/begin_head_voting)

/datum/f13_faction/ahs
	name = "Hubologists"
	color = "#005A20"
	id = "hubs"
	full_name = "Adepts of Hubology Studies"
	preview_image = 'html/factions/ahs.png'
	head_status = "AHS-8"
	verbs = list(/mob/proc/begin_head_voting)

/datum/f13_faction/ncr
	name = "NCR"
	id = "ncr"
	color = "#020080"
	flags = HAVE_FREQ | HAVE_FLAG
	full_name = "New California Republic"
	preview_image = 'html/factions/ncr.png'
	head_status = "General"
	verbs = list(/mob/proc/begin_head_voting)
	welcome_text = "Your current objectives are:<br>\
1. As an NCR soldier you must uphold the law around the town, exterminate any raiders you see, seek and destroy the Legion members.<br>\
2. As an NCR soldier you must protect the innocent wastelanders from the horrors of the wasteland.<br>\
3. Take your survival as your main goal after protecting the citizens - you are important to the NCR and we can't afford to lose you!<br>"
//	craft_recipes = list(/datum/table_recipe/ncr_combat_armor, /datum/table_recipe/ncr_encryption_key)

/datum/f13_faction/legion
	name = "Legion"
	head_status = "Legate"
	full_name = "Caesar's Legion"
	preview_image = 'html/factions/legion.png'
	id = "legion"
	color = "#C24D44"
	flags = HAVE_FREQ | HAVE_FLAG
//	craft_recipes = list(/datum/table_recipe/legion_recruit_armor, /datum/table_recipe/legion_recruit_helm, \
						 /datum/table_recipe/legion_encryption_key)
	welcome_text = "Your current objectives:<br>\
	1. As a member of the Legion you must obey all orders given by anyone outranking you.<br>\
	2. You must enslave the occupants of the wasteland, and suppress any resistance unless they can't be overpowered.<br>\
	3. As a Legion solider you will torture and kill any NCR member you come across, fight to your death in a name of Caesar!"

/datum/f13_faction/followers
	name = "Followers"
	color = "#005A20"
	id = "followers"
	full_name = "Followers of Appocalypse"
	preview_image = 'html/factions/followers.png'
	head_status = "Leader"
	verbs = list(/mob/proc/begin_head_voting)


//	craft_recipes = list(/datum/table_recipe/den_encryption_key)