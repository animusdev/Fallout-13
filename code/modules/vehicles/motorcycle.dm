//Motorcycle
/obj/vehicle/motorcycle
	name = "motorcycle"
	desc = "Wanderer Motors LLC."
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
		bikecover = image("icons/obj/vehicles/medium_vehicles.dmi", "[initial(icon_state)]_cover")//"bike_cover")
		bikecover.layer = MOB_LAYER + 0.1

obj/vehicle/motorcycle/post_buckle_mob(mob/living/M)
	if(buckled_mob)
		overlays += bikecover
		playsound(src.loc, engine_sound, 50, 0, 0)
	else
		overlays -= bikecover

obj/vehicle/motorcycle/attackby(obj/item/weapon/W, mob/user, params)
	if(istype(W, /obj/item/weapon/stock_parts/cell))
		var/obj/item/weapon/stock_parts/cell/C = W
		if(bcell)
			user << "<span class='notice'>[src] already has a cell.</span>"
		else
			if(C.maxcharge < movecost)
				user << "<span class='notice'>[src] requires a higher capacity cell.</span>"
				return
			if(!user.unEquip(W))
				return
			W.loc = src
			bcell = W
			user << "<span class='notice'>You install a cell in [src].</span>"
			update_icon()

	else if(istype(W, /obj/item/weapon/screwdriver))
		if(bcell)
			bcell.updateicon()
			bcell.loc = get_turf(src.loc)
			bcell = null
			user << "<span class='notice'>You remove the cell from [src].</span>"
			update_icon()
			return
		..()
	return

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


/obj/vehicle/motorcycle/rust
	name = "rusty motorcycle"
	icon_state = "bike_rust_med"

/obj/vehicle/motorcycle/motor_green
	name = "motor green motorcycle"
	icon_state = "motor_green"

/obj/vehicle/motorcycle/scrambler
	name = "scrambler motorcycle"
	icon_state = "scrambler"