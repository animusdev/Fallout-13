//Fallout 13 barrels directory

/obj/structure/reagent_dispensers/barrel
	name = "barrel"
	desc = "A metal container with something in it.<br>By the look of it, it was manufactured recently."
	icon = 'icons/fallout/objects/structures/trash.dmi'
	icon_state = "single"
	tank_volume = 500
	reagent_id = "mutagen"
	self_weight = 200

/obj/structure/reagent_dispensers/barrel/dangerous
	name = "waste barrel"
	desc = "That is one strange metal barrel, made of strange metal that did not rust after all the decades.<br>And it has a strange label on it..."
	icon_state = "dangerous"
	tank_volume = 500
	reagent_id = "radium"
	rad_heavy_range = 1
	rad_light_range = 4
	rad_severity = 10
	self_weight = 200

/obj/structure/reagent_dispensers/barrel/dangerous/New()
	..()
	START_PROCESSING(SSobj, src)
	SSradiation.processing += src

/obj/structure/reagent_dispensers/barrel/boom()
	visible_message("<span class='danger'>\The [src] ruptures!</span>")
	chem_splash(loc, 0, list(reagents))
	qdel(src)

/obj/structure/reagent_dispensers/barrel/explosive
	name = "fuel barrel"
	desc = "That is one strange metal barrel, made of strange metal that did not rust after all the decades.<br>And it has a strange label on it...<br>I wonder if there is anything left in it."
	icon_state = "explosive"
	tank_volume = 500
	reagent_id = "welding_fuel"
	self_weight = 200

/obj/structure/reagent_dispensers/barrel/explosive/boom()
	explosion(get_turf(src), 0, 1, tank_volume/200, flame_range = tank_volume/200)
	qdel(src)

/obj/structure/reagent_dispensers/barrel/explosive/blob_act(obj/structure/blob/B)
	boom()

/obj/structure/reagent_dispensers/barrel/explosive/ex_act()
	boom()

/obj/structure/reagent_dispensers/barrel/explosive/fire_act(exposed_temperature, exposed_volume)
	boom()

/obj/structure/reagent_dispensers/barrel/explosive/tesla_act()
	..() //extend the zap
	boom()

/obj/structure/reagent_dispensers/barrel/old
	name = "old barrel"
	desc = "A single old barrel, oddly enough, it stands undamaged after all the decades.<br>I wonder if there is anything left in it."
	icon_state = "one_b"
	tank_volume = 500
	reagent_id = "water"
	self_weight = 200

/obj/structure/reagent_dispensers/barrel/two
	name = "two old barrels"
	desc = "A couple of old barrels, oddly enough, they stand undamaged after all the decades.<br>I wonder if there is anything left in these."
	icon_state = "two_b"
	tank_volume = 1000
	reagent_id = "lube"
	anchored = 1
	self_weight = 400

/obj/structure/reagent_dispensers/barrel/three
	name = "three old barrels"
	desc = "An ancient containers with something inside of them. Or are they empty? Actually, why would I know that..."
	icon_state = "three_b"
	tank_volume = 1500
	reagent_id = "water"
	anchored = 1
	self_weight = 600

/obj/structure/reagent_dispensers/barrel/four
	name = "four old barrels"
	desc = "An ancient containers with something inside of them. Or are they empty? Actually, that's a lot of barrels standing in a single spot..."
	icon_state = "four_b"
	tank_volume = 800
	reagent_id = "stablemutationtoxin"
	anchored = 1
	self_weight = 60