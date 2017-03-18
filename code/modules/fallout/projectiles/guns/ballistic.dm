/obj/item/weapon/gun/ballistic/automatic/pistol/n99
	name = "10-mm pistol"
	desc = "Self-loading pistol Colt 6520 10mm. After each shot, the weapon recharges long until the end of the store."
	icon_state = "n99"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	w_class = 2
	force = 13
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/m10mm_adv
	fire_sound = "10mmfire"
	can_suppress = 1
	burst_size = 1
	fire_delay = 0
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/weapon/gun/ballistic/automatic/pistol/n99/update_icon()
	..()
	icon_state = "[initial(icon_state)][magazine && magazine.max_ammo == 12 ? "-[magazine.max_ammo]" : ""][chambered ? "" : "-e"][suppressed ? "-suppressed" : ""]"
	return

/obj/item/weapon/gun/ballistic/revolver/magnum
	name = "Magnum"
	icon_state = "44magnum"
	desc = "The Smith & Wesson Model 29 is a powerful, six-shot, double-action revolver manufactured by the U.S. company Smith & Wesson since 1955. Centuries later, copies of it can still be found in the wastes. "
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/m44
	can_suppress = 0
	fire_sound = 'sound/f13weapons/magnum_fire.ogg'
	burst_size = 1
	casing_ejector = 0
	zoomable = TRUE
	zoom_amt = 4
	w_class = WEIGHT_CLASS_NORMAL
	self_weight = 0.85

/obj/item/weapon/gun/ballistic/automatic/rifle
	name = "Automatic Rifle .308"
	icon_state = "rifle-automatic"
	item_state = "shotgun"
	icon = 'icons/fallout/objects/guns/rifle.dmi'
	origin_tech = "combat=3;materials=2"
	mag_type = /obj/item/ammo_box/magazine/m308
	can_suppress = 1
	casing_ejector = 1
	weapon_weight = WEAPON_MEDIUM
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/weapon/gun/ballistic/shotgun/rifle
	name = "Rifle .308"
	icon_state = "rifle"
	item_state = "shotgun"
	icon = 'icons/fallout/objects/guns/rifle.dmi'
	origin_tech = "combat=3;materials=2"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/m308
	can_suppress = 1
	casing_ejector = 0
	weapon_weight = WEAPON_MEDIUM
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/weapon/gun/ballistic/shotgun/rifle/scope
	icon_state = "rifle-scope"
	item_state = "shotgun"
	can_suppress = 1
	zoomable = TRUE
	zoom_amt = 6
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/weapon/gun/ballistic/automatic/assault_rifle
	name = "Assault Rifle 5.56mm"
	icon_state = "assault_rifle"
	item_state = "assault"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	origin_tech = "combat=3;materials=2"
	mag_type = /obj/item/ammo_box/magazine/m556
	fire_sound = 'sound/f13weapons/assaultrifle_fire.ogg'
	can_suppress = 0
	casing_ejector = 1
	weapon_weight = WEAPON_MEDIUM
	slot_flags = SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY

/obj/item/weapon/gun/ballistic/automatic/smg10mm
	name = "10-mm submachine gun"
	desc = "Submachine gun H&K MP9 (10-mm caliber variant). The average sub-machine gun, can operate in both single and automatic fire."
	icon_state = "smg10mm"
	item_state = "m90"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	origin_tech = "combat=3;materials=2"
	mag_type = /obj/item/ammo_box/magazine/m10mm_auto
	fire_sound = "10mmfire"
	can_suppress = 0
	burst_size = 3
	casing_ejector = 1
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/weapon/gun/ballistic/shotgun/pipe
	name = "pipe gun"
	desc = "Can hold one shell."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	icon_state = "pipe-gun"
	item_state = "shotgun"
	origin_tech = "combat=1;materials=1"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/pipe
	casing_ejector = 1
	weapon_weight = WEAPON_LIGHT
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/weapon/gun/ballistic/shotgun/trail
	name = "trail carbine"
	desc = "The trail carbine features a good ammunition capacity, great balance of damage and damage-per-second (DPS), brisk rate of fire, and high accuracy."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	icon_state = "trail-carbine"
	item_state = "shotgun"
	origin_tech = "combat=1;materials=1"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/lethal/trail
	weapon_weight = WEAPON_MEDIUM
	casing_ejector = 1
	w_class = WEIGHT_CLASS_HUGE

/obj/item/weapon/gun/ballistic/automatic/bozar
	name = "\improper Bozar"
	desc = "The ultimate refinement of the sniper's art. Although, somewhat finicky and prone to jamming if not kept scrupulously clean, the big weapon's accuracy more than makes up for its extra maintenance requirements."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	icon_state = "bozar"
	item_state = "arg" //Looks like bozar
	slot_flags = 0
	origin_tech = "combat=6;engineering=3;"
	mag_type = /obj/item/ammo_box/magazine/m223
	weapon_weight = WEAPON_HEAVY
	fire_sound = 'sound/weapons/Gunshot_smg.ogg'
	can_suppress = 0
	burst_size = 3
	fire_delay = 1
	zoomable = TRUE
	zoom_amt = 7
	w_class = WEIGHT_CLASS_HUGE