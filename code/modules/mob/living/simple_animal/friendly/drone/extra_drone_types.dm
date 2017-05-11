////////////////////
//MORE DRONE TYPES//
////////////////////
//Drones with custom laws
//Drones with custom shells
//Drones with overriden procs
//Drones with camogear for hat related memes
//Drone type for use with polymorph (no preloaded items, random appearance)

//More types of drones
/mob/living/simple_animal/drone/syndrone
	name = "Syndrone"
	desc = "A modified maintenance drone. This one brings with it the feeling of terror."
	icon_state = "drone_synd"
	icon_living = "drone_synd"
	picked = TRUE //the appearence of syndrones is static, you don't get to change it.
	health = 30
	maxHealth = 120 //If you murder other drones and cannibalize them you can get much stronger
	faction = list("syndicate")
	speak_emote = list("hisses")
	bubble_icon = "syndibot"
	heavy_emp_damage = 10
	laws = \
	"1. Interfere.\n"+\
	"2. Kill.\n"+\
	"3. Destroy."
	default_storage = /obj/item/device/radio/uplink
	default_hatmask = /obj/item/clothing/head/helmet/space/hardsuit/syndi
	seeStatic = 0 //Our programming is superior.
	hacked = TRUE

/mob/living/simple_animal/drone/syndrone/New()
	..()
	internal_storage.hidden_uplink.telecrystals = 10

/mob/living/simple_animal/drone/syndrone/Login()
	..()
	src << "<span class='notice'>You can kill and eat other drones to increase your health!</span>" //Inform the evil lil guy

/mob/living/simple_animal/drone/syndrone/badass
	name = "Badass Syndrone"
	default_hatmask = /obj/item/clothing/head/helmet/space/hardsuit/syndi/elite
	default_storage = /obj/item/device/radio/uplink/nuclear

/mob/living/simple_animal/drone/syndrone/badass/New()
	..()
	internal_storage.hidden_uplink.telecrystals = 30
	var/obj/item/weapon/implant/weapons_auth/W = new/obj/item/weapon/implant/weapons_auth(src)
	W.implant(src)

/mob/living/simple_animal/drone/snowflake
	default_hatmask = /obj/item/clothing/head/chameleon/drone

/mob/living/simple_animal/drone/snowflake/New()
	..()
	desc += " This drone appears to have a complex holoprojector built on its 'head'."

/obj/item/drone_shell/syndrone
	name = "syndrone shell"
	desc = "A shell of a syndrone, a modified maintenance drone designed to infiltrate and annihilate."
	icon_state = "syndrone_item"
	drone_type = /mob/living/simple_animal/drone/syndrone

/obj/item/drone_shell/syndrone/badass
	name = "badass syndrone shell"
	drone_type = /mob/living/simple_animal/drone/syndrone/badass

/obj/item/drone_shell/snowflake
	name = "snowflake drone shell"
	desc = "A shell of a snowflake drone, a maintenance drone with a built in holographic projector to display hats and masks."
	drone_type = /mob/living/simple_animal/drone/snowflake

/mob/living/simple_animal/drone/polymorphed
	default_storage = null
	default_hatmask = null
	picked = TRUE

/mob/living/simple_animal/drone/polymorphed/New()
	. = ..()
	liberate()
	visualAppearence = pick(MAINTDRONE, REPAIRDRONE, SCOUTDRONE)
	if(visualAppearence == MAINTDRONE)
		var/colour = pick("grey", "blue", "red", "green", "pink", "orange")
		icon_state = "[visualAppearence]_[colour]"
	else
		icon_state = visualAppearence

	icon_living = icon_state
	icon_dead = "[visualAppearence]_dead"

