#define STATE_IDLE 0
#define STATE_SERVICE 1
#define STATE_VEND 2
#define STATE_LOCKOPEN 3

/obj/machinery/trading_machine
	name = "Wastland Vending Machine"
	desc = "Пост автоматической торговли! Приготовьте ваши крышки!"

	icon = 'icons/obj/vending.dmi'
	icon_state = "sec"
	var/idle_icon_state = "sec"
	var/service_icon_state = "sec-broken"

	anchored = 1
	density = 1
	verb_say = "beeps"
	verb_ask = "beeps"
	verb_exclaim = "beeps"
	obj_integrity = 300
	max_integrity = 300
	integrity_failure = 100
	armor = list(melee = 20, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0, fire = 50, acid = 70)

	var/category_icon_state[0]
	var/stored_item_type = /obj/item/weapon/gun

	var/content[0]		// store items
	var/stored_caps = 0	// store caps

	var/obj/item/weapon/lock_part/lock = null
	var/machine_state = STATE_IDLE // 0 - working, 1 - on service, 2 - on vending, 3 - open lock
	var/id = 0
	var/create_lock = 1
	var/create_key = 1
	var/basic_price = 20
	var/expected_price = 0
	var/obj/item/vending_item

/obj/machinery/trading_machine/weapon
	name = "Weapon Vending Machine"
	icon_state = "sec"
	idle_icon_state = "sec"
	service_icon_state = "sec-broken"
	stored_item_type = /obj/item/weapon/gun

/obj/machinery/trading_machine/ammo
	name = "Ammo Vending Machine"
	icon_state = "engi"
	idle_icon_state = "engi"
	service_icon_state = "engi-off"
	stored_item_type = /obj/item/ammo_box

/obj/machinery/trading_machine/armor
	name = "Armor Vending Machine"
	icon_state = "robotics"
	idle_icon_state = "robotics"
	service_icon_state = "robotics-off"
	stored_item_type = /obj/item/clothing

/obj/machinery/trading_machine/medical
	name = "Medicine Vending Machine"
	icon_state = "med"
	idle_icon_state = "med"
	service_icon_state = "med-off"
	stored_item_type = /obj/item/weapon/reagent_containers

/* Initialization */
/obj/machinery/trading_machine/New()
	if(create_lock)
		lock = new/obj/item/weapon/lock_part()
	if(create_key)
		var/obj/item/weapon/key/vending/K = new/obj/item/weapon/key/vending()
		K.name = "[src.name] key"
		K.forceMove(src.loc)
		if(lock)
			lock.store_key(K)

	// Init sprites
	category_icon_state["Weapons"] = "sec"
	category_icon_state["Ammo"] = "boozeomat"
	category_icon_state["Armor"] = "engi"
	category_icon_state["Medical"] = "med"



/* Adding item to machine and spawn Set Price dialog */
/obj/machinery/trading_machine/proc/add_item(obj/item/Itm, mob/living/carbon/human/user)
	if(machine_state != STATE_SERVICE)
		return

	if(is_available_category(Itm))
		var/price = input(usr, "Enter price for " + Itm.name + ".", "Setup Price", basic_price) as null|text
		content[Itm] = price

		if(istype(Itm.loc, /mob))
			var/mob/M = Itm.loc
			if(!M.unEquip(Itm))
				to_chat(usr, "<span class='warning'>\the [Itm] is stuck to your hand, you cannot put it in \the [src]!</span>")
				return

		Itm.forceMove(src)
		to_chat(usr, Itm.name +" выставлен на продажу за " + content[Itm] + " крышек.")
		src.showUI(usr)



/* Check item type and compare it with stored_item_type */
/obj/machinery/trading_machine/proc/is_available_category(obj/item/Itm)
	if(istype(Itm, stored_item_type))
		return 1
	else
		return 0



/* Remove item from machine. */
/obj/machinery/trading_machine/proc/remove_item(obj/item/ItemToRemove)
	if(content.Remove(ItemToRemove))
		ItemToRemove.forceMove(src.loc)
		src.showUI(usr)



/* Adding a caps to caps storage and release vending item. */
/obj/machinery/trading_machine/proc/add_caps(obj/item/stack/caps/C)
	if(machine_state != STATE_VEND)
		return

	if(C.use(expected_price))
		stored_caps += expected_price
		remove_item(vending_item)
		to_chat(usr, "Caps added.")
		set_state(STATE_IDLE)
		src.showUI(usr)
	else
		to_chat(usr, "Not enough caps")



