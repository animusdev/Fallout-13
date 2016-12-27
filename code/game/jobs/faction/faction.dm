var/human_factions = list()

proc/get_faction_datum(faction)
	if(!human_factions[faction])
		return 0
	return human_factions[faction]

/datum/f13_faction
	var/name = "UNKNOWN"

	var/can_spawn = 0

	var/actions = list()
mob/proc/set_faction(var/faction)
	var/datum/f13_faction/F = human_factions[faction]
	if(!F)
		return
	src.faction = F.name
	src << "Now you are in <span>[F.name]</span>"

/datum/f13_faction/vault
	name = "Vault"
	can_spawn = 1
/datum/f13_faction/ncr
	name = "NCR"
	can_spawn = 1
/datum/f13_faction/legion
	name = "Legion"
	can_spawn = 1