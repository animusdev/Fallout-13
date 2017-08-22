/obj/machinery/bounty_machine/faction
	/* Available item types and prices. [key] - item type< [value] - item price*/
	var/list/price_list = list()

	/* Will create one copy for each item in price list.*/
	var/list/items_ref_list = list()

	/* How many caps stored in machine */
	var/stored_caps = 0

	/* Only head of this faction will have access to machine */
	var/faction_id = "city"

	/* If true - everyone can use machine. If false - only a faction head */
	var/free_access = 0

	/* In vend mode user can buy items. If not - user can complete quests */
	var/vend_mode = 0

/*
================ Content =====================
*/

/*  CITY */
/obj/machinery/bounty_machine/faction/city
	name = "City CentrComm Terminal"
	desc = "Этот терминал использует мэр, что бы поддерживать связь с внешним миром."
	icon_state = "terminal"
	faction_id = "city"
	quest_type = /datum/bounty_quest/faction/city
	price_list = list(
					/obj/item/stack/sheet/metal/ = 150,
					/obj/item/stack/sheet/rglass = 200,
					/obj/item/stack/sheet/glass = 150,
					/obj/item/clothing/glasses/hud/health = 500,
					/obj/item/weapon/gun/ballistic/automatic/wt550 = 2000,
					/obj/item/weapon/gun/ballistic/shotgun/automatic/dual_tube = 5000,
					/obj/item/seeds/tomato/blood = 1000,
					/obj/item/seeds/tomato/killer = 1500,
					/obj/item/seeds/potato/sweet = 800,
					/obj/item/seeds/banana = 900,
					/obj/item/seeds/tobacco = 1200,
					/obj/item/seeds/grass = 1000,
					/obj/item/seeds/grape = 1200,
					/obj/item/seeds/ambrosia = 1400,
					/obj/item/weapon/implanter/adrenalin = 2500,
					/obj/item/weapon/implanter/storage = 5000,
					/obj/item/seeds/cannabis = 2000,
					/obj/structure/reagent_dispensers/barrel/explosive = 700,
					/obj/item/weapon/surgical_drapes = 300,
					/obj/item/weapon/reagent_containers/glass/beaker/bluespace = 1500,
					/obj/item/weapon/implantcase = 800,
					/obj/item/organ/cyberimp/eyes/xray = 7000,
					/obj/item/organ/cyberimp/eyes/thermals = 8000,
					/obj/item/organ/cyberimp/chest/reviver = 10000,
					/obj/item/weapon/implanter/ = 1000,
					/obj/item/weapon/storage/backpack/holding = 9000,
					/obj/item/clothing/glasses/hud/health/night = 8000,
					/obj/item/weapon/storage/bag/plants/portaseeder = 10000
					)

/*
================ Mechanics ======================
*/
/obj/machinery/bounty_machine/faction/New()
	..()
	for(var/i = 1; i <= price_list.len; i++)
		var/target_type = price_list[i]
		var/atom/A = new target_type(src)
		items_ref_list.Add(A)

/obj/machinery/bounty_machine/faction/Destroy()
	for(var/atom/Itm in items_ref_list)
		qdel(Itm)

/* Add caps */
/obj/machinery/bounty_machine/faction/proc/add_caps(var/obj/item/stack/caps/C)
	if(!C) return
	if(!is_have_access(usr))
		if(free_access)
			to_chat(usr, "Only faction members can use this machine")
		else
			to_chat(usr, "Only faction leader can use this machine")

	var/mob/character = usr
	if(character.unEquip(C))
		var/caps_count = C.amount
		stored_caps += caps_count
		playsound(src, 'sound/items/change_jaws.ogg', 60, 1)
		to_chat(usr, "[stored_caps] caps added.")
		qdel(C)

/* Spawn all caps on world and clear caps storage */
/obj/machinery/bounty_machine/faction/proc/remove_all_caps()
	if(stored_caps <= 0)
		return
	var/obj/item/stack/caps/C = new/obj/item/stack/caps
	if(stored_caps > C.max_amount)
		C.add(C.max_amount - 1)
		C.forceMove(src.loc)
		stored_caps -= C.max_amount
	else
		C.add(stored_caps - 1)
		C.forceMove(src.loc)
		stored_caps = 0
	playsound(src, 'sound/items/coinflip.ogg', 60, 1)
	src.ShowUI(usr)

/* Buy item */
/obj/machinery/bounty_machine/faction/proc/buy(var/item_index, var/mob/user)
	if(item_index > price_list.len)
		to_chat(usr, "Wrong item! *beep*")
		return

	if(!connected_pod)
		to_chat(usr, "No pod connected")
		return

	if(!is_have_access(user))
		if(free_access)
			to_chat(usr, "Only faction members can use this machine")
			return
		else
			to_chat(usr, "Only faction leader can use this machine")
			return

	var/target_type = price_list[item_index]

	// Check price
	if(stored_caps >= price_list[target_type])
		// animation
		flick("tele0", connected_pod)

		//Remove caps
		stored_caps -= price_list[target_type]

		// Create item
		var/atom/NewItem = new target_type(connected_pod.loc)
		to_chat(usr, "Done. *boop*")
	else
		to_chat(usr, "Not enough caps.")

