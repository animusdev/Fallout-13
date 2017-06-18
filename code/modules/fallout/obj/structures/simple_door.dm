//In the beginning of time, there was a door subtype called /dooor/ to allow a shitcode copypaste.
// "Fuck them copypastes, someone pls, make a system for dooor so no one gets to copypaste shit!"
//  - bartnixon
// "The system was always there, you just needed to use it ..."
//  - bauen1, the guy having to clean up the mess
// "I know what you feel, bro (and thx)."
//  - maxyo

/obj/structure/simple_door
	name = "wooden door"
	desc = "It opens and closes - nothing out of the ordinary."
	icon = 'icons/fallout/objects/structures/doors.dmi'
	icon_state = "house"
	opacity = 1
	density = 1
	anchored = 1
	layer = CLOSED_DOOR_LAYER
	explosion_block = 0.5
	var/door_type = "house"
	var/opaque = 1
	var/manual_opened = 0
	var/material_count = 10
	var/hard_open = 1
	var/moving = 0
	var/material_type = /obj/item/stack/sheet/mineral/wood
	var/can_disasemble = 0
	var/open_sound = 'sound/machines/door_open.ogg'
	var/close_sound = 'sound/machines/door_close.ogg'
	var/opening_time = 2
	var/closing_time = 4

/obj/structure/simple_door/New(location)
	..()
	icon_state = door_type
	set_opacity(opaque)
	return
/*
/obj/structure/simple_door/bullet_act(var/obj/item/projectile/Proj)
	..()
*/
/obj/structure/simple_door/Bumped(atom/user)
	..()
	if(density)
		if(hard_open)
			return TryToSwitchState(user, 0)
		else
			return TryToSwitchState(user, 1)
	return

/obj/structure/simple_door/proc/Open(animate)
	playsound(src.loc, open_sound, 30, 0, 0)
	if(animate)
		moving = 1
		flick("[door_type]opening", src)
		sleep(opening_time)
		moving = 0
	set_opacity(0)
	density = 0
	icon_state = "[door_type]open"
	layer = OPEN_DOOR_LAYER

/obj/structure/simple_door/proc/Close(animate)
	playsound(src.loc, close_sound, 30, 0, 0)
	manual_opened = 0
	if(animate)
		moving = 1
		flick("[door_type]closing", src)
		sleep(closing_time)
	icon_state = door_type
	set_opacity(opaque)
	density = 1
	moving = 0
	layer = CLOSED_DOOR_LAYER

/obj/structure/simple_door/proc/SwitchState(animate)
	if(density)
		Open(animate)
	else
		var/turf/T = get_turf(src)
		for(var/mob/living/L in T)
			return
		Close(animate)
	return 1

/obj/structure/simple_door/attackby(obj/item/weapon/I, mob/living/user, params)
	if(!istype(I, /obj/item/stack/sheet/mineral/wood))
		for(var/obj/structure/barricade/wooden/planks/P in src.loc)
			P.attackby(I, user, params)
			return
	if(istype(I, /obj/item/weapon/screwdriver) && can_disasemble && do_after(user, 5, target = src))
		for(var/i = 1, i <= material_count, i++)
			new material_type(get_turf(src))
		user << "<span class='notice'>You disassemble [name].</span>"
		playsound(loc, 'sound/items/Screwdriver.ogg', 25, -3)
		qdel(src)
		return
	attack_hand(user)

/obj/structure/simple_door/proc/TryToSwitchState(atom/user, animate)
	if(moving)
		return 0
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
			if(hard_open)
				spawn(H.movement_delay())TryToSwitchState(H) //AutoClosing
			else
				spawn(H.movement_delay())TryToSwitchState(H,1)
	if(O.loc == loc)
		return 1
	return !density

// Fallout 13 general doors directory

/obj/structure/simple_door/house
	icon_state = "house"
	door_type = "house"
	can_disasemble = 1

/obj/structure/simple_door/interior
	icon_state = "interior"
	door_type = "interior"
	can_disasemble = 1

/obj/structure/simple_door/room
	icon_state = "room"
	door_type = "room"
	can_disasemble = 1

/obj/structure/simple_door/dirtyglass
	desc = "A glass is dirty, you can't see a thing behind it."
	icon_state = "dirtyglass"
	door_type = "dirtyglass"

