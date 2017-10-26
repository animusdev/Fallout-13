/obj/item/device/flashlight
	name = "flashlight"
	desc = "A hand-held emergency light."
	icon = 'icons/obj/lighting.dmi'
	icon_state = "flashlight"
	item_state = "flashlight"
	w_class = WEIGHT_CLASS_SMALL
	flags = CONDUCT
	slot_flags = SLOT_BELT
	materials = list(MAT_METAL=50, MAT_GLASS=20)
	actions_types = list(/datum/action/item_action/toggle_light)
	var/on = 0
	var/brightness_on = 4 //luminosity when on
	var/sound_toggleON = 'sound/f13items/flashlight_on.ogg'
	var/sound_toggleOFF = 'sound/f13items/flashlight_off.ogg'
	light_color = LIGHT_COLOR_LED

/obj/item/device/flashlight/New()
	..()
	update_brightness()

/obj/item/device/flashlight/proc/update_brightness(mob/user = null)
	if(on)
		icon_state = "[initial(icon_state)]-on"
		set_light(brightness_on)
	else
		icon_state = initial(icon_state)
		set_light(0)

/obj/item/device/flashlight/attack_self(mob/user)
	on = !on
	playsound(loc, on ? sound_toggleON : sound_toggleOFF, 25, 1, -3)
	update_brightness(user)
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()
	return 1


/obj/item/device/flashlight/attack(mob/living/carbon/human/M, mob/living/carbon/human/user)
	add_fingerprint(user)
	if(on && user.zone_selected == "eyes")

		if((user.disabilities & CLUMSY || user.getBrainLoss() >= 60) && prob(50))	//too dumb to use flashlight properly
			return ..()	//just hit them in the head

		if(!user.IsAdvancedToolUser())
			to_chat(user, "<span class='warning'>You don't have the dexterity to do this!</span>")
			return

		var/mob/living/carbon/human/H = M	//mob has protective eyewear
		if(ishuman(M) && ((H.head && H.head.flags_cover & HEADCOVERSEYES) || (H.wear_mask && H.wear_mask.flags_cover & MASKCOVERSEYES) || (H.glasses && H.glasses.flags_cover & GLASSESCOVERSEYES)))
			to_chat(user, "<span class='notice'>You're going to need to remove that [(H.head && H.head.flags_cover & HEADCOVERSEYES) ? "helmet" : (H.wear_mask && H.wear_mask.flags_cover & MASKCOVERSEYES) ? "mask": "glasses"] first.</span>")
			return

		if(M == user)	//they're using it on themselves
			if(M.flash_act(visual = 1))
				M.visible_message("[M] directs [src] to [M.p_their()] eyes.", "<span class='notice'>You wave the light in front of your eyes! Trippy!</span>")
			else
				M.visible_message("[M] directs [src] to [M.p_their()] eyes.", "<span class='notice'>You wave the light in front of your eyes.</span>")
		else
			user.visible_message("<span class='warning'>[user] directs [src] to [M]'s eyes.</span>", \
								 "<span class='danger'>You direct [src] to [M]'s eyes.</span>")
			var/mob/living/carbon/C = M
			if(istype(C))
				if(C.stat == DEAD || (C.disabilities & BLIND)) //mob is dead or fully blind
					to_chat(user, "<span class='warning'>[C] pupils don't react to the light!</span>")
				else if(C.dna.check_mutation(XRAY))	//mob has X-RAY vision
					to_chat(user, "<span class='danger'>[C] pupils give an eerie glow!</span>")
				else //they're okay!
					if(C.flash_act(visual = 1))
						to_chat(user, "<span class='notice'>[C]'s pupils narrow.</span>")
	else
		return ..()

/obj/item/device/flashlight/red
	name = "red flashlight"
	desc = "An old-time flashlight made of red plastic.<br>It's just like the one you used to read books in the dark when you were a kid."
	icon = 'icons/fallout/objects/lamps.dmi'
	icon_state = "red"
	item_state = "flashlight"
	light_color = LIGHT_COLOR_YELLOW

