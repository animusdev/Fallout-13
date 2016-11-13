/obj/item/clothing/head/helmet
	name = "helmet"
	desc = "Standard Security gear. Protects the head from impacts."
	icon_state = "helmet"
	flags = HEADBANGPROTECT
	item_state = "helmet"
	armor = list(melee = 40, bullet = 25, laser = 25,energy = 10, bomb = 25, bio = 0, rad = 0)
	flags_inv = HIDEEARS|HIDEEYES
	cold_protection = HEAD
	min_cold_protection_temperature = HELMET_MIN_TEMP_PROTECT
	heat_protection = HEAD
	max_heat_protection_temperature = HELMET_MAX_TEMP_PROTECT
	strip_delay = 60
	burn_state = FIRE_PROOF
	flags_cover = HEADCOVERSEYES


/obj/item/clothing/head/helmet/New()
	..()

/obj/item/clothing/head/helmet/emp_act(severity)
	..()

/obj/item/clothing/head/helmet/sec
	can_flashlight = 1

/obj/item/clothing/head/helmet/alt
	name = "bulletproof helmet"
	desc = "A bulletproof combat helmet that excels in protecting the wearer against traditional projectile weaponry and explosives to a minor extent."
	icon_state = "helmetalt"
	item_state = "helmetalt"
	armor = list(melee = 15, bullet = 60, laser = 10, energy = 10, bomb = 40, bio = 0, rad = 0)

/obj/item/clothing/head/helmet/riot
	name = "riot helmet"
	desc = "It's a helmet specifically designed to protect against close range attacks."
	icon_state = "riot"
	item_state = "helmet"
	toggle_message = "You pull the visor down on"
	alt_toggle_message = "You push the visor up on"
	can_toggle = 1
	flags = HEADBANGPROTECT
	armor = list(melee = 60, bullet = 15, laser = 5,energy = 5, bomb = 5, bio = 2, rad = 0)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE
	strip_delay = 80
	action_button_name = "Toggle Helmet Visor"
	visor_flags_inv = HIDEMASK|HIDEEYES|HIDEFACE
	toggle_cooldown = 0
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH

/obj/item/clothing/head/helmet/attack_self()
	if(usr.canmove && !usr.stat && !usr.restrained() && can_toggle)
		if(world.time > cooldown + toggle_cooldown)
			cooldown = world.time
			up = !up
			if(up)
				flags &= ~(visor_flags)
				flags_inv &= ~(visor_flags_inv)
				flags_cover &= 0
				icon_state = "[initial(icon_state)]up"
				usr << "[alt_toggle_message] \the [src]"
				usr.update_inv_head()
				if(active_sound)
					while(up)
						playsound(src.loc, "[active_sound]", 100, 0, 4)
						sleep(15)
			else
				flags |= (visor_flags)
				flags_inv |= (visor_flags_inv)
				flags_cover = initial(flags_cover)
				icon_state = initial(icon_state)
				usr << "[toggle_message] \the [src]."
				usr.update_inv_head()


/obj/item/clothing/head/helmet/justice
	name = "helmet of justice"
	desc = "WEEEEOOO. WEEEEEOOO. WEEEEOOOO."
	icon_state = "justice"
	toggle_message = "You turn off the lights on"
	alt_toggle_message = "You turn on the lights on"
	action_button_name = "Toggle Justice Lights"
	can_toggle = 1
	toggle_cooldown = 20
	active_sound = 'sound/items/WEEOO1.ogg'

/obj/item/clothing/head/helmet/justice/escape
	name = "alarm helmet"
	desc = "WEEEEOOO. WEEEEEOOO. STOP THAT MONKEY. WEEEOOOO."
	icon_state = "justice2"
	toggle_message = "You turn off the light on"
	alt_toggle_message = "You turn on the light on"
	action_button_name = "Toggle Alarm Lights"

/obj/item/clothing/head/helmet/swat
	name = "\improper SWAT helmet"
	desc = "An extremely robust, space-worthy helmet in a nefarious red and black stripe pattern."
	icon_state = "swatsyndie"
	item_state = "swatsyndie"
	armor = list(melee = 60, bullet = 40, laser = 45,energy = 25, bomb = 50, bio = 10, rad = 0)
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_HELM_MAX_TEMP_PROTECT
	flags = STOPSPRESSUREDMAGE
	strip_delay = 80

