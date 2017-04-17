//Fallout 13 - Loadsamoney

var/datum/subsystem/donate/SSdonate



/datum/subsystem/donate
	name = "Donate"
	init_order = 100
	priority = 100

	var/list/all_donate_packs = list()

	wait = 6000

/datum/subsystem/donate/New()
	NEW_SS_GLOBAL(SSdonate)
	load_donate_packs()
	update_all_data()

/datum/subsystem/donate/fire(resumed = 0)
	update_all_data()

/datum/subsystem/donate/proc/update_all_data()
	for(var/client/C)
		C.update_donate_data()

/datum/subsystem/donate/proc/get_pack(id)
	return all_donate_packs[id]

/datum/subsystem/donate/proc/load_donate_packs()
	var/list/all_packs = subtypesof(/datum/donate_pack)
	if(!all_packs.len)
		to_chat(world, "<span class='boldannounce'>Error setting up jobs, no donate packs datums found!</span>")
		return 0
	for(var/type in all_packs)
		var/datum/donate_pack/D = new type()
		all_donate_packs[D.id] = D