/obj/item/device/flashlight/pen
	name = "penlight"
	desc = "A pen-sized light, used by medical staff. It can also be used to create a hologram to alert people of incoming medical assistance."
	icon_state = "penlight"
	item_state = ""
	flags = CONDUCT
	brightness_on = 2
	var/holo_cooldown = 0
	light_color = LIGHT_COLOR_LED

/obj/item/device/flashlight/pen/afterattack(atom/target, mob/user, proximity_flag)
	if(!proximity_flag)
		if(holo_cooldown > world.time)
			to_chat(user, "<span class='warning'>[src] is not ready yet!</span>")
			return
		var/T = get_turf(target)
		if(locate(/mob/living) in T)
			new /obj/effect/overlay/temp/medical_holosign(T,user) //produce a holographic glow
			holo_cooldown = world.time + 100
			return
	..()

/obj/effect/overlay/temp/medical_holosign
	name = "medical holosign"
	desc = "A small holographic glow that indicates a medic is coming to treat a patient."
	icon_state = "medi_holo"
	duration = 30
	light_color = LIGHT_COLOR_VANHELSING

/obj/effect/overlay/temp/medical_holosign/New(loc, creator)
	..()
	playsound(loc, 'sound/machines/ping.ogg', 50, 0) //make some noise!
	if(creator)
		visible_message("<span class='danger'>[creator] created a medical hologram!</span>")


/obj/item/device/flashlight/seclite
	name = "seclite"
	desc = "A robust flashlight used by security."
	icon_state = "seclite"
	item_state = "seclite"
	force = 9 // Not as good as a stun baton.
	brightness_on = 5 // A little better than the standard flashlight.
	hitsound = 'sound/weapons/genhit1.ogg'

// the desk lamps are a bit special

/obj/item/device/flashlight/lamp
	name = "desk lamp"
	desc = "A desk lamp with an adjustable mount."
	icon_state = "lamp"
	item_state = "lamp"
	brightness_on = 5
	w_class = WEIGHT_CLASS_BULKY
	flags = CONDUCT
	materials = list()
	on = 1
	light_color = LIGHT_COLOR_YELLOW


// green-shaded desk lamp
/obj/item/device/flashlight/lamp/green
	desc = "A classic green-shaded desk lamp."
	icon_state = "lampgreen"
	item_state = "lampgreen"



/obj/item/device/flashlight/lamp/verb/toggle_light()
	set name = "Toggle light"
	set category = "Object"
	set src in oview(1)

	if(!usr.stat)
		attack_self(usr)

//Bananalamp
/obj/item/device/flashlight/lamp/bananalamp
	name = "banana lamp"
	desc = "Only a clown would think to make a ghetto banana-shaped lamp. Even has a goofy pullstring."
	icon_state = "bananalamp"
	item_state = "bananalamp"

//Torch

/obj/item/device/flashlight/torch
	name = "torch"
	desc = "A torch fashioned from some leaves and a log."
	w_class = WEIGHT_CLASS_BULKY
	brightness_on = 4 // Pretty dark.
	icon_state = "torch"
	item_state = "torch"
	actions_types = list()
	var/fuel = 0
	var/on_damage = 10
	var/produce_heat = 1500
	heat = 1000
	sound_toggleON = 'sound/f13items/matchstick_lit.ogg'
	sound_toggleOFF = 'sound/f13items/matchstick_hit.ogg'
	light_color = LIGHT_COLOR_FIRE

/obj/item/device/flashlight/torch/New()
	fuel = rand(800, 1000) // Sorry for changing this so much but I keep under-estimating how long X number of ticks last in seconds.
	..()

/obj/item/device/flashlight/torch/process()
	open_flame(heat)
	fuel = max(fuel - 1, 0)
	if(!fuel || !on)
		turn_off()
		if(!fuel)
			icon_state = "[initial(icon_state)]-empty"
		STOP_PROCESSING(SSobj, src)

/obj/item/device/flashlight/torch/ignition_effect(atom/A, mob/user)
	if(fuel && on)
		. = "<span class='notice'>[user] lights [A] with [src] like a real \
			badass.</span>"
	else
		. = ""

/obj/item/device/flashlight/torch/proc/turn_off()
	on = 0
	force = initial(src.force)
	damtype = initial(src.damtype)
	if(ismob(loc))
		var/mob/U = loc
		update_brightness(U)
	else
		update_brightness(null)

