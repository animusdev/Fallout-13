/* Code by Tienn */
/* Sprites by Moonmandoom*/

#define STATE_IDLE 0
#define STATE_SERVICE 1
#define STATE_VEND 2
#define STATE_LOCKOPEN 3

/obj/machinery/trading_machine
	name = "Wastland Vending Machine"
	desc = "���� �������������� ��������! ����������� ���� ������!"

	icon = 'icons/obj/vending.dmi'
	icon_state = "sec"
	var/idle_icon_state = "sec"
	var/service_icon_state = "sec-broken"
	var/lock_icon_state = "sec-broken"

	anchored = 1
	density = 1
	verb_say = "beeps"
	verb_ask = "beeps"
	verb_exclaim = "beeps"
	obj_integrity = 300
	max_integrity = 300
	integrity_failure = 100
	armor = list(melee = 20, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0, fire = 50, acid = 70)

	var/stored_item_type = list()

	var/content[0]		// store items
	var/stored_caps = 0	// store caps

	var/obj/item/weapon/lock_part/lock = null
	var/machine_state = STATE_IDLE // 0 - working, 1 - on service, 2 - on vending, 3 - open lock
	var/id = 0
	var/create_lock = 1
	var/create_key = 1
	var/create_description = 1
	var/basic_price = 20
	var/expected_price = 0
	var/obj/item/vending_item
	var/item_not_acceptable_message = "Something wrong... Cant insert item."

/* Weapon Vending Machine*/
/obj/machinery/trading_machine/weapon
	name = "Weapon Vending Machine"

	icon = 'icons/WVM/machines.dmi'
	icon_state = "weapon_idle"
	idle_icon_state = "weapon_idle"
	service_icon_state = "weapon_service"
	lock_icon_state = "weapon_lock"

	stored_item_type = list(/obj/item/weapon/gun)
	item_not_acceptable_message = "You need to remove ammo from your weapon first."

/* Ammo Vending Machine*/
/obj/machinery/trading_machine/ammo
	name = "Ammo Vending Machine"
	icon = 'icons/WVM/machines.dmi'
	icon_state = "ammo_idle"
	idle_icon_state = "ammo_idle"
	service_icon_state = "ammo_service"
	lock_icon_state = "ammo_lock"
	stored_item_type = list(/obj/item/ammo_box, /obj/item/weapon/stock_parts/cell)

/* Armor Vending Machine*/
/obj/machinery/trading_machine/armor
	name = "Armor Vending Machine"
	icon = 'icons/WVM/machines.dmi'
	icon_state = "armor_idle"
	idle_icon_state = "armor_idle"
	service_icon_state = "armor_service"
	lock_icon_state = "armor_lock"
	stored_item_type = list(/obj/item/clothing)

/* Medical Vending Machine*/
/obj/machinery/trading_machine/medical
	name = "Medicine Vending Machine"
	icon = 'icons/WVM/machines.dmi'
	icon_state = "med_idle"
	idle_icon_state = "med_idle"
	service_icon_state = "med_service"
	lock_icon_state = "med_lock"
	stored_item_type = list(/obj/item/weapon/reagent_containers)

/* Initialization */
/obj/machinery/trading_machine/New()
	if(create_lock)
		lock = new/obj/item/weapon/lock_part()
		lock.forceMove(src)
	if(create_key)
		var/obj/item/weapon/key/vending/K = new/obj/item/weapon/key/vending()
		K.name = "[src.name] key"
		K.forceMove(src.loc)
		if(lock)
			lock.is_secured = 0
			lock.store_key(K)
			lock.is_secured = 1
	if(create_description)
		var/obj/item/weapon/paper/P = new /obj/item/weapon/paper
		P.info = get_paper_description_data()
		P.update_icon()
		P.forceMove(src.loc)