/obj/structure/simple_door/fakeglass
	name = "damaged wooden door"
	desc = "It still somehow opens and closes."
	icon_state = "fakeglass"
	door_type = "fakeglass"

/obj/structure/simple_door/brokenglass
	name = "shattered door"
	desc = "It still opens and closes."
	icon_state = "brokenglass"
	door_type = "brokenglass"
	opaque = 0

/obj/structure/simple_door/glass
	desc = "A glass is quite clean, someone took care of this door."
	icon_state = "glass"
	door_type = "glass"
	opaque = 0

/obj/structure/simple_door/wood
	icon_state = "wood"
	door_type = "wood"
	can_disasemble = 1

/obj/structure/simple_door/metal
	name = "metal door"
	material_type = /obj/item/stack/sheet/metal
	open_sound = "sound/f13machines/doorstore_open.ogg"
	close_sound = "sound/f13machines/doorstore_close.ogg"
	explosion_block = 2

/obj/structure/simple_door/metal/dirtystore
	desc = "A metal door with dirty glass, you can't see a thing behind it."
	icon_state = "dirtystore"
	door_type = "dirtystore"

/obj/structure/simple_door/metal/store
	icon_state = "store"
	door_type = "store"
	opaque = 0
	can_disasemble = 1

/obj/structure/simple_door/metal/barred
	name = "barred door"
	desc = "Bars. No matter which side we're on, aren't we always behind them?"
	icon_state = "barred"
	door_type = "barred"
	open_sound = "sound/f13machines/doorchainlink_open.ogg"
	close_sound = "sound/f13machines/doorchainlink_close.ogg"
	opaque = 0

/obj/structure/simple_door/metal/ventilation
	name = "ventilation system"
	desc = "As you take a closer look, you notice a handle at the bottom of ventilation system access hatch."
	icon_state = "ventilation"
	door_type = "ventilation"
	open_sound = "sound/f13machines/doorhidden_open.ogg"
	close_sound = "sound/f13machines/doorhidden_close.ogg"
	hard_open = 0
	opening_time = 25
	closing_time = 20

/obj/structure/simple_door/metal/vault
	name = "vault wall"
	desc = "A sturdy and cold metal wall."
	icon = 'icons/fallout/turfs/walls/vault.dmi'
	icon_state = "vaultfwall"
	door_type = "vaultfwall"
	open_sound = "sound/f13items/flashlight_on.ogg"
	close_sound = "sound/f13items/flashlight_off.ogg"

/obj/structure/simple_door/metal/vaultreinforced
	name = "vault reinforced wall"
	desc = "A wall built to withstand an atomic explosion."
	icon = 'icons/fallout/turfs/walls/vault_reinforced.dmi'
	icon_state = "vaultfrwall"
	door_type = "vaultfrwall"
	open_sound = "sound/f13items/flashlight_on.ogg"
	close_sound = "sound/f13items/flashlight_off.ogg"

/obj/structure/simple_door/blast
	name = "blast door"
	desc = "A blast door, alternatively referred to as a shielded door or safety door, is a type of door designed to be especially reliable and durable."
	icon_state = "blastdoor"
	door_type = "blastdoor"
	material_type = /obj/item/stack/sheet/plasteel
	open_sound = "sound/f13machines/doorblast_open.ogg"
	close_sound = "sound/f13machines/doorblast_close.ogg"
	explosion_block = 10
	hard_open = 0
	opening_time = 30
	closing_time = 20

/obj/structure/simple_door/bunker
	name = "airlock"
	desc = "An olive green painted airlock.<br>The door mechanism itself is a complex mix of an electic engine and hydraulic motion.<br>This particular door looks like a pre-War military tech."
	icon_state = "bunker"
	door_type = "bunker"
	material_type = /obj/item/stack/sheet/metal
	open_sound = "sound/f13machines/doorairlock_open.ogg"
	close_sound = "sound/f13machines/doorairlock_close.ogg"
	explosion_block = 5
	hard_open = 0

/obj/structure/simple_door/bunker/glass
	desc = "An olive green painted airlock, with semi-transparent glass window.<br>The door mechanism itself is a complex mix of an electic engine and hydraulic motion.<br>This particular door looks like a pre-War military tech."
	icon_state = "bunkerglass"
	door_type = "bunkerglass"
	explosion_block = 4 //A glass window in it, reduces the resistance, am I right?
	opaque = 0