/obj/item/clothing/head/helmet/swat/nanotrasen
	name = "\improper SWAT helmet"
	desc = "An extremely robust, space-worthy helmet with the Nanotrasen logo emblazoned on the top."
	icon_state = "swat"
	item_state = "swat"

/obj/item/clothing/head/helmet/thunderdome
	name = "\improper Thunderdome helmet"
	desc = "<i>'Let the battle commence!'</i>"
	icon_state = "thunderdome"
	item_state = "thunderdome"
	armor = list(melee = 40, bullet = 30, laser = 25,energy = 10, bomb = 25, bio = 10, rad = 0)
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_HELM_MAX_TEMP_PROTECT
	strip_delay = 80

/obj/item/clothing/head/helmet/thunderdome/magneto
	name = "magneto's helmet"
	desc = "This helmet helps to resist all but the strongest or most unexpected of telepathic attacks.<br>This is achieved due to technology wired into the helmet itself."
	icon_state = "thunderdome"
	item_state = "thunderdome"

/obj/item/clothing/head/helmet/roman
	name = "roman helmet"
	desc = "An ancient helmet made of bronze and leather."
	flags_cover = HEADCOVERSEYES
	armor = list(melee = 25, bullet = 0, laser = 25, energy = 10, bomb = 10, bio = 0, rad = 0)
	icon_state = "roman"
	item_state = "roman"
	strip_delay = 100

/obj/item/clothing/head/helmet/roman/legionaire
	name = "roman legionaire helmet"
	desc = "An ancient helmet made of bronze and leather. Has a red crest on top of it."
	icon_state = "roman_c"
	item_state = "roman_c"

/obj/item/clothing/head/helmet/gladiator
	name = "gladiator helmet"
	desc = "Ave, Imperator, morituri te salutant."
	icon_state = "gladiator"
	flags = BLOCKHAIR
	item_state = "gladiator"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES
	flags_cover = HEADCOVERSEYES

/obj/item/clothing/head/helmet/redtaghelm
	name = "red laser tag helmet"
	desc = "They have chosen their own end."
	icon_state = "redtaghelm"
	flags_cover = HEADCOVERSEYES
	item_state = "redtaghelm"
	armor = list(melee = 15, bullet = 10, laser = 20,energy = 10, bomb = 20, bio = 0, rad = 0)
	// Offer about the same protection as a hardhat.
	flags_inv = HIDEEARS|HIDEEYES

/obj/item/clothing/head/helmet/bluetaghelm
	name = "blue laser tag helmet"
	desc = "They'll need more men."
	icon_state = "bluetaghelm"
	flags_cover = HEADCOVERSEYES
	item_state = "bluetaghelm"
	armor = list(melee = 15, bullet = 10, laser = 20,energy = 10, bomb = 20, bio = 0, rad = 0)
	// Offer about the same protection as a hardhat.
	flags_inv = HIDEEARS|HIDEEYES

/obj/item/clothing/head/helmet/knight
	name = "medieval helmet"
	desc = "A classic metal helmet."
	icon_state = "knight_green"
	item_state = "knight_green"
	armor = list(melee = 31, bullet = 10, laser = 10,energy = 5, bomb = 5, bio = 2, rad = 0)
	flags = BLOCKHAIR
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	strip_delay = 80

/obj/item/clothing/head/helmet/knight/blue
	icon_state = "knight_blue"
	item_state = "knight_blue"

/obj/item/clothing/head/helmet/knight/yellow
	icon_state = "knight_yellow"
	item_state = "knight_yellow"

/obj/item/clothing/head/helmet/knight/red
	icon_state = "knight_red"
	item_state = "knight_red"

/obj/item/clothing/head/helmet/knight/templar
	name = "crusader helmet"
	desc = "Deus Vult."
	icon_state = "knight_templar"
	item_state = "knight_templar"

/obj/item/clothing/head/helmet/knight/fluff/metal
	name = "metal helmet"
	icon_state = "metalhelmet"
	item_state = "metalhelmet"