/* Adding item to machine and spawn Set Price dialog */
/obj/machinery/trading_machine/proc/add_item(obj/item/Itm, mob/living/carbon/human/user)
	if(machine_state != STATE_SERVICE)
		return

	if(is_available_category(Itm) && is_acceptable_item_state(Itm))
		var/price = input(usr, "Enter price for " + Itm.name + ".", "Setup Price", basic_price) as null|text
		if(!price)
			return

		content[Itm] = price

		if(istype(Itm.loc, /mob))
			var/mob/M = Itm.loc
			if(!M.unEquip(Itm))
				to_chat(usr, "<span class='warning'>\the [Itm] is stuck to your hand, you cannot put it in \the [src]!</span>")
				return

		Itm.forceMove(src)
		playsound(src, 'sound/items/change_jaws.ogg', 60, 1)
		to_chat(usr, "You loaded [Itm.name] to vending machine. New price - [content[Itm]] caps..")
		src.showUI(usr)
	else
		if(!is_available_category(Itm))
			playsound(src, 'sound/machines/DeniedBeep.ogg', 60, 1)
			to_chat(usr, "*beep* ..wrong item.")
		else if (!is_acceptable_item_state(Itm))
			playsound(src, 'sound/machines/DeniedBeep.ogg', 60, 1)
			to_chat(usr, item_not_acceptable_message)


/* Check item type and compare it with stored_item_type */
/obj/machinery/trading_machine/proc/is_available_category(obj/item/Itm)
	for(var/item_type in stored_item_type)
		if(istype(Itm, item_type))
			return 1
	return 0

/* Hook for check item parameters */
/obj/machinery/trading_machine/proc/is_acceptable_item_state(obj/item/Itm)
	return 1

/* Check acceptable item in Weapon Wending Machine */
/obj/machinery/trading_machine/weapon/is_acceptable_item_state(obj/item/Itm)

	// It's energy weapon
	if(istype(Itm, /obj/item/weapon/gun/energy))
		var/obj/item/weapon/gun/energy/Gun = Itm
		if(Gun.power_supply)
			return 0
		else
			return 1

	// It's balistic weapon
	else if(istype(Itm, /obj/item/weapon/gun/ballistic))
		var/obj/item/weapon/gun/ballistic/Gun = Itm
		if(istype(Itm, /obj/item/weapon/gun/ballistic/revolver))
			if(Gun.magazine.ammo_count(0) > 0)
				return 0
			else
				return 1

		else if(istype(Itm, /obj/item/weapon/gun/ballistic/automatic))
			if(Gun.magazine)
				return 0
			else
				return 1

		else if(istype(Itm, /obj/item/weapon/gun/ballistic/shotgun))
			if(Gun.magazine.ammo_count(0) > 0)
				return 0
			else
				return 1

	else
		return 1

/* Remove item from machine. */
/obj/machinery/trading_machine/proc/remove_item(obj/item/ItemToRemove)
	if(content.Remove(ItemToRemove))
		ItemToRemove.forceMove(src.loc)
		playsound(src, 'sound/items/change_jaws.ogg', 60, 1)
		src.showUI(usr)

/* Adding a caps to caps storage and release vending item. */
/obj/machinery/trading_machine/proc/add_caps(obj/item/stack/caps/C)
	if(machine_state != STATE_VEND)
		return

	if(C.use(expected_price))
		stored_caps += expected_price
		playsound(src, 'sound/items/change_jaws.ogg', 60, 1)
		remove_item(vending_item)
		to_chat(usr, "You put [expected_price] caps to vending machine. Your item")
		set_state(STATE_IDLE)
		src.showUI(usr)
	else
		playsound(src, 'sound/machines/DeniedBeep.ogg', 60, 1)
		to_chat(usr, "Not enough caps")

/* Spawn all caps on world and clear caps storage */
/obj/machinery/trading_machine/proc/remove_all_caps()
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
	playsound(src, 'sound/items/change_jaws.ogg', 60, 1)
	src.showUI(usr)

/* Assign lock to this machine */
/obj/machinery/trading_machine/proc/set_lock(obj/item/weapon/lock_part/newLock)
	if(lock)
		playsound(src, 'sound/machines/DeniedBeep.ogg', 60, 1)
		to_chat(usr, "This machine is already have a lock")
		return
	else
		lock = newLock
		if(usr.unEquip(lock))
			lock.forceMove(src)
			playsound(src, 'sound/items/change_jaws.ogg', 60, 1)
			to_chat(usr, "Lock installed.")
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
			icon_state = lock_icon_state
			add_overlay(image(icon, "[initial(icon_state)]-panel"))