/mob/living/simple_animal/drone/cogscarab
	name = "cogscarab"
	desc = "A strange, drone-like machine. It constantly emits the hum of gears."
	icon_state = "drone_clock"
	icon_living = "drone_clock"
	icon_dead = "drone_clock_dead"
	picked = TRUE
	languages_spoken = RATVAR
	languages_understood = HUMAN|RATVAR
	pass_flags = PASSTABLE
	health = 50
	maxHealth = 50
	harm_intent_damage = 5
	density = TRUE
	speed = 1
	ventcrawler = VENTCRAWLER_NONE
	faction = list("ratvar")
	speak_emote = list("clanks", "clinks", "clunks", "clangs")
	verb_ask = "requests"
	verb_exclaim = "proclaims"
	verb_yell = "harangues"
	bubble_icon = "clock"
	heavy_emp_damage = 0
	laws = "0. Purge all untruths and honor Ratvar."
	default_storage = /obj/item/weapon/storage/toolbox/brass/prefilled
	seeStatic = 0
	hacked = TRUE
	visualAppearence = CLOCKDRONE
	can_be_held = FALSE

/mob/living/simple_animal/drone/cogscarab/ratvar //a subtype for spawning when ratvar is alive, has a slab that it can use and a normal proselytizer
	default_storage = /obj/item/weapon/storage/toolbox/brass/prefilled/ratvar

/mob/living/simple_animal/drone/cogscarab/admin //an admin-only subtype of cogscarab with a no-cost proselytizer and slab in its box
	default_storage = /obj/item/weapon/storage/toolbox/brass/prefilled/ratvar/admin

/mob/living/simple_animal/drone/cogscarab/New()
	. = ..()
	set_light(2,1)
	qdel(access_card) //we don't have free access
	access_card = null
	verbs -= /mob/living/simple_animal/drone/verb/check_laws
	verbs -= /mob/living/simple_animal/drone/verb/toggle_light
	verbs -= /mob/living/simple_animal/drone/verb/drone_ping

/mob/living/simple_animal/drone/cogscarab/Login()
	..()
	add_servant_of_ratvar(src, TRUE)
	src << "<span class='heavy_brass'>You are a cogscarab</span><b>, a clockwork creation of Ratvar. As a cogscarab, you have low health, an inbuilt proselytizer that can convert brass \
	to liquified alloy, a set of relatively fast tools, </b><span class='heavy_brass'>can communicate over the Hierophant Network with :b</span><b>, and are immune to extreme \
	temperatures and pressures. \nYour goal is to serve the Justiciar and his servants by repairing and defending all they create. \
	\nYou yourself are one of these servants, and will be able to utilize almost anything they can[ratvar_awakens ? "":", <i>excluding a clockwork slab</i>"].</b>"

/mob/living/simple_animal/drone/cogscarab/binarycheck()
	return FALSE

/mob/living/simple_animal/drone/cogscarab/alert_drones(msg, dead_can_hear = 0)
	if(msg == DRONE_NET_CONNECT)
		msg = "<span class='brass'><i>Hierophant Network:</i> [name] activated.</span>"
	else if(msg == DRONE_NET_DISCONNECT)
		msg = "<span class='brass'><i>Hierophant Network:</i></span> <span class='alloy'>[name] disabled.</span>"
	..()

/mob/living/simple_animal/drone/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/weapon/screwdriver) && stat == DEAD)
		try_reactivate(user)
	else
		..()

/mob/living/simple_animal/drone/cogscarab/try_reactivate(mob/living/user)
	if(!is_servant_of_ratvar(user))
		user << "<span class='warning'>You fiddle around with [src] to no avail.</span>"
	else
		..()

/mob/living/simple_animal/drone/cogscarab/can_use_guns(obj/item/weapon/gun/G)
	changeNext_move(CLICK_CD_RANGE*4) //about as much delay as an unupgraded kinetic accelerator
	return TRUE

/mob/living/simple_animal/drone/cogscarab/triggerAlarm(class, area/A, O, obj/alarmsource)
	return

/mob/living/simple_animal/drone/cogscarab/cancelAlarm(class, area/A, obj/origin)
	return