/obj/item/clothing/head/helmet/knight/fluff/rider
	name = "rider helmet" //Not raider. Rider.
	desc = "It's a fancy dark metal helmet with orange spray painted flames."
	icon_state = "rider"
	item_state = "rider"

//Fallout 13

/obj/item/clothing/head/helmet/f13/supaflyhelmet
	name = "supa-fly raider helmet"
	desc = "It's a makeshift raider helmet, made of leather. It heavily smells with chems and sweat."
	icon_state = "supafly"
	item_state = "supafly"
	flags = HEADCOVERSEYES | HEADCOVERSMOUTH | BLOCKHAIR
	armor = list(melee = 10, bullet = 0, laser = 0,energy = 0, bomb = 5, bio = 0, rad = 0)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE

/obj/item/clothing/head/helmet/f13/broken
	name = "broken power helmet"
	desc = "This power armor helmet is so decrepit and battle-worn that it have ceased it's primary function of protecting the wearer from harm.<br>It still can provide some very basic protection though."
	icon_state = "brokenhelmet"
	item_state = "brokenhelmet"
	flags = HEADCOVERSEYES | HEADCOVERSMOUTH | BLOCKHAIR
	armor = list(melee = 30, bullet = 25, laser = 5,energy = 5, bomb = 5, bio = 0, rad = 10)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE

/obj/item/clothing/head/helmet/f13/yankee
	name = "yankee raider helmet"
	desc = "Long time ago, it has belonged to a football player, now it belongs to wasteland."
	icon_state = "yankee"
	item_state = "yankee"
	flags = HEADCOVERSEYES | HEADCOVERSMOUTH | BLOCKHAIR
	armor = list(melee = 50, bullet = 20, laser = 5,energy = 5, bomb = 5, bio = 0, rad = 0)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE

/obj/item/clothing/head/helmet/f13/eyebot
	name = "eyebot helmet"
	desc = "It is a dismantled eyebot, hollowed out to accommodate for a humanoid head."
	icon_state = "eyebot"
	item_state = "eyebot"
	flags = HEADCOVERSEYES | HEADCOVERSMOUTH | BLOCKHAIR
	armor = list(melee = 50, bullet = 10, laser = 15,energy = 15, bomb = 10, bio = 0, rad = 0)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE
	put_on_delay = 10
	strip_delay = 50
	burn_state = FIRE_PROOF

/obj/item/clothing/head/helmet/f13/combat
	name = "combat_helmet"
	desc = "An old combat helmet, out of use around the time of the war."
	icon_state = "combat_helmet"
	item_state = "combat_helmet"
	armor = list(melee = 45, bullet = 45, laser = 15,energy = 25, bomb = 10, bio = 0, rad = 0)
	flags_inv = HIDEEARS
	flags = BLOCKHAIR
	put_on_delay = 10
	strip_delay = 50
	burn_state = FIRE_PROOF

/obj/item/clothing/head/helmet/f13/legrecruit
	name = "legion recruit helmet"
	desc = "It's leather legion recruit helmet."
	icon_state = "legrecruit"
	item_state = "legrecruit"
	armor = list(melee = 35, bullet = 15, laser = 10,energy = 0, bomb = 30, bio = 0, rad = 0)
	flags_inv = HIDEEARS
	flags = BLOCKHAIR
	put_on_delay = 10
	strip_delay = 50
	burn_state = FIRE_PROOF

/obj/item/clothing/head/helmet/f13/legvexil
	name = "legion vexillarius helmet"
	desc = "It's leather legion vexillarius helmet."
	icon_state = "legvexil"
	item_state = "legvexil"
	armor = list(melee = 40, bullet = 20, laser = 10,energy = 0, bomb = 30, bio = 0, rad = 0)
	flags_inv = HIDEEARS
	flags = BLOCKHAIR
	put_on_delay = 10
	strip_delay = 50
	burn_state = FIRE_PROOF

/obj/item/clothing/head/helmet/f13/legdecan
	name = "legion decan helmet"
	desc = "It's leather legion decan helmet."
	icon_state = "legdecan"
	item_state = "legdecan"
	armor = list(melee = 45, bullet = 20, laser = 10,energy = 0, bomb = 30, bio = 0, rad = 0)
	flags_inv = HIDEEARS
	flags = BLOCKHAIR
	put_on_delay = 10
	strip_delay = 50
	burn_state = FIRE_PROOF

