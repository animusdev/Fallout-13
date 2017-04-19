//Fallout 13 - Loadsamoney

var/datum/subsystem/content/SScontent



/datum/subsystem/content
	name = "Content"
	init_order = 0
	priority = 0

	var/list/all_content_packs = list()

	wait = 6000

/datum/subsystem/content/New()
	NEW_SS_GLOBAL(SScontent)

/datum/subsystem/content/Initialize(timeofday)
	load_content_packs()
	update_all_data()

/datum/subsystem/content/fire(resumed = 0)
	update_all_data()

/datum/subsystem/content/proc/update_all_data()
	for(var/client/C)
		C.update_content_data()

/datum/subsystem/content/proc/get_pack(id)
	return all_content_packs[id]

/datum/subsystem/content/proc/load_content_packs()
	var/list/all_packs = subtypesof(/datum/content_pack)
	if(!all_packs.len)
		to_chat(world, "<span class='boldannounce'>Error setting up jobs, no content packs datums found!</span>")
		return 0
	for(var/type in all_packs)
		var/datum/content_pack/D = new type()
		all_content_packs[D.id] = D