/* Seting machine state and update icon */
/obj/machinery/trading_machine/proc/set_state(var/new_state)
	if(machine_state == new_state)
		return

	if(new_state == STATE_IDLE && !lock)
		return

	if(!anchored)
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
					if(lock.check_key(OtherItem))
						set_service(STATE_SERVICE)
						playsound(src, 'sound/items/Ratchet.ogg', 60, 1)
					else
						playsound(src, 'sound/machines/DeniedBeep.ogg', 60, 1)
						to_chat(usr, "Unknown key.")
				else
					playsound(src, 'sound/machines/DeniedBeep.ogg', 60, 1)
					to_chat(usr, "No lock here")

			/* Other */
			else
				attack_hand(user)

		if(STATE_SERVICE) // service

			/* Screwdriver */
			if(istype(OtherItem, /obj/item/weapon/screwdriver/))
				set_state(STATE_LOCKOPEN)
				playsound(src, 'sound/items/Screwdriver.ogg', 60, 1)

			/* Locker */
			if(istype(OtherItem, /obj/item/weapon/lock_part))
				set_lock(OtherItem)
				playsound(src, 'sound/items/Crowbar.ogg', 60, 1)

			/* Key */
			if(istype(OtherItem, /obj/item/weapon/key/vending))
				if(lock)
					var/obj/item/weapon/key/vending/used_key = OtherItem
					if(lock.check_key(OtherItem) || id == used_key.id)
						set_state(STATE_IDLE)
						playsound(src, 'sound/items/Ratchet.ogg', 60, 1)
					else
						playsound(src, 'sound/machines/DeniedBeep.ogg', 60, 1)
						to_chat(usr, "Unknown key.")
				else
					playsound(src, 'sound/machines/DeniedBeep.ogg', 60, 1)
					to_chat(usr, "No lock")


			else if(is_available_category(OtherItem))
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
			/* Screwdriver */
			if(istype(OtherItem, /obj/item/weapon/screwdriver))
				set_state(STATE_SERVICE)
				playsound(src, 'sound/items/Screwdriver2.ogg', 60, 1)


			/* Wrench */
			else if(istype(OtherItem, /obj/item/weapon/wrench))
				if(src.can_be_unfasten_wrench(user))
					var/prev_anchor = anchored
					src.default_unfasten_wrench(user, OtherItem)
					if(anchored != prev_anchor)
						playsound(src, 'sound/items/Ratchet.ogg', 60, 1)

			/* Crowbar */
			else if(istype(OtherItem, /obj/item/weapon/crowbar))
				drop_lock()

			else if(istype(OtherItem, /obj/item/weapon/lock_part))
				var/obj/item/weapon/lock_part/P = OtherItem
				if(P.is_secured)
					set_lock(OtherItem)
				else
					playsound(src, 'sound/machines/DeniedBeep.ogg', 60, 1)
					to_chat(usr, "You need to secure lock first. Use screwdriver.")

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
	if(machine_state != STATE_SERVICE)
		return

	var/new_price = input(user, "Enter price for " + Itm.name + ".", "Setup Price", content[Itm]) as null|text
	if(new_price)
		content[Itm] = new_price
		playsound(src, 'sound/machines/terminal_prompt_confirm.ogg', 60, 1)
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
	var/datum/browser/popup = new(user, "vending", (name))
	popup.set_content(get_ui_content(machine_state))
	popup.set_title_image(user.browse_rsc_icon(src.icon, src.icon_state))
	popup.open()

