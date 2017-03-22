/obj/item/weapon/machete
	name = "\proper machete"
	desc = "The machete appears to be a makeshift weapon, as it consists of a lawn mower blade strapped to a wooden handle.<br>It is the primary melee weapon of Caesar's Legion."
	icon_state = "machete"
	item_state = "machete"
	flags = CONDUCT
	slot_flags = SLOT_BELT
	force = 25
	throwforce = 15
	w_class = 3
	hitsound = 'sound/weapons/bladeslice.ogg'
	icon = 'icons/fallout/objects/melee.dmi'
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	block_chance = 20
	sharpness = IS_SHARP

/obj/item/weapon/golf
	name = "9 iron"
	desc = "This old 9 iron is bent and battered after many years of use by anyone who found it good enough to break bones and crash skulls."
	icon_state = "golf"
	item_state = "golf"
	slot_flags = SLOT_BELT
	force = 17
	throw_speed = 3
	throw_range = 4
	throwforce = 10
	w_class = 2
	icon = 'icons/fallout/objects/melee.dmi'

/obj/item/weapon/golf/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] is impaling \himself with the [src.name]! It looks like \he's trying to commit suicide.</span>")
	return (BRUTELOSS|FIRELOSS)

/obj/item/weapon/pipe
	name = "Pipe"
	desc = "One of the ends has tape wrapped around it to improve grip, while the other is heavily corroded and/or bloodstained, and topped with a pipe fitting. Though it has a short reach, it has decent damage and a fast swing, making it a good melee weapon for players who are just starting out. "
	icon_state = "pipe"
	item_state = "pipe"
	slot_flags = SLOT_BELT
	force = 14
	throw_speed = 3
	throw_range = 4
	throwforce = 14
	w_class = 3
	icon = 'icons/fallout/objects/melee.dmi'

/obj/item/weapon/twohanded/pipe/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] is impaling \himself with the [src.name]! It looks like \he's trying to commit suicide.</span>")
	return (BRUTELOSS|FIRELOSS)

/obj/item/weapon/powergauntlet
	name = "Power gauntlet"
	desc = "Power Knuckles 'Big ram' produced by Beau.<br>Most consider it the best weapon for close combat.<br>Small but powerful battery provides the power for device operation."
	icon_state = "powergauntlet"
	item_state = "powergauntlet"
	slot_flags = SLOT_BELT
	force = 25
	throw_speed = 3
	throw_range = 4
	throwforce = 10
	w_class = 2
	icon = 'icons/fallout/objects/melee.dmi'

/obj/item/weapon/powergauntlet/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] is impaling \himself with the [src.name]! It looks like \he's trying to commit suicide.</span>")
	return (BRUTELOSS|FIRELOSS)

/obj/item/weapon/twohanded/baseball
	icon_state = "baseball0"
	name = "baseball bat"
	desc = "A wooden source of joy and pain."
	icon = 'icons/fallout/objects/melee.dmi'
	force = 7
	throwforce = 15
	w_class = 3
	force_unwielded = 7
	force_wielded = 16
	obj_integrity = 200
	max_integrity = 200

/obj/item/weapon/twohanded/tribal_spear
	icon_state = "tribalspear0"
	name = "tribal spear"
	desc = "A haphazardly-constructed, yet still deadly weapon of an ancient design."
	icon = 'icons/fallout/objects/melee.dmi'
	force = 10
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = SLOT_BACK
	force_unwielded = 10
	force_wielded = 24
	throwforce = 20
	throw_speed = 4
	embedded_impact_pain_multiplier = 3
	armour_penetration = 10
	materials = list(MAT_METAL=1150, MAT_WOOD=2075)
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("attacked", "poked", "jabbed", "torn", "gored")
	sharpness = IS_SHARP
	obj_integrity = 200
	max_integrity = 200

/obj/item/weapon/spear
	icon_state = "spear"
	name = "throwing spear"
	desc = "A rather deadly weapon of an ancient design."
	icon = 'icons/fallout/objects/melee.dmi'
	force = 10
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = SLOT_BACK
	throwforce = 30
	throw_speed = 4
	embedded_impact_pain_multiplier = 3
	armour_penetration = 10
	materials = list(MAT_METAL=1150, MAT_WOOD=2075)
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("attacked", "poked", "jabbed", "torn", "gored")
	sharpness = IS_SHARP
	obj_integrity = 200
	max_integrity = 200

/obj/item/weapon/twohanded/superhammer
	name = "super sledge"
	desc = "Also called 'Superkuvalda' - BoS produced these using the most modern weapons technology.<br>It's equipped with storage of kinetic energy to enhance the impact."
	icon_state = "supersledgehammer0"
	icon = 'icons/fallout/objects/melee.dmi'
	flags = CONDUCT
	slot_flags = SLOT_BACK
	force = 5
	force_unwielded = 10
	force_wielded = 45
	throwforce = 30
	throw_range = 7
	w_class = 5
	var/charged = 1
	origin_tech = "combat=5;powerstorage=5"

/obj/item/weapon/twohanded/superhammer/proc/shock(mob/living/target)
	var/datum/effect_system/lightning_spread/s = new /datum/effect_system/lightning_spread
	s.set_up(5, 1, target.loc)
	s.start()
	target.visible_message("<span class='danger'>[target.name] was shocked by the [src.name]!</span>", \
		"<span class='userdanger'>You feel a powerful shock course through your body sending you flying!</span>", \
		"<span class='italics'>You hear a heavy electrical crack!</span>")
	var/atom/throw_target = get_edge_target_turf(target, get_dir(src, get_step_away(target, src)))
	target.throw_at(throw_target, 200, 4)
	charged = 0
	spawn(50)
		charged = 1
	return


/obj/item/weapon/twohanded/superhammer/attack(mob/M, mob/user)
	..()
	spawn(0)
	if(wielded && charged)
		playsound(src.loc, "sparks", 50, 1)
		if(istype(M, /mob/living))
			M.Stun(3)
			shock(M)

/obj/item/weapon/twohanded/superhammer/throw_impact(atom/target)
	. = ..()
	if(istype(target, /mob/living))
		var/mob/living/L = target
		L.Stun(3)
		shock(L)

/obj/item/weapon/twohanded/sledgehammer
	name = "sledgehammer"
	desc = "Strong, heavy weapon of DESTRUCTION."
	icon_state = "largesledgehammer0"
	icon = 'icons/fallout/objects/melee.dmi'
	flags = CONDUCT
	slot_flags = SLOT_BACK
	force = 5
	force_unwielded = 10
	force_wielded = 25
	throwforce = 25
	throw_range = 7
	w_class = 4
	var/charged = 1
	origin_tech = "combat=5;powerstorage=5"