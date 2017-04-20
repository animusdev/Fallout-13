//Fallout 13 - Loadsamoney!
#define DONATE_UPDATE_DELAY 6000
#define ALL_PACKS_AVAILABLE 1
#define ADDRESS_DONATE_DATA "http://178.33.188.131/payment/user-data.php" //Address of taking donates data. Like money count, packs list.
// NOTICE:
// SERVER MUST HAVE CURL TOOL! This feature use shell to get data.
client
	var
		list/allowed_roles
		list/allowed_factions
		list/content_packs
		donate_money
		next_donate_update
	proc
		update_content_data(force = FALSE)
			if(!force && world.time < next_donate_update)
				return 0
			update_content_packs(FALSE)
			update_allowed_factions()
			load_content_data()

			next_donate_update = world.time + DONATE_UPDATE_DELAY
			return 1

		update_content_packs(reload)
			content_packs = list()
			add_pack("default", reload)
			var/money
			var/packs
			if(curl.Http(ADDRESS_DONATE_DATA, list("ckey" = "[ckey(ckey)]", "action" = "full"), "temp"))
				var/data = file2text("temp")
				var/data_array = splittext(data,":")
				money = data_array[1]
				packs = data_array[2]
			content_packs = splittext(packs,",")
			donate_money = money
#if defined(ALL_PACKS_AVAILABLE)
			for(var/pack in SScontent.all_content_packs)
				add_pack(pack, reload)
#endif

		add_pack(pack_id, reload)
			content_packs |= pack_id
			var/datum/content_pack/pack = SScontent.get_pack(pack_id)
			pack.on_set(src)
			if(reload)
				load_content_data()

		buy_content_pack(pack_id)
			var/datum/content_pack/pack = SScontent.get_pack(pack_id)
			if(donate_money < pack.price)
				return 0
			donate_money -= pack.price
			add_pack(pack_id, TRUE)
			return 1

		load_content_data()
			allowed_roles = list()
			for(var/pack_id in content_packs)
				var/datum/content_pack/D = SScontent.get_pack(pack_id)
				if(D != null)
					allowed_roles += D.roles

		update_allowed_factions()
			allowed_factions = list()
			for(var/f in human_factions)
				var/datum/f13_faction/F = human_factions[f]
				allowed_factions += F
//				if(!(F.flags & DONATE))
//					allowed_factions += F
//					continue
//				if(F in donate_factions)
//					allowed_factions += F
			return 1