/* Returns 1 if selected mob have acces to use this machine */
/obj/machinery/bounty_machine/faction/proc/is_have_access(var/mob/character)
	var/datum/f13_faction/F = get_faction_datum(character.social_faction)
	var/is_head = F.head_status == character.status ? 1 : 0
	var/is_same_faction = F.id == faction_id ? 1 : 0
	switch(free_access)
		// Free access
		if(1)
			if(is_same_faction)
				return 1
			else
				return 0
		// Only for heads
		if(0)
			if(is_same_faction)
				if(is_head)
					return 1
				else
					return 0
			else
				return 0

/*  INTERACTION */
/obj/machinery/bounty_machine/faction/attackby(obj/item/OtherItem, mob/living/carbon/human/user, parameters)

	// CAPS
	if(istype(OtherItem, /obj/item/stack/caps))
		add_caps(OtherItem)

/* GUI */
/* Shop UI*/
/obj/machinery/bounty_machine/faction/proc/GetShopUI()
	var/dat = "<h1>Faction shop</h1>"
	dat += "<a href='?src=\ref[src];exit=1'>Exit</a><br><br>"
	dat += "<font color = 'green'>Caps stored: [stored_caps]</font>"
	dat += "<a href='?src=\ref[src];removecaps=1'>Remove</a><br>"
	if(free_access)
		dat += "<font color = 'green'><b>Access:</b> Free</font><br>"
	else
		dat += "<font color = 'red'><b>Access:</b> Leader Only</font><br>"

	dat += "<div class='statusDisplay'>"
	for(var/i = 1; i <= price_list.len; i++)
		var/itm_type = price_list[i]
		var/atom/itm_ref = items_ref_list[i]
		var/price = price_list[itm_type]
		if(stored_caps < price_list[itm_type])
			dat += "<a href='?src=\ref[src];examine=[i]'>?</a>"
			dat += "<font color = 'grey'><b> [itm_ref] - [price] </b></font>"
			dat += "<a href='?src=\ref[src];buy=[i]'>Buy</a><br>"
		else
			dat += "<a href='?src=\ref[src];examine=[i]'>?</a>"
			dat += "<font color = 'green'><b> [itm_ref] - [price] </b></font>"
			dat += "<a href='?src=\ref[src];buy=[i]'>Buy</a><br>"
	dat += ""
	dat += "</div>"
	return dat

/* Quest UI */
/obj/machinery/bounty_machine/faction/proc/GetQuestUI()
	var/dat = ""
	var/datum/asset/assets = get_asset_datum(/datum/asset/simple/bounty_employers)
	assets.send(usr)

	dat += "<h1>Wasteland Bounty Station</h1>"

	if(connected_pod)
		dat += "<font color='green'>Pod found</font><br>"
		dat += "<a href='?src=\ref[src];findpod=1'>Rescan</a>"
	else
		dat += "<font color='red'>Pod not found</font><br>"
		dat += "<a href='?src=\ref[src];findpod=1'>Rescan</a>"
	dat += "<a href='?src=\ref[src];shop=1'>Faction Shop</a><br>"
	dat += "<style>.leftimg {float:left;margin: 7px 7px 7px 0;}</style>"

	dat += "<h2>Contracts:</h2>"
	var/item_index = 1
	for(var/datum/bounty_quest/Q in active_quests)
		//usr << browse_rsc(Q.GetIconWithPath(), Q.employer_icon)
		dat += "<div class='statusDisplay'>"
		dat += "<img src=\ref=[Q.employer_icon] class='leftimg' width = 59 height = 70></img>"
		dat += "<font color='green'><b>ID: </b> [Q.name]</font><br>"
		dat += "<font color='green'><b>Employer: </b> [Q.employer]</font><br>"
		dat += "<font color='green'><b>Message:</b></font>"
		dat += "<font color='green'>[Q.desc]</font><br><br>"
		dat += "<font color='green'><b>Acceptable package: </b></font>"
		dat += "<font color='green'><i>[Q.need_message]. </i></font><br>"
		dat += "<font color='green'><b>Reward:</b></font>"
		dat += "<font color='green'> [Q.caps_reward] caps</font><br>"
		dat += "<a href='?src=\ref[src];completequest=[item_index]'>Send package</a><br>"
		dat += "</div>"
		item_index++

	return dat

/obj/machinery/bounty_machine/faction/ShowUI()
	var/dat
	if(vend_mode)
		dat = GetShopUI()
	else
		dat = GetQuestUI()

	var/datum/browser/popup = new(usr, "bounty", "Wasteland Faction Contracts Database", 640, 400) // Set up the popup browser window
	popup.set_content(dat)
	popup.set_title_image(usr.browse_rsc_icon(src.icon, src.icon_state))
	popup.open()

/* Topic */
/obj/machinery/bounty_machine/faction/Topic(href, href_list)
	..()
	if(href_list["exit"])
		vend_mode = 0
	if(href_list["examine"])
		var/itm_index = text2num(href_list["examine"])
		var/obj/T = items_ref_list[itm_index]
		T.examine(usr)
	if(href_list["buy"])
		var/itm_index = text2num(href_list["buy"])
		buy(itm_index, usr)
	if(href_list["shop"])
		vend_mode = 1
	if(href_list["removecaps"])
		remove_all_caps()
	ShowUI()