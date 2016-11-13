//Motorcycle
/obj/vehicle/motorcycle
	name = "motorcycle"
	desc = "Wanderer Motors LLC.<br>It needs a diesel fuel to run."
	icon = 'icons/obj/vehicles/medium_vehicles.dmi'
	icon_state = "bike"
	keytype = /obj/item/key
	vehicle_move_delay = 1
	pixel_x = -16
	pixel_y = -2
	var/static/image/bikecover = null
	var/engine_sound = 'sound/f13machines/bike_start.ogg'

/obj/vehicle/motorcycle/New()
	..()
	if(!bikecover)
		bikecover = image("icons/obj/vehicles/medium_vehicles.dmi", "bike_cover")
		bikecover.layer = MOB_LAYER + 0.1

obj/vehicle/motorcycle/post_buckle_mob(mob/living/M)
	if(buckled_mob)
		overlays += bikecover
		playsound(src.loc, engine_sound, 50, 0, 0)
	else
		overlays -= bikecover

/obj/vehicle/motorcycle/handle_vehicle_layer()
	if(dir & NORTH|SOUTH)
		layer = MOB_LAYER - 1
	else
		layer = OBJ_LAYER

/obj/vehicle/motorcycle/handle_vehicle_offsets()
	..()
	if(buckled_mob)
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