/* Spawn all caps on world and clear caps storage */
/obj/machinery/trading_machine/proc/remove_all_caps()
	var/obj/item/stack/caps/C = new/obj/item/stack/caps
	if(stored_caps > C.max_amount)
		C.add(C.max_amount)
		C.forceMove(src.loc)
		stored_caps -= C.max_amount
	else
		C.add(stored_caps)
		C.forceMove(src.loc)
		stored_caps = 0
	src.showUI(usr)



/* Storing item and price and switch machine to vending mode*/
/obj/machinery/trading_machine/proc/vend(obj/item/Itm)
	if(content.Find(Itm))
		vending_item = Itm
		expected_price = text2num(content[Itm])
		set_state(STATE_VEND)
		src.attack_hand(usr)



/* Remove lock from machine */
/obj/machinery/trading_machine/proc/drop_lock()
	if(!lock)
		to_chat(usr, "No lock here.")
		return

	lock.forceMove(loc)
	lock = null
	src.showUI(usr)



/* Assign lock to this machine */
/obj/machinery/trading_machine/proc/set_lock(obj/item/weapon/lock_part/newLock)
	if(lock)
		to_chat(usr, "Тут уже установлен замок")
		return
	else
		lock = newLock
		if(usr.unEquip(lock))
			lock.forceMove(src)
			to_chat(usr, "Замок установлен")
	src.showUI(usr)



/* Switch machine to service mode */
/obj/machinery/trading_machine/proc/set_service(var/newMode)
	switch(machine_state)
		if(0)
			if(newMode)
				set_state(STATE_SERVICE)
		if(1)
			if(!newMode)
				set_state(STATE_IDLE)

	if(machine_state == STATE_SERVICE)
		to_chat(usr, "Vending Machine now on service")
	else
		to_chat(usr, "Vending Machine now working")
	src.showUI(usr)



/* Update icon depends on machine_state */
/obj/machinery/trading_machine/proc/updateIcon()
	switch(machine_state)
		if(STATE_IDLE)
			cut_overlays()
			icon_state = idle_icon_state
		if(STATE_SERVICE)
			cut_overlays()
			icon_state = service_icon_state
		if(STATE_VEND)
			cut_overlays()
			icon_state = idle_icon_state
		if(STATE_LOCKOPEN)
			cut_overlays()
			icon_state = service_icon_state
			add_overlay(image(icon, "[initial(icon_state)]-panel"))


/* Seting machine state and update icon*/
/obj/machinery/trading_machine/proc/set_state(var/new_state)
	if(machine_state == new_state)
		return

	if(new_state == STATE_IDLE && !lock)
		return

	machine_state = new_state
	updateIcon()



/* Attack By */
/obj/machinery/trading_machine/attackby(obj/item/OtherItem, mob/living/carbon/human/user, parameters)
	switch(machine_state)
		if(STATE_IDLE) // working

			/* Vending Key */
			if(istype(OtherItem, /obj/item/weapon/key/vending))
				if(lock)
					var/obj/item/weapon/key/vending/used_key = OtherItem
					if(lock.check_key(OtherItem))
						set_service(STATE_SERVICE)
					else
						to_chat(usr, "Unknown key.")
				else
					to_chat(usr, "No lock here")

			/* Other */
			else
				attack_hand(user)

		if(STATE_SERVICE) // service

			/* Screwdriver */
			if(istype(OtherItem, /obj/item/weapon/screwdriver/))
				set_state(STATE_LOCKOPEN)

			/* Locker */
			if(istype(OtherItem, /obj/item/weapon/lock_part))
				set_lock(OtherItem)

			/* Key */
			if(istype(OtherItem, /obj/item/weapon/key/vending))
				if(lock)
					var/obj/item/weapon/key/vending/used_key = OtherItem
					if(lock.check_key(OtherItem) || id == used_key.id)
						set_service(0)
					else
						to_chat(usr, "Unknown key.")
				else
					to_chat(usr, "No lock")
			else if(istype(OtherItem, /obj/item/))
				add_item(OtherItem, user)
			else
				attack_hand(user)

		if(STATE_VEND) // vending
			// Caps
			if(istype(OtherItem, /obj/item/stack/caps))
				add_caps(OtherItem)
			else
				attack_hand(user)

		if(STATE_LOCKOPEN)
			if(istype(OtherItem, /obj/item/weapon/screwdriver))
				set_state(STATE_SERVICE)

			if(istype(OtherItem, /obj/item/weapon/crowbar))
				drop_lock()

			if(istype(OtherItem, /obj/item/weapon/lock_part))
				set_lock(OtherItem)

	src.showUI(user)


