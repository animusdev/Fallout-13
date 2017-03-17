//Fallout 13 primary vehicle

/obj/vehicle/fuel/motorcycle
	name = "motorcycle"
	desc = "Wanderer Motors LLC."
	icon = 'icons/fallout/vehicles/medium_vehicles.dmi'
	icon_state = "bike"
	pixel_x = -16
	pixel_y = -2
	layer = LYING_MOB_LAYER
	obj_integrity = 500
	max_integrity = 500
	armor = list(melee = 50, bullet = 40, laser = 30, energy = 30, bomb = 0, bio = 0, rad = 0, fire = 30, acid = 40)
	var/image/bikecover = null
	var/datum_type = /datum/riding/motorcycle
	self_weight = 150
	engine_on_sound = 'sound/f13machines/bike_start.ogg'
	engine_loop_sound = 'sound/f13machines/bike_loop.ogg'

/obj/vehicle/fuel/motorcycle/buckle_mob()
	. = ..()
	riding_datum = new datum_type()

/obj/vehicle/fuel/motorcycle/post_buckle_mob(mob/living/M)
	if(has_buckled_mobs())
		add_overlay(bikecover)
	else
		overlays -= bikecover

/obj/vehicle/fuel/motorcycle/New()
	..()
	bikecover = image("icons/fallout/vehicles/medium_vehicles.dmi", "[icon_state]_cover")//"bike_cover")
	bikecover.layer = ABOVE_MOB_LAYER

/obj/item/key/motorcycle/New()
	..()
	name = "motorcycle key"
	desc = "A keyring with a small steel key.<br>By the look of a key cuts it's likely it belongs to a motorcycle."
	icon = 'icons/fallout/vehicles/small_vehicles.dmi'
	icon_state = pick("key-bike-r","key-bike-y","key-bike-g","key-bike-b")

//Motorcycle subtypes with different skins

/obj/vehicle/fuel/motorcycle/rust
	name = "rusty motorcycle"
	desc = "It's a very old and weathered motorcycle, yet the engine is still alive somehow."
	icon_state = "bike_rust_med"
	datum_type = /datum/riding/motorcycle/slow

/obj/vehicle/fuel/motorcycle/motor_green
	name = "green motorcycle"
	desc = "It's a military motorcycle from the old days.<br>Oddly enough it's still in pristine condition. The Army always had all the top-quality stuff."
	icon_state = "bike_green"
	datum_type = /datum/riding/motorcycle/fast

/obj/vehicle/fuel/motorcycle/scrambler
	name = "scrambler motorbike"
	desc = "Scrambler is an old term for a dirt bike with powerful engine, that raced on off-road tracks with low jumps.<br>Yet when you see it, you know it's better not to mess around with its owner."
	icon_state = "bike_scrambler"

//Motorcycle riding datum

/datum/riding/motorcycle/fast
	vehicle_move_delay = 0.8

/datum/riding/motorcycle/slow
	vehicle_move_delay = 1.2

/datum/riding/motorcycle
	keytype = /obj/item/key/motorcycle
	vehicle_move_delay = 1

/datum/riding/motorcycle/handle_vehicle_layer()
	return

/datum/riding/motorcycle/handle_vehicle_offsets()
	..()
	if(ridden.has_buckled_mobs())
		for(var/m in ridden.buckled_mobs)
			var/mob/living/buckled_mob = m
			switch(buckled_mob.dir)
				if(NORTH)
					buckled_mob.pixel_x = 0
					buckled_mob.pixel_y = 8
				if(EAST)
					buckled_mob.pixel_x = -2
					buckled_mob.pixel_y = 5
				if(SOUTH)
					buckled_mob.pixel_x = 0
					buckled_mob.pixel_y = 12
				if(WEST)
					buckled_mob.pixel_x = 2
					buckled_mob.pixel_y = 5