/obj/item/clothing/head/helmet/f13/legcenturion
	name = "legion centurion helmet"
	desc = "It's metal legion centurion helmet."
	icon_state = "legcenturion"
	item_state = "legcenturion"
	armor = list(melee = 75, bullet = 40, laser = 25,energy = 15, bomb = 40, bio = 0, rad = 50)
	flags_inv = HIDEEARS
	flags = BLOCKHAIR
	put_on_delay = 10
	strip_delay = 50
	burn_state = FIRE_PROOF

/obj/item/clothing/head/helmet/f13/leglegat
	name = "legion legat helmet"
	desc = "It's metal legion legat helmet."
	icon_state = "leglegat"
	item_state = "leglegat"
	armor = list(melee = 85, bullet = 50, laser = 35,energy = 25, bomb = 50, bio = 0, rad = 60)
	flags = HEADCOVERSEYES | HEADCOVERSMOUTH | BLOCKHAIR
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE
	put_on_delay = 10
	strip_delay = 50
	burn_state = FIRE_PROOF

/obj/item/clothing/head/helmet/f13/rangercombat
	name = "ranger combat helmet"
	desc = "An old combat helmet, out of use around the time of the war."
	icon_state = "ranger"
	item_state = "ranger"
	armor = list(melee = 55, bullet = 50, laser = 35,energy = 25, bomb = 10, bio = 0, rad = 90)
	flags = HEADCOVERSEYES | HEADCOVERSMOUTH | BLOCKHAIR
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE
	put_on_delay = 10
	strip_delay = 50
	burn_state = FIRE_PROOF
	//darkness_view = 8
	//invis_view = SEE_INVISIBLE_MINIMUM
//Power armor helmets

/obj/item/clothing/head/helmet/f13/advhelmet
	name = "advanced Mk I power helmet"
	desc = "It's an advanced power armor Mk I helmet, typically used by the Enclave. It looks somewhat threatening."
	icon_state = "advhelmet"
	item_state = "advhelmet"
	flags = HEADCOVERSEYES | HEADCOVERSMOUTH | STOPSPRESSUREDMAGE | BLOCKHAIR
	armor = list(melee = 90, bullet = 70, laser = 70,energy = 70, bomb = 50, bio = 100, rad = 50)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_HELM_MAX_TEMP_PROTECT
	put_on_delay = 20
	strip_delay = 200
	burn_state = FIRE_PROOF
	unacidable = 1

/obj/item/clothing/head/helmet/f13/t45bhelmet
	name = "salvaged power helmet"
	desc = "It's a pre-War power armor helmet, recovered and maintained by NCR engineers."
	icon_state = "t45bhelmet"
	item_state = "t45bhelmet"
	flags = HEADCOVERSEYES | HEADCOVERSMOUTH | BLOCKHAIR
	armor = list(melee = 70, bullet = 50, laser = 50,energy = 50, bomb = 30, bio = 100, rad = 20)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE
	put_on_delay = 20
	strip_delay = 100
	burn_state = FIRE_PROOF

/obj/item/clothing/head/helmet/f13/t45dhelmet
	name = "T-45d power helmet"
	desc = "It's an old pre-War power armor helmet. It's pretty hot inside of it."
	icon_state = "t45dhelmet"
	item_state = "t45dhelmet"
	flags = HEADCOVERSEYES | HEADCOVERSMOUTH | STOPSPRESSUREDMAGE | BLOCKHAIR
	armor = list(melee = 80, bullet = 60, laser = 60,energy = 60, bomb = 40, bio = 100, rad = 40)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT
	put_on_delay = 20
	strip_delay = 100
	burn_state = FIRE_PROOF
	action_button_name = "Toggle Helmet Light"
	var/brightness_on = 4 //luminosity when the light is on
	var/on = 0

