//Fallout 13 ballistic firearms directory

/obj/item/weapon/gun/ballistic/automatic/pistol/n99
	name = "10-mm pistol"
	desc = "The N99 self-loading pistol is known for its ability to survive in the harshest of conditions.<br>This great weapon is able to be reliably restored to working condition, even after extended exposure to hard elements without maintenance."
	icon_state = "n99"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/F13/m10
	fire_sound = "10mmfire"
	force = 13
	can_suppress = 1
	burst_size = 1
	fire_delay = 0
	w_class = 2

/obj/item/weapon/gun/ballistic/automatic/pistol/n99/update_icon()
	..()
	icon_state = "[initial(icon_state)][magazine && magazine.max_ammo == 12 ? "-[magazine.max_ammo]" : ""][chambered ? "" : "-e"][suppressed ? "-suppressed" : ""]"
	return

/obj/item/weapon/gun/ballistic/revolver/magnum
	name = "Magnum"
	icon_state = "44magnum"
	desc = "The Smith & Wesson Model 29 is a powerful six-shot double-action revolver, manufactured by the U.S. company Smith & Wesson since 1955.<br>Centuries later, copies of it can still be found in the wastes."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/m44
	can_suppress = 0
	fire_sound = 'sound/f13weapons/magnum_fire.ogg'
	burst_size = 1
	casing_ejector = 0
	zoomable = TRUE
	zoom_amt = 7
	w_class = WEIGHT_CLASS_NORMAL
	self_weight = 0.85
	recoil = 2
	scopetype = /obj/screen/fullscreen/scope/short

/obj/item/weapon/gun/ballistic/automatic/rifle
	name = "Automatic Rifle .308"
	icon_state = "rifle-automatic"
	item_state = "shotgun"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	origin_tech = "combat=3;materials=2"
	mag_type = /obj/item/ammo_box/magazine/F13/m308
	can_suppress = 1
	casing_ejector = 1
	weapon_weight = WEAPON_HEAVY
	slot_flags = SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	mag_load_sound = 'sound/effects/wep_magazines/ar_load.ogg'
	mag_unload_sound = 'sound/effects/wep_magazines/ar_unload.ogg'
	chamber_sound = 'sound/effects/wep_magazines/ar_chamber.ogg'
	recoil = 2

//crc
/obj/item/weapon/gun/ballistic/automatic/garand
	name = "Garand M1"
	desc = "Vintage semi-automatic rifle. Advanced."
	icon_state = "garand"
	item_state = "shotgun"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	origin_tech = "combat=3;materials=2"
	mag_type = /obj/item/ammo_box/magazine/F13/g308
	can_suppress = 1
	casing_ejector = 1
	burst_size = 0
	wielded_icon = "shotgun1"
	weapon_weight = WEAPON_HEAVY
	slot_flags = SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	mag_load_sound = 'sound/effects/wep_magazines/ar_load.ogg'
	mag_unload_sound = 'sound/weapons/garandclip.ogg'
	chamber_sound = 'sound/effects/wep_magazines/ar_chamber.ogg'
	recoil = 2
	fire_sound = 'sound/weapons/garandshot.ogg'


/obj/item/weapon/gun/ballistic/automatic/garand/shoot_with_empty_chamber(mob/living/user as mob)
	if(magazine.stored_ammo.len <= 1)
		to_chat(user, "<span class='notice'>clip ejected!</span>")
		magazine.dropped()
		magazine.forceMove(get_turf(src.loc))
		magazine.update_icon()
		magazine = null
		playsound(user, 'sound/weapons/garandclip.ogg', 100, 1)


/obj/item/weapon/gun/ballistic/automatic/gauss
	name = "M72 Gauss EM rifle"
	desc = "The M72 rifle is of German design. It uses an electromagnetic field to propel rounds at tremendous speed."
	icon_state = "gauss"
	item_state = "shotgun"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	origin_tech = "combat=4;materials=4"
	mag_type = /obj/item/ammo_box/magazine/F13/gaussmag
	suppressed = 1
	casing_ejector = 1
	burst_size = 0
	wielded_icon = "shotgun1"
	weapon_weight = WEAPON_HEAVY
	slot_flags = SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	mag_load_sound = 'sound/effects/wep_magazines/ar_load.ogg'
	mag_unload_sound = 'sound/effects/wep_magazines/ar_unload.ogg'
	chamber_sound = 'sound/effects/wep_magazines/ar_chamber.ogg'
	fire_sound = 'sound/weapons/bulletflyby.ogg'
