/obj/structure/barrel
	name = "barrel"
	desc = "container with... something."
	obj_integrity = 150
	max_integrity = 150
	icon_state = "single"
	icon = 'icons/fallout/objects/structures/trash.dmi'

/obj/structure/barrel/dangerous
	name = "waste barrel"
	desc = "strange barrel."
	icon_state = "dangerous"
	var/cooldown

/obj/structure/barrel/dangerous/New()
	..()
	START_PROCESSING(SSobj, src)

/obj/structure/barrel/dangerous/process()
	if(cooldown < world.time - 60)
		cooldown = world.time
		radiation_pulse(get_turf(src), 1, 4, 10, 1)

/obj/structure/barrel/old
	name = "old barrel"
	desc = "container with... something."
	icon_state = "one_b"

/obj/structure/barrel/two
	name = "old barrels"
	desc = "containers with... something."
	icon_state = "two_b"

/obj/structure/barrel/three
	name = "old barrels"
	desc = "containers with... something."
	icon_state = "three_b"

/obj/structure/barrel/four
	name = "old barrels"
	desc = "containers with... something."
	icon_state = "four_b"