/mob/living/simple_animal/drone/cogscarab/update_drone_hack()
	return //we don't get hacked or give a shit about it

/mob/living/simple_animal/drone/cogscarab/drone_chat(msg)
	titled_hierophant_message(src, msg, "nezbere", "brass", "Construct") //HIEROPHANT DRONES

/mob/living/simple_animal/drone/cogscarab/ratvar_act()
	fully_heal(TRUE)

/mob/living/simple_animal/drone/hand
	name = "Handbot"
	desc = ""
	icon = 'icons/mob/drone.dmi'
	icon_state = "robobrain"
	icon_living = "robobrain"
	icon_dead = "robobrain-frame"
	picked = TRUE //the appearence of syndrones is static, you don't get to change it.
	health = 200
	maxHealth = 200
	unsuitable_atmos_damage = 0
	harm_intent_damage = 0
	response_help  = "passes through"
	response_disarm = "flails at"
	response_harm   = "punches"
	a_intent = INTENT_HARM
	obj_damage = 40
	melee_damage_lower = 10
	melee_damage_upper = 20
	attacktext = "slashes"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	speed = 2
	sight = 0
	pass_flags = 0
	dextrous = TRUE
	density = TRUE
	ventcrawler = VENTCRAWLER_NONE
	healable = 0
	status_flags = (CANPUSH | CANSTUN)
	gender = NEUTER
	voice_name = "synthesized voice"
	speak_emote = list("clanks", "clinks", "clunks", "clangs")
	verb_ask = "requests"
	verb_exclaim = "proclaims"
	verb_yell = "harangues"
	bubble_icon = "machine"
	languages_spoken = ROBOT | HUMAN
	languages_understood = ROBOT | HUMAN
	has_unlimited_silicon_privilege = 1
	can_be_held = FALSE
	damage_coeff = list(BRUTE = 0.6, BURN = 0.7, TOX = 0, CLONE = 0, STAMINA = 0, OXY = 0)
	heavy_emp_damage = 25
	default_storage = /obj/item/weapon/storage/backpack/dufflebag/brassbox
	mob_size = MOB_SIZE_LARGE
	see_in_dark = 4
	laws = \
	"1. Interfere.\n"+\
	"2. Kill.\n"+\
	"3. Destroy."
	seeStatic = 0 //Our programming is superior.

/mob/living/simple_animal/drone/hand/can_use_guns(obj/item/weapon/gun/G)
	changeNext_move(CLICK_CD_RANGE*4) //about as much delay as an unupgraded kinetic accelerator
	return TRUE

/mob/living/simple_animal/drone/hand/attackby(obj/item/weapon/W, mob/user, params)
	if(istype(W, /obj/item/weapon/weldingtool) && (user.a_intent != INTENT_HARM || user == src))
		user.changeNext_move(CLICK_CD_MELEE)
		var/obj/item/weapon/weldingtool/WT = W
		if (!getBruteLoss())
			user << "<span class='warning'>[src] is already in good condition!</span>"
			return
		if (WT.remove_fuel(0, user)) //The welder has 1u of fuel consumed by it's afterattack, so we don't need to worry about taking any away.
			if(src == user)
				user << "<span class='notice'>You start fixing yourself...</span>"
				if(!do_after(user, 50, target = src))
					return

			adjustBruteLoss(-30)
			updatehealth()
			add_fingerprint(user)
			visible_message("<span class='notice'>[user] has fixed some of the dents on [src].</span>")
			return
		else
			user << "<span class='warning'>The welder must be on for this task!</span>"
			return

/mob/living/simple_animal/drone/hand/brainbot
	name = "RB - "
	desc = "A robobrain - multi-purpose robot.<br>Its memories and programs are stored inside an organic or partially organic brain, contained in a domed shell atop its chassis.<br>It's considered intuitively superior to most robots, as human brains allow them a wider range of responses and functions.<br>Its hands can operate most tools and weapons usable by humans."
	health = 200
	maxHealth = 200

