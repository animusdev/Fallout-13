// "Fuck them copypastes, someone pls, make a system for dooor so no one gets to copypaste shit!"
//  - unknown, author of this file
// "The system was always there, you just needed to use it ..."
//  - bauen1, the guy having to clean up the mess
//
//
//
// I know what you feel, bro (and thx). - maxyo

/obj/structure/simple_door
	var/door_type = "wasteland"
	name = "wooden door"
	desc = "It opens and closes."
	icon = 'icons/obj/doors/wasteland_doors.dmi'
	icon_state = "wood"
	opacity = 1
	density = 1
	anchored = 1
	layer = 4.2
	var/opaque = 1
	var/manual_opened = 0
	var/material_count = 10
	var/material_type = /obj/item/stack/sheet/mineral/wood
	var/open_sound = 'sound/machines/door_open.ogg'
	var/close_sound = 'sound/machines/door_close.ogg'

/obj/structure/simple_door/New(location)
	..()
	icon_state = door_type
	SetOpacity(opaque)
	return

/obj/structure/simple_door/Bumped(atom/user)
	..()
	if(density)
		return TryToSwitchState(user, 0)
	return

/obj/structure/simple_door/proc/Open()
	icon_state = "[door_type]open"
	playsound(src.loc, open_sound, 30, 0, 0)
	SetOpacity(0)
	density = 0

/obj/structure/simple_door/proc/Close()
	icon_state = door_type
	playsound(src.loc, close_sound, 30, 0, 0)
	SetOpacity(opaque)
	density = 1
	manual_opened = 0

/obj/structure/simple_door/proc/SwitchState(animate)
	if(density)
		if(animate)
			flick("[door_type]opening", src)
			sleep(2)
		Open()
	else
		var/turf/T = get_turf(src)
		for(var/mob/living/L in T)
			return
		if(animate)
			flick("[door_type]closing", src)
			sleep(4)
		Close()
	return

/obj/structure/simple_door/attackby(obj/item/weapon/I, mob/living/user, params)
	if(!istype(I, /obj/item/stack/sheet/mineral/wood))
		for(var/obj/structure/barricade/wooden/planks/P in src.loc)
			P.attackby(I, user, params)
			return
	if(istype(I, /obj/item/weapon/screwdriver) && do_after(user, 5, target = src))
		for(var/i = 1, i <= material_count, i++)
			new material_type(get_turf(src))
		user << "<span class='notice'>You disassemble [name].</span>"
		playsound(loc, 'sound/items/Screwdriver.ogg', 25, -3)
		qdel(src)
		return
	attack_hand(user)

/obj/structure/simple_door/proc/TryToSwitchState(atom/user, animate)
	if(isliving(user))
		var/mob/living/M = user
		if(/obj/structure/barricade in src.loc)
			M << "It won't budge!"
			return 0
		if(M.client)
			if(iscarbon(M))
				var/mob/living/carbon/C = M
				if(!C.handcuffed)
					SwitchState(animate)
					return 1
			else
				SwitchState(animate)
				return 1
	else if(istype(user, /obj/mecha))
		SwitchState(animate)
		return 1
	return 0
/obj/structure/simple_door/attack_hand(mob/user)
	if(TryToSwitchState(user, 1) && !density)
		manual_opened = 1


/obj/structure/simple_door/attack_tk(mob/user)
	if(TryToSwitchState(user, 1) && !density)
		manual_opened = 1

/obj/structure/simple_door/CanPass(atom/movable/mover, turf/target, height=0)
	if(mover.loc == loc)
		return 1
	return !density

/obj/structure/simple_door/CheckExit(atom/movable/O as mob|obj, target)
	if(!density && !manual_opened && ishuman(O))
		var/mob/living/carbon/human/H = O
		if(H.client && H.stat != 2)
			spawn(2)TryToSwitchState(H) //AutoClosing
	if(O.loc == loc)
		return 1
	return !density

// Doors

/obj/structure/simple_door/wood
	door_type = "wood" // icon_state = "wasteland"

/obj/structure/simple_door/house

	door_type = "house"

/obj/structure/simple_door/room
	door_type = "room"

/obj/structure/simple_door/dirtyglass
	door_type = "dirtyglass"
	opaque = 0
/obj/structure/simple_door/fakeglass
	door_type = "fakeglass"
	name = "damaged wooden door"
	desc = "It still somehow opens and closes."

/obj/structure/simple_door/brokenglass
	door_type = "brokenglass"
	name = "shattered door"
	desc = "It still opens and closes."
	opaque = 0

/obj/structure/simple_door/glass
	door_type = "glass"
	opaque = 0

/obj/structure/simple_door/metal
	name = "metal door"
	material_type = /obj/item/stack/sheet/metal
	open_sound = "sound/f13machines/doorstore_open.ogg"
	close_sound = "sound/f13machines/doorstore_close.ogg"

/obj/structure/simple_door/metal/dirtystore
	door_type = "dirtystore"
	desc = "It's a metal door with dirty glass."
	opaque = 0
/obj/structure/simple_door/metal/store
	door_type = "store"
	opaque = 0
