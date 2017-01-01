/obj/structure/campfire
	name = "campfire"

	density = 0
	anchored = 1
	opacity = 0

	var/fired = 0

	var/fuel = 300

	desc = "It's campfire. I need some fire source."

	icon = 'icons/camp.dmi'
	icon_state = "campfire20"

/obj/structure/campfire/attackby(obj/item/P, mob/user, params)
	if(istype(P, /obj/item/device/flashlight/flare))
		var/obj/item/device/flashlight/flare/F = P
		if(F.on)
			fire(user)
	else if(istype(P, /obj/item/weapon/match))
		var/obj/item/weapon/match/M = P
		if(M.lit)
			fire(user)
/obj/structure/campfire/process()
	var/turf/location = get_turf(src)
	fuel--
	if(fuel <= 0)
		SSobj.processing.Remove(src)
		new /obj/effect/decal/cleanable/ash(location)
		qdel(src)

	if(location)
		location.hotspot_expose(7000, 5)
		return

/obj/structure/campfire/proc/fire(mob/living/user)
	playsound(src, 'sound/items/welder.ogg', 25, 1, -3)
	SSobj.processing |= src
	SetLuminosity(8)
	fired = 1
	desc = "Fired campfire... It's hot."
	if(user)
		user.visible_message("[user] has fire [src].", "<span class='notice'>You have fire [src].</span>")
	update_icon()
/obj/structure/campfire/update_icon()
	if(fired)
		icon_state = "campfire21"
	else
		icon_state = "campfire20"
	..()