/obj/item/clothing/head/helmet/f13/t45dhelmet/attack_self(mob/user)
	if(!isturf(user.loc))
		user << "<span class='warning'>You cannot turn the light on while in this [user.loc]!</span>" //To prevent some lighting anomalities.
		return
	on = !on
	icon_state = "t45dhelmet-light"
	item_state = "t45dhelmet-light"
	user.update_inv_head()	//so our mob-overlays update

	if(on)
		turn_on(user)
	else
		turn_off(user)

/obj/item/clothing/head/helmet/f13/t45dhelmet/pickup(mob/user)
	if(on)
		user.AddLuminosity(brightness_on)
		SetLuminosity(0)

/obj/item/clothing/head/helmet/f13/t45dhelmet/dropped(mob/user)
	if(on)
		user.AddLuminosity(-brightness_on)
		SetLuminosity(brightness_on)

/obj/item/clothing/head/helmet/f13/t45dhelmet/proc/turn_on(mob/user)
	user.AddLuminosity(brightness_on)

/obj/item/clothing/head/helmet/f13/t45dhelmet/proc/turn_off(mob/user)
	user.AddLuminosity(-brightness_on)

//LightToggle

/obj/item/clothing/head/helmet/update_icon()

	var/state = "[initial(icon_state)]"
	if(F)
		if(F.on)
			state += "-flight-on" //"helmet-flight-on" // "helmet-cam-flight-on"
		else
			state += "-flight" //etc.

	icon_state = state

	if(istype(loc, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = loc
		H.update_inv_head()

	return

/obj/item/clothing/head/helmet/ui_action_click()
	toggle_helmlight()
	..()

/obj/item/clothing/head/helmet/attackby(obj/item/A, mob/user, params)
	if(istype(A, /obj/item/device/flashlight/seclite))
		var/obj/item/device/flashlight/seclite/S = A
		if(can_flashlight)
			if(!F)
				if(!user.unEquip(A))
					return
				user << "<span class='notice'>You click [S] into place on [src].</span>"
				if(S.on)
					SetLuminosity(0)
				F = S
				A.loc = src
				update_icon()
				update_helmlight(user)
				verbs += /obj/item/clothing/head/helmet/proc/toggle_helmlight
		return

	if(istype(A, /obj/item/weapon/screwdriver))
		if(F)
			for(var/obj/item/device/flashlight/seclite/S in src)
				user << "<span class='notice'>You unscrew the seclite from [src].</span>"
				F = null
				S.loc = get_turf(user)
				update_helmlight(user)
				S.update_brightness(user)
				update_icon()
				usr.update_inv_head()
				verbs -= /obj/item/clothing/head/helmet/proc/toggle_helmlight
			return

	..()
	return

/obj/item/clothing/head/helmet/proc/toggle_helmlight()
	set name = "Toggle Helmetlight"
	set category = "Object"
	set desc = "Click to toggle your helmet's attached flashlight."

	if(!F)
		return

	var/mob/user = usr
	if(user.incapacitated())
		return
	if(!isturf(user.loc))
		user << "<span class='warning'>You cannot turn the light on while in this [user.loc]!</span>"
	F.on = !F.on
	user << "<span class='notice'>You toggle the helmetlight [F.on ? "on":"off"].</span>"

	playsound(user, 'sound/weapons/empty.ogg', 100, 1)
	update_helmlight(user)
	return

/obj/item/clothing/head/helmet/proc/update_helmlight(mob/user = null)
	if(F)
		action_button_name = "Toggle Helmetlight"
		if(F.on)
			if(loc == user)
				user.AddLuminosity(F.brightness_on)
			else if(isturf(loc))
				SetLuminosity(F.brightness_on)
		else
			if(loc == user)
				user.AddLuminosity(-F.brightness_on)
			else if(isturf(loc))
				SetLuminosity(0)
		update_icon()
	else
		action_button_name = null
		if(loc == user)
			user.AddLuminosity(-5)
		else if(isturf(loc))
			SetLuminosity(0)
		return

/obj/item/clothing/head/helmet/pickup(mob/user)
	if(F)
		if(F.on)
			user.AddLuminosity(F.brightness_on)
			SetLuminosity(0)


/obj/item/clothing/head/helmet/dropped(mob/user)
	if(F)
		if(F.on)
			user.AddLuminosity(-F.brightness_on)
			SetLuminosity(F.brightness_on)
