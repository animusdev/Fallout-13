
/obj/vehicle
	name = "vehicle"
	desc = "A basic vehicle, vroom"
	icon = 'icons/obj/vehicles.dmi'
	icon_state = "fuckyou"
	density = 1
	anchored = 0
	can_buckle = 1
	buckle_lying = 0
	obj_integrity = 300
	max_integrity = 300
	armor = list(melee = 30, bullet = 30, laser = 30, energy = 0, bomb = 30, bio = 0, rad = 0, fire = 60, acid = 60)
	var/auto_door_open = TRUE
	var/view_range = 7
	var/datum/riding/riding_datum = null
	var/engine_on = 0
	var/engine_on_sound = null
	var/engine_loop_sound = null
	var/obj/item/key/key = null

/obj/vehicle/New()
	..()
	if(engine_on)
		src.verbs += /obj/vehicle/proc/StopEngine
	else
		src.verbs += /obj/vehicle/proc/StartEngine

/obj/vehicle/update_icon()
	return

/obj/item/key
	name = "key"
	desc = "A small grey key."
	icon = 'icons/obj/vehicles.dmi'
	icon_state = "key"
	w_class = WEIGHT_CLASS_TINY


//BUCKLE HOOKS
/obj/vehicle/unbuckle_mob(mob/living/buckled_mob,force = 0)
	if(riding_datum)
		riding_datum.restore_position(buckled_mob)
		. = ..()


/obj/vehicle/user_buckle_mob(mob/living/M, mob/user)
	if(user.incapacitated())
		return
	for(var/atom/movable/A in get_turf(src))
		if(A.density)
			if(A != src && A != M)
				return
	M.forceMove(get_turf(src))
	..()
	if(user.client)
		user.client.view = view_range

	if(riding_datum)
		riding_datum.ridden = src
		riding_datum.handle_vehicle_offsets()

//MOVEMENT
/obj/vehicle/relaymove(mob/user, direction)
	if(riding_datum)
		riding_datum.handle_ride(user, direction, engine_on)
	user.update_vision_cone()


/obj/vehicle/Move(NewLoc,Dir=0,step_x=0,step_y=0)
	. = ..()
	if(riding_datum)
		riding_datum.handle_vehicle_layer()
		riding_datum.handle_vehicle_offsets()


/obj/vehicle/Bump(atom/movable/M)
	. = ..()
	if(auto_door_open)
		if((istype(M, /obj/machinery/door) || istype(M, /obj/structure/simple_door)) && has_buckled_mobs())
			for(var/m in buckled_mobs)
				M.Bumped(m)


/obj/vehicle/Process_Spacemove(direction)
	if(has_gravity())
		return 1

	if(pulledby && (pulledby.loc != loc))
		return 1

	return 0

/obj/vehicle/space
	pressure_resistance = INFINITY


/obj/vehicle/run_obj_armor(damage_amount, damage_type, damage_flag = 0, attack_dir)
	if(damage_flag == "melee" && damage_amount < 20)
		return 0
	. = ..()

/obj/vehicle/attackby(obj/item/weapon/W, mob/user, params)
	if(riding_datum && istype(W,riding_datum.keytype))
		key = W
		user.drop_item()
		key.loc = src
		user.visible_message("[user] put keys into [src].", "You put keys into [src].")
		src.verbs += /obj/vehicle/proc/RemoveKey
		return 1
	return ..()

/obj/vehicle/proc/RemoveKey()
	set name = "Remove Key"
	set category = "Object"
	set src in view(1)

	if(!ishuman(usr))
		return

	if(engine_on)
		StopEngine()

	key.loc = loc
	var/mob/living/carbon/human/H = usr
	if(H)
		H.put_in_hands(key)
	key = null
	src.verbs -= /obj/vehicle/proc/RemoveKey

/obj/vehicle/proc/StartEngine()
	set name = "Start Engine"
	set category = "Object"
	set src in view(1)

	start_engine()

/obj/vehicle/proc/StopEngine()
	set name = "Stop Engine"
	set category = "Object"
	set src in view(1)

	stop_engine()

/obj/vehicle/proc/stop_engine()
	src.verbs += /obj/vehicle/proc/StartEngine
	src.verbs -= /obj/vehicle/proc/StopEngine

	if(usr)
		usr.visible_message("[usr] stop engine of [src].", "You stop engine.")

	engine_on = FALSE

	StopAmbient()

/obj/vehicle/proc/start_engine()
	if(!riding_datum)
		usr.visible_message("<span class = 'notice'>Sit on [src] to do this.</span>")
		return

	if(!key)
		usr.visible_message("<span class = 'notice'>There is no key.</span>")
		return

	if(!istype(key, riding_datum.keytype))
		usr.visible_message("<span class = 'notice'>Wrong key.</span>")
		return

	src.verbs += /obj/vehicle/proc/StopEngine
	src.verbs -= /obj/vehicle/proc/StartEngine

	if(usr)
		usr.visible_message("[usr] start engine of [src].", "You start engine.")

	engine_on = TRUE
	if(engine_on_sound)
		playsound(src, engine_on_sound, 50)
	if(engine_loop_sound)
		BeginAmbient(engine_loop_sound)

/obj/vehicle/deconstruct(disassembled = TRUE)
	new /obj/item/stack/sheet/metal (loc, 5)
	qdel(src)

/obj/vehicle/examine(mob/user)
	..()
	if(!(resistance_flags & INDESTRUCTIBLE))
		if(resistance_flags & ON_FIRE)
			to_chat(user, "<span class='warning'>It's on fire!</span>")
		var/healthpercent = (obj_integrity/max_integrity) * 100
		switch(healthpercent)
			if(100 to INFINITY)
				to_chat(user, "It seems pristine and undamaged.")
			if(50 to 100)
				to_chat(user, "It looks slightly damaged.")
			if(25 to 50)
				to_chat(user, "It appears heavily damaged.")
			if(0 to 25)
				to_chat(user, "<span class='warning'>It's falling apart!</span>")
