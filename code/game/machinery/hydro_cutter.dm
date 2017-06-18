//Hydro cutter device from hell! Behold the glorious code abomination!

/obj/item/weapon/hydrocutter
	name = "hydro cutter"
	desc = "An industrial hydro cutter unit, designed to cut and shred stuff at recycling factories."
	icon = 'icons/obj/machines/hydro_cutter.dmi'
	icon_state = "cutt"
	item_state = "cutt"
	force = 20
	throwforce = 10
	hitsound = 'sound/effects/-adminhelp.ogg'
	w_class = WEIGHT_CLASS_BULKY
	throw_speed = 3
	throw_range = 2
	attack_verb = list("decided to shred a victim, and struck")
	var/busy = 0
	var/shredding = 300

/obj/item/weapon/hydrocutter/initialize()
        src.force = "[rand(10,30)]"
        return ..()

/obj/item/weapon/hydrocutter/attack(mob/living/carbon/M as mob, mob/living/carbon/user as mob)
	src.shred(user)
	return ..()

/obj/item/weapon/hydrocutter/attack_self(mob/user as mob)
	src.shred(user)
	return

/obj/item/weapon/hydrocutter/proc/shred(mob/user)
	if(!src.busy)
		src.busy = 1
		src.force = 80
		src.throwforce = 40
		src.hitsound = 'sound/weapons/chainsawhit.ogg'
		src.add_fingerprint(user)
		src.icon_state = "[initial(src.icon_state)]ing"
		spawn(src.shredding)
			src.icon_state = initial(src.icon_state)
			src.busy = 0
	return

/mob/say_verb(message as text)
	..()
	if(message == 'hydro cutter')
		spawn(6000)
			cutit()
proc/cutit()
	world << ' '
	cutit()