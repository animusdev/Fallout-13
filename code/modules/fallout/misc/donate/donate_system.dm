var/global/list/all_donate_packs = list()

proc/load_donate_packs()
	var/list/all_packs = subtypesof(/datum/donate_pack)
	if(!all_packs.len)
		to_chat(world, "<span class='boldannounce'>Error setting up jobs, no donate packs datums found</span>")
		return 0
	for(var/type in all_packs)
		var/datum/donate_pack/D = new type()
		all_donate_packs[D.id] = D
#define DONATE_UPDATE_DELAY 6000
client
	var
		list/donate_items
		list/donate_pets
		list/donate_roles
		list/donate_factions
		list/allowed_roles
		list/allowed_factions
		donate_money
		next_donate_update
	proc
		update_donate_data(force = FALSE)
			if(!force && world.time < next_donate_update)
				return 0
			update_allowed_factions()
			update_allowed_roles()

			next_donate_update = world.time + DONATE_UPDATE_DELAY
			return 1

		buy_donate_pack(var/datum/donate_pack/D)
			return 1
		update_allowed_factions()
			allowed_factions = list()
			for(var/f in human_factions)
				var/datum/f13_faction/F = human_factions[f]
				if(!(F.flags & DONATE))
					allowed_factions += F
					continue
				if(F in donate_factions)
					allowed_factions += F
			return 1
		update_allowed_roles()
			return 1
