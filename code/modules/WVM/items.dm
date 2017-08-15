/* Code by Tienn */

// -- Key --
obj/item/weapon/key/vending
	name = "Vending Machine Key"
	desc = "Ключ от торгового автомата. Вы понимаете, что можете с помощью ручки написать на ключе какую нибудь гадость."
	icon = 'icons/fallout/vehicles/small_vehicles.dmi'
	icon_state = "key-door"
	var/id = 0

obj/item/weapon/key/vending/proc/set_name(newname)
	if(name != newname)
		name = newname + " key"
		playsound(src, 'sound/misc/splort.ogg', 60, 1)

obj/item/weapon/key/vending/attackby(obj/item/weapon/P, mob/living/carbon/human/user, params)
	if(istype(P, /obj/item/weapon/pen) || istype(P, /obj/item/toy/crayon))
		var/newkeyname = input(usr, "Надпись на ключе", "Новое название", name) as null|text
		set_name(newkeyname)
		to_chat(usr, "На ключе теперь написано - " + name)

// -- Lock --
obj/item/weapon/lock_part
	name = "Vending Machine Lock"
	desc = "Выглядит как замок для торгового автомата. Если его раскрутить отверткой, то можно запомнить в нем ваш ключ."
	icon = 'icons/WVM/lock_icon.dmi'
	icon_state = "lock"

	var/is_open = 0
	var/is_secured = 1
	var/keys[0]

obj/item/weapon/lock_part/proc/check_key(obj/item/weapon/key/vending/K)
	if(K in keys)
		return 1
	else
		return 0

obj/item/weapon/lock_part/proc/set_open(var/newopen)
	if(is_open != newopen)
		is_open = newopen

obj/item/weapon/lock_part/proc/store_key(obj/item/weapon/key/vending/K)
	if(is_secured)
		to_chat(usr, "Nothing happens. I need to use screwdriver first")
		return

	if(K in keys)
		to_chat(usr, "Key already stored.")
	else
		keys += K
		playsound(src, 'sound/machines/ding.ogg', 60, 1)
		to_chat(usr, "Now you can unlock this lock by your key..")


obj/item/weapon/lock_part/attackby(obj/item/weapon/P, mob/living/carbon/human/user, params)
	if(istype(P, /obj/item/weapon/screwdriver))
		if(is_secured)
			is_secured = 0
			to_chat(usr, "Now you can store your key.")
		else
			is_secured = 1
			to_chat(usr, "Now this lock can be attached to vending machine.")
		playsound(src, 'sound/items/Screwdriver2.ogg', 60, 1)


	if(istype(P, /obj/item/weapon/key/vending))
		store_key(P)

