/obj/structure/barrel
	name = "barrel"
	desc = "container with... something."
	obj_integrity = 150
	max_integrity = 150
	icon_state = "single"
	density = 1
	icon = 'icons/fallout/objects/structures/trash.dmi'

/obj/structure/barrel/dangerous
	name = "waste barrel"
	desc = "strange barrel."
	icon_state = "dangerous"
	rad_heavy_range = 1
	rad_light_range = 4
	rad_severity = 10

/obj/structure/barrel/dangerous/New()
	..()
	START_PROCESSING(SSobj, src)
	SSradiation.processing += src

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