//crc


/obj/item/weapon/gun/ballistic/shotgun/rifle
	name = "Rifle .308"
	desc = "A pre-War bolt-action hunting rifle."
	icon_state = "rifle"
	item_state = "shotgun"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	origin_tech = "combat=3;materials=2"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/m308
	can_suppress = 1
	casing_ejector = 0
	weapon_weight = WEAPON_HEAVY
	slot_flags = SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	pumpsound = 'sound/weapons/boltpump.ogg'
	mag_load_sound = 'sound/effects/wep_magazines/rifle_load.ogg'
	recoil = 2

/obj/item/weapon/gun/ballistic/shotgun/rifle/scope
	icon_state = "rifle-scope"
	item_state = "shotgun"
	can_suppress = 1
	zoomable = TRUE
	zoom_amt = 12
	weapon_weight = WEAPON_HEAVY
	slot_flags = SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	scopetype = /obj/screen/fullscreen/scope/medium

/obj/item/weapon/gun/ballistic/automatic/smg10mm
	name = "10-mm submachine gun"
	desc = "An H&K MP9 submachine gun (10mm caliber variant). A average submachine gun which can operate in both single and automatic fire modes."
	icon_state = "smg10mm"
	item_state = "assault"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	origin_tech = "combat=3;materials=2"
	mag_type = /obj/item/ammo_box/magazine/F13/m10smg
	fire_sound = "10mmfire"
	can_suppress = 0
	burst_size = 3
	casing_ejector = 1
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/weapon/gun/ballistic/shotgun/pipe
	name = "pipe gun"
	desc = "A makeshift shotgun that can hold a single shell."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	icon_state = "pipe-gun"
	item_state = "shotgun"
	origin_tech = "combat=1;materials=1"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/pipe
	casing_ejector = 1
	weapon_weight = WEAPON_HEAVY
	w_class = WEIGHT_CLASS_BULKY

/obj/item/weapon/gun/ballistic/shotgun/trail
	name = "trail carbine"
	desc = "The trail carbine features a good ammunition capacity, a brisk rate of fire, and high accuracy."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	icon_state = "trail-carbine"
	item_state = "shotgun"
	origin_tech = "combat=1;materials=1"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/lethal/trail
	casing_ejector = 1
	weapon_weight = WEAPON_HEAVY
	slot_flags = SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	pumpsound = 'sound/f13weapons/repeater_reload.ogg'
	recoil = 2

/obj/item/weapon/gun/ballistic/automatic/assault_rifle
	name = "Battle Rifle ��15"
	desc = "Also known as a Service Rifle by NCR troops, the Battle Rifle is a semi-automatic medium power rifle which takes the common 5.56mm cartridge and has a magazine capacity of 20 rounds."
	icon_state = "assault-rifle"
	item_state = "assault"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	origin_tech = "combat=3;materials=2"
	mag_type = /obj/item/ammo_box/magazine/F13/m556
	fire_sound = 'sound/f13weapons/assaultrifle_fire.ogg'
	burst_size = 2
	can_suppress = 0
	casing_ejector = 1
	weapon_weight = WEAPON_HEAVY
	slot_flags = SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	mag_load_sound = 'sound/effects/wep_magazines/ar_load.ogg'
	mag_unload_sound = 'sound/effects/wep_magazines/ar_unload.ogg'
	chamber_sound = 'sound/effects/wep_magazines/ar_chamber.ogg'
	wielded_icon = "assault-wielded"//Two handing

/obj/item/weapon/gun/ballistic/automatic/bozar
	name = "\improper Bozar"
	desc = "The ultimate refinement of the sniper's art.<br>Although somewhat finicky and prone to jamming if not kept immacuately clean, its accuracy more than makes up for its extra maintenance requirements."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	icon_state = "bozar"
	item_state = "arg" //Looks like bozar
	slot_flags = 0
	origin_tech = "combat=6;engineering=3;"
	mag_type = /obj/item/ammo_box/magazine/F13/m223
	fire_sound = 'sound/weapons/Gunshot_smg.ogg'
	can_suppress = 0
	burst_size = 3
	fire_delay = 1
	zoomable = TRUE
	zoom_amt = 7
	weapon_weight = WEAPON_HEAVY
	w_class = WEIGHT_CLASS_HUGE
	recoil = 2
	scopetype = /obj/screen/fullscreen/scope/long