/* Examine */
/obj/machinery/trading_machine/examine(mob/user)
	..(user)
	var/msg
	msg += "Wastland Vending Machine<BR>"
	msg += "Lock: " + lock + "<BR>"
	to_chat(user, msg)



/* Spawn input dialog and set item price */
/obj/machinery/trading_machine/proc/set_price_by_input(obj/item/Itm, mob/user)
	if(machine_state != 1)
		return

	var/new_price = input(user, "Enter price for " + Itm.name + ".", "Setup Price", content[Itm]) as null|text
	if(new_price)
		content[Itm] = new_price
		src.showUI(user)



/* Find item by name and price in content and return type */
/obj/machinery/trading_machine/proc/find_item(var/item_name, var/item_price)
	for(var/obj/item/Itm in content)
		if(content[Itm] == item_price && Itm.name == item_name)
			return Itm



/* Attack Hand */
/obj/machinery/trading_machine/attack_hand(mob/user)
	showUI(user)



/* Design UI here */
/obj/machinery/trading_machine/proc/showUI(mob/user)
	var/dat = ""
	switch(machine_state)
		// --- Work
		if(STATE_IDLE)
			dat += "<h3>Select an item</h3>"
			dat += "<div class='statusDisplay'>"
			if(content.len == 0)
				dat += "<font color = 'red'>No product loaded!</font>"
			else
				for(var/obj/item/Itm in content)
					var/item_name = url_encode(Itm.name);
					var/price = content[Itm]
					dat += "<a href='byond://?src=\ref[src];vend=[item_name];current_price=[price]'> [url_decode(item_name)] for [price] caps</a><br> "

			var/datum/browser/popup = new(user, "vending", (name))
			popup.set_content(dat)
			popup.set_title_image(user.browse_rsc_icon(src.icon, src.icon_state))
			popup.open()
		//--- Service
		if(STATE_SERVICE)
			dat += "<h3>Machine setup menu</h3>"
			dat += "<div class='statusDisplay'>"
			dat += "<font color='green'>Caps stored - [stored_caps]</font>"
			dat += "<a href='?src=\ref[src];removecaps=1'>Unload</a>"
			dat += "<h4> Items </h4> "

			if(content.len == 0)
				dat += "<font color = 'red'>No product loaded!</font>"
			else
				for(var/obj/item/Itm in content)
					var/item_name = Itm
					var/price = content[Itm]
					dat += "<b>[item_name]</b> - [content[Itm]] caps"
					dat += "<a href='?src=\ref[src];setprice=[item_name];current_price=[price]'>Set price</a> "
					dat += "<a href='?src=\ref[src];remove=[item_name];current_price=[price]'>Remove</a> <br>"

			var/datum/browser/popup = new(user, "vending", (name))
			popup.set_content(dat)
			popup.set_title_image(user.browse_rsc_icon(src.icon, src.icon_state))
			popup.open()
		// --- Vend
		if(STATE_VEND)
			dat += "<h3>Select an item</h3>"
			dat += "<div class='statusDisplay'>"
			dat += "<font color = 'red'>Waiting for [expected_price] caps!</font>"
			dat += "<a href='?src=\ref[src];back=1'> Back</a> "

			var/datum/browser/popup = new(user, "vending", (name))
			popup.set_content(dat)
			popup.set_title_image(user.browse_rsc_icon(src.icon, src.icon_state))
			popup.open()
		// --- Lock Open
		if(STATE_LOCKOPEN)
			return



/* TOPIC */
/obj/machinery/trading_machine/Topic(href, href_list)
	if(..())
		return

	if(href_list["vend"])
		var/vend_item_name = href_list["vend"]
		var/actual_price = href_list["current_price"]
		to_chat(usr, "Vending [vend_item_name]...")
		var/obj/item/I = find_item(vend_item_name, actual_price)
		if(I)
			vend(I)

	if(href_list["back"])
		to_chat(usr, "Machine is working")
		src.set_state(STATE_IDLE)
		showUI(usr)

	if(href_list["setprice"])
		to_chat(usr, "Set new price...")
		var/vend_item_name = href_list["setprice"]
		var/actual_price = href_list["current_price"]
		var/obj/item/I = find_item(vend_item_name, actual_price)
		if(I)
			set_price_by_input(I, usr)

	if(href_list["remove"])
		var/vend_item_name = href_list["remove"]
		var/actual_price = href_list["current_price"]
		var/obj/item/I = find_item(vend_item_name, actual_price)
		if(I)
			to_chat(usr, "Unloading item [href_list["unload"]]")
			remove_item(I)

	if(href_list["removecaps"])
		remove_all_caps()

	showUI()