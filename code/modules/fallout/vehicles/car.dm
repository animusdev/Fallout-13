/obj/structure/car
	name = "car"
	desc = "Car."
	icon_state = "car1"
	anchored = 1
	layer = ABOVE_MOB_LAYER
	icon = 'icons/fallout/objects/structures/car.dmi'
	density = 1
	resistance_flags = INDESTRUCTIBLE

/obj/structure/car/New()
	..()

	icon_state = "car[rand(1,8)]"

	var/atom/movable/S = new (locate(x+1,y,z))
	S.density = 1
	S.anchored = 1
	S.icon = null
	S.verbs.Cut()