///mob/living/simple_animal/drone/hand/humanoid
//	name = "C-27"
//	desc = ""
//	icon_state = "drone_synd"
//	icon_living = "drone_synd"
//	icon_dead = "drone_maint_dead"
//	health = 300
//	maxHealth = 300
//	unsuitable_atmos_damage = 0
//	status_flags = (CANSTUN)
//	response_harm = "harmlessly punches"
//	obj_damage = 60
//	damage_coeff = list(BRUTE = 0.5, BURN = 0.6, TOX = 0, CLONE = 0, STAMINA = 0, OXY = 0)
//	melee_damage_lower = 15
//	melee_damage_upper = 25
//	attacktext = "smashes their armored gauntlet into"
//	speed = 3
//	environment_smash = 2
//	attack_sound = 'sound/weapons/punch3.ogg'
//
///mob/living/simple_animal/drone/hand/humanoid/bullet_act(obj/item/projectile/P)
//	if(istype(P, /obj/item/projectile/bullet))
//		var/reflectchance = 80 - round(P.damage/3)
//		if(prob(reflectchance))
//			apply_damage(P.damage * 0.2, P.damage_type)
//			visible_message("<span class='danger'>The [P.name] is reflected by [src]'s armored shell!</span>", \
//							"<span class='userdanger'>The [P.name] is reflected by your armored shell!</span>")
//
//			// Find a turf near or on the original location to bounce to
//			if(P.starting)
//				var/new_x = P.starting.x + pick(0, 0, -1, 1, -2, 2, -2, 2, -2, 2, -3, 3, -3, 3)
//				var/new_y = P.starting.y + pick(0, 0, -1, 1, -2, 2, -2, 2, -2, 2, -3, 3, -3, 3)
//				var/turf/curloc = get_turf(src)
//
//				// redirect the projectile
//				P.original = locate(new_x, new_y, P.z)
//				P.starting = curloc
//				P.current = curloc
//				P.firer = src
//				P.yo = new_y - curloc.y
//				P.xo = new_x - curloc.x
//
//			return -1 // complete projectile permutation
//	else if(istype(P, /obj/item/projectile/energy) || istype(P, /obj/item/projectile/beam))
//		var/reflectchance2 = 40 - round(P.damage/3)
//		if(prob(reflectchance2))
//			apply_damage(P.damage * 0.5, P.damage_type)
//			visible_message("<span class='danger'>The [P.name] is reflected by [src]'s armor!</span>", \
//							"<span class='userdanger'>The [P.name] is reflected by your armor!</span>")
//
//			// Find a turf near or on the original location to bounce to
//			if(P.starting)
//				var/new_x = P.starting.x + pick(0, 0, -1, 1, -2, 2, -2, 2, -2, 2, -3, 3, -3, 3)
//				var/new_y = P.starting.y + pick(0, 0, -1, 1, -2, 2, -2, 2, -2, 2, -3, 3, -3, 3)
//				var/turf/curloc = get_turf(src)
//
//				// redirect the projectile
//				P.original = locate(new_x, new_y, P.z)
//				P.starting = curloc
//				P.current = curloc
//				P.firer = src
//				P.yo = new_y - curloc.y
//				P.xo = new_x - curloc.x
//
//			return -1 // complete projectile permutation
//	return (..(P))

/obj/item/weapon/storage/backpack/dufflebag/brassbox
	name = "Brassbox"
	desc = "A large container."
	icon_state = "brassbox"
	item_state = "brassbox"
	resistance_flags = FIRE_PROOF

/obj/item/weapon/storage/backpack/dufflebag/brassbox/New()
	..()

	new /obj/item/weapon/screwdriver(src)
	new /obj/item/weapon/wrench(src)
	new /obj/item/weapon/weldingtool(src)
	new /obj/item/weapon/crowbar(src)
	new /obj/item/stack/cable_coil/random(src)
	new /obj/item/weapon/powergauntlet/robot(src)
