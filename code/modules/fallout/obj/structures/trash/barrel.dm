/obj/structure/barrel
	name = "barrel"
	desc = "A metal container with something in it.<br>By the look of it, it was manufactured recently."
	obj_integrity = 150
	max_integrity = 150
	icon_state = "single"
	density = 1
	icon = 'icons/fallout/objects/structures/trash.dmi'
	self_weight = 20

/obj/structure/barrel/dangerous
	name = "waste barrel"
	desc = "That is one strange metal barrel, made of strange metal that did not rust after all the decades.<br>And it has a strange label on it..."
	icon_state = "dangerous"
	rad_heavy_range = 1
	rad_light_range = 4
	rad_severity = 10
	self_weight = 70

/obj/structure/barrel/dangerous/New()
	..()
	START_PROCESSING(SSobj, src)
	SSradiation.processing += src

/obj/structure/barrel/old
	name = "old barrel"
	desc = "A single old barrel, oddly enough, it stands undamaged after all the decades.<br>I wonder if there is anything left in it."
	icon_state = "one_b"
	self_weight = 15

/obj/structure/barrel/two
	name = "two old barrels"
	desc = "A couple of old barrels, oddly enough, they stand undamaged after all the decades.<br>I wonder if there is anything left in these."
	icon_state = "two_b"
	self_weight = 30

/obj/structure/barrel/three
	name = "three old barrels"
	desc = "An ancient containers with something inside of them. Or are they empty? Actually, why would I know that..."
	icon_state = "three_b"
	self_weight = 45

/obj/structure/barrel/four
	name = "four old barrels"
	desc = "An ancient containers with something inside of them. Or are they empty? Actually, that's a lot of barrels standing in a single spot..."
	icon_state = "four_b"
	self_weight = 60