/obj/item/device/flashlight/torch/update_brightness(mob/user = null)
	..()
	if(on)
		item_state = "[initial(item_state)]-on"
	else
		item_state = "[initial(item_state)]"

/obj/item/device/flashlight/torch/attack_self(mob/user)

	// Usual checks
	if(!fuel)
		to_chat(user, "<span class='warning'>It's out of fuel!</span>")
		return
	if(on)
		return

	. = ..()
	// All good, turn it on.
	if(.)
		user.visible_message("<span class='notice'>[user] lights \the [src].</span>", "<span class='notice'>You light \the [src]!</span>")
		force = on_damage
		damtype = "fire"
		START_PROCESSING(SSobj, src)

/obj/item/device/flashlight/torch/is_hot()
	return on * heat

//Flares

/obj/item/device/flashlight/torch/flare
	name = "flare"
	desc = "A red flare. There are instructions on the side, it reads 'pull cord, make light'."
	w_class = WEIGHT_CLASS_SMALL
	brightness_on = 8 // Pretty bright.
	icon_state = "flarered"
	item_state = "flare"
	light_color = LIGHT_COLOR_FLARE
	on_damage = 7
	slot_flags = null

/obj/item/device/flashlight/torch/flare/green
	desc = "A green flare. There are instructions on the side, it reads 'pull cord, make light'."
	icon_state = "flaregreen"
	light_color = LIGHT_COLOR_GLARE

/obj/item/device/flashlight/torch/flare/blue
	desc = "A blue flare. There are instructions on the side, it reads 'pull cord, make light'."
	icon_state = "flareblue"
	light_color = LIGHT_COLOR_VANHELSING

/obj/item/device/flashlight/lantern
	name = "lantern"
	icon_state = "lantern"
	item_state = "lantern"
	desc = "A mining lantern."
	brightness_on = 6			// luminosity when on
	light_color = LIGHT_COLOR_YELLOW


/obj/item/device/flashlight/slime
	gender = PLURAL
	name = "glowing slime extract"
	desc = "Extract from a yellow slime. It emits a strong light when squeezed."
	icon = 'icons/obj/lighting.dmi'
	icon_state = "slime"
	item_state = "slime"
	w_class = WEIGHT_CLASS_SMALL
	slot_flags = SLOT_BELT
	materials = list()
	brightness_on = 6 //luminosity when on
	light_color = LIGHT_COLOR_SLIME_LAMP

/obj/item/device/flashlight/emp
	origin_tech = "magnets=3;syndicate=1"
	var/emp_max_charges = 4
	var/emp_cur_charges = 4
	var/charge_tick = 0


/obj/item/device/flashlight/emp/New()
		..()
		START_PROCESSING(SSobj, src)

/obj/item/device/flashlight/emp/Destroy()
		STOP_PROCESSING(SSobj, src)
		return ..()

/obj/item/device/flashlight/emp/process()
		charge_tick++
		if(charge_tick < 10) return 0
		charge_tick = 0
		emp_cur_charges = min(emp_cur_charges+1, emp_max_charges)
		return 1

/obj/item/device/flashlight/emp/attack(mob/living/M, mob/living/user)
	if(on && user.zone_selected == "eyes") // call original attack proc only if aiming at the eyes
		..()
	return

/obj/item/device/flashlight/emp/afterattack(atom/movable/A, mob/user, proximity)
	if(!proximity)
		return

	if(emp_cur_charges > 0)
		emp_cur_charges -= 1

		if(ismob(A))
			var/mob/M = A
			add_logs(user, M, "attacked", "EMP-light")
			M.visible_message("<span class='danger'>[user] blinks \the [src] at \the [A].", \
								"<span class='userdanger'>[user] blinks \the [src] at you.")
		else
			A.visible_message("<span class='danger'>[user] blinks \the [src] at \the [A].")
		to_chat(user, "\The [src] now has [emp_cur_charges] charge\s.")
		A.emp_act(1)
	else
		to_chat(user, "<span class='warning'>\The [src] needs time to recharge!</span>")
	return
