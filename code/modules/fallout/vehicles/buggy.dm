/obj/vehicle/fuel/motorcycle/buggy
	name = "dune buggy"
	desc = "<i>Ain't no place for a fancy cars on the Wasteland.<br>No place for classy brands, but nicknames.<br>Only the rusty and trusty death machines.<br>Only fuel and blood.</i>"
	icon = 'icons/fallout/vehicles/medium_vehicles.dmi'
	icon_state = "buggy_olive"
	datum_type = /datum/riding/motorcycle/buggy
	pixel_x = -17
	pixel_y = -2
	fuel = 1000
	max_fuel = 1000
	engine_on_sound = 'sound/f13machines/buggy_start.ogg'
	var/list/names = list("lol", "this is a RANDOM name")
/obj/vehicle/fuel/motorcycle/buggy/New()
	..()
	name = pick(names)

/datum/riding/motorcycle/buggy
	vehicle_move_delay = 0.75

/datum/riding/motorcycle/buggy/handle_vehicle_offsets()
	..()
	if(ridden.has_buckled_mobs())
		for(var/m in ridden.buckled_mobs)
			var/mob/living/buckled_mob = m
			switch(buckled_mob.dir)
				if(NORTH)
					buckled_mob.pixel_x = -1
					buckled_mob.pixel_y = 9
				if(EAST)
					buckled_mob.pixel_x = -5
					buckled_mob.pixel_y = 6
				if(SOUTH)
					buckled_mob.pixel_x = 0
					buckled_mob.pixel_y = 12
				if(WEST)
					buckled_mob.pixel_x = 3
					buckled_mob.pixel_y = 6

/obj/vehicle/fuel/motorcycle/buggy/dune
	icon_state = "buggy_dune"
	names = list("lol", "this is a RANDOM name")

/obj/vehicle/fuel/motorcycle/buggy/red
	icon_state = "buggy_red"
	names = list("lol", "this is a RANDOM name")

/obj/vehicle/fuel/motorcycle/buggy/hot
	icon_state = "buggy_hot"
	names = list("lol", "this is a RANDOM name")