/obj/machinery/trading_machine/proc/get_ui_content(var/state)
	var/dat = ""
	switch(state)
		// --- Work
		if(STATE_IDLE)
			dat += "<h3>Select an item</h3>"
			dat += "<div class='statusDisplay'>"
			if(content.len == 0)
				dat += "<font color = 'red'>No product loaded!</font>"
			else
				for(var/obj/item/Itm in content)
					var/item_name = url_encode(Itm.name)
					var/price = content[Itm]
					dat += "<a href='byond://?src=\ref[src];vend=[item_name];current_price=[price]'>[Itm.name] | [price] caps</a> "
					dat += "<a href='byond://?src=\ref[src];examine=[item_name];current_price=[price]'>Examine</a><br> "

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
					var/item_name = url_encode(Itm.name)
					var/price = content[Itm]
					dat += "<b>[Itm.name]</b> - [content[Itm]] caps"
					dat += "<a href='?src=\ref[src];setprice=[item_name];current_price=[price]'>Set price</a> "
					dat += "<a href='?src=\ref[src];remove=[item_name];current_price=[price]'>Remove</a> <br>"

		// --- Vend
		if(STATE_VEND)
			dat += "<h3>Select an item</h3>"
			dat += "<div class='statusDisplay'>"
			dat += "<font color = 'red'>Waiting for [expected_price] caps!</font>"
			dat += "<a href='?src=\ref[src];back=1'> Back</a> "

		// --- Lock Open
		if(STATE_LOCKOPEN)
			dat += ""

	return dat

/obj/machinery/trading_machine/proc/get_paper_description_data()
	var/data
	data += "<h1> Wasteland Wending Machines </h1>"
	data += "Wasteland Trading Company ����������� ��� � ������������� ������ ��������� ��������! �� � ����� ���� �� ��������! <br><br>����������� � ����� ����������� � ������ - ������������ ������!<br><br>"
	data += "1. ������� ����, ���������� ������ ��������. �� ������ ������ �� ������ �� ������ ��������.<br>"
	data += "2. �������� ������� ������, ����� ��������� ��� � ��������� �����. <br>"
	data += "3. �� �������� ������� ������ �������� ������, ����� ��������� ��� ������� � ����� ��������.<br><br>"

	data += "����� ��������� ������� �� �������:<br>"
	data += "1. �������� ��������� ������ �������� ������.<br>"
	data += "2. �������� ������� � ������� (��������� ��� ������� ����������)<br>"
	data += "3. ���������� ���� �������� � �������.<br>"
	data += "4. �������� ������ ��������� ������.<br><br>"

	data += "����� ������� ����������� ������:<br>"
	data += "1. �������� ��������� ������ �������� ������.<br>"
	data += "2. � ���� ������� �� ������ Unload �������� ���������� ������.<br>"
	data += "������ �������� �� �����.<br><br>"

	data += "����� �������� ������ � ��������:<br>"
	data += "1. �������� ��������� ������ �������� ������.<br>"
	data += "2. ��������� ��������� ��������� �����. <br>"
	data += "3. ����� ��������� �����. <br>"
	data += "4. ��������� ���������� �����. <br>"
	data += "5. ������� ����� ���� � �����. ������ ������� ��� � ����������� ������� <br>"
	data += "6. ��������� ����� ���������. <br>"
	data +=	"7. �������� ����� ������� � �������. <br>"
	data += "8. ��������� ���������� ����� ������ ��������. <br>"
	data += "9. �������� ��������� ������ ������. <br>"
	data += "������ �� ������ ������� ��������� ������ �������� ����� �������.<br><br>"

	data += "��� �� ��������� ������� �� ����� �����:<br>"
	data += "1. �������� ��������� ������ �������� ������.<br>"
	data += "2. ��������� ��������� ��������� �����. <br>"
	data += "3. ������� ������ ��������� ��������� ��������. <br>"
	data += "4. �������� ������� � ����� ������� ��� ��� �����. <br>"
	data += "5. ���������� ��������� �������� ������� ������. <br>"
	data += "6. ��������� ����� ���������. <br>"
	data += "7. �������� ��������� ������ ������. <br><br>"

	data += "� ��������� - ������ ������� ����� ��������� ����� ����� ��������."
	return data



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

	if(href_list["examine"])
		var/item_name = href_list["examine"]
		var/actual_price = href_list["current_price"]
		var/obj/item/I = find_item(item_name, actual_price)
		I.examine(usr)


	showUI()