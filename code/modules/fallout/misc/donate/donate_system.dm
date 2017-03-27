var/global/list/all_donate_packs = list()

proc/load_donate_packs()
	var/list/all_packs = subtypesof(/datum/donate_pack)
	if(!all_packs.len)
		to_chat(world, "<span class='boldannounce'>Error setting up jobs, no donate packs datums found</span>")
		return 0
	for(var/type in all_packs)
		var/datum/donate_pack/D = new type()
		all_donate_packs[D.id] = D

client
	var
		donate_packs
		donate_roles
		donate_money
	proc
		update_donate_data()
			return 1
		buy_donate_pack(var/datum/donate_pack/D)
			return 1
