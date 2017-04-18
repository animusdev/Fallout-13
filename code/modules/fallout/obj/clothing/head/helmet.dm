//Fallout 13 protective helmets directory

/obj/item/clothing/head/helmet/f13
	icon = 'icons/fallout/clothing/hats.dmi'

/obj/item/clothing/head/helmet/f13/supaflyhelmet
	name = "supa-fly raider helmet"
	desc = "A makeshift raider helmet, made of leather.<br>It heavily smells with chems and sweat."
	icon_state = "supafly"
	item_state = "supafly"
	flags = HEADCOVERSEYES | HEADCOVERSMOUTH
	armor = list(melee = 10, bullet = 10, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0,fire = 0, acid = 0)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR
	self_weight = 1.5

/obj/item/clothing/head/helmet/f13/broken
	name = "broken power helmet"
	desc = "This power armor helmet is so decrepit and battle-worn that it has ceased it's primary function of protecting the wearer from harm.<br>It still can provide some very basic protection though."
	icon_state = "broken"
	item_state = "broken"
	flags = HEADCOVERSEYES | HEADCOVERSMOUTH
	armor = list(melee = 20, bullet = 10, laser = 0, energy = 0, bomb = 10, bio = 0, rad = 10,fire = 0, acid = 0)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR
	self_weight = 3

/obj/item/clothing/head/helmet/f13/tribal
	name = "tribal power helmet"
	desc = "This power armor helmet was salvaged by the savages from the battlefield.<br>They believe that helmet captures the spirit of the fallen warrior, so they painted some runes on, to give it a more sacred meaning."
	icon_state = "tribal"
	item_state = "tribal"
	flags = HEADCOVERSEYES | HEADCOVERSMOUTH
	armor = list(melee = 30, bullet = 10, laser = 0, energy = 0, bomb = 10, bio = 0, rad = 10,fire = 0, acid = 0)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR
	self_weight = 2

/obj/item/clothing/head/helmet/f13/yankee
	name = "yankee raider helmet"
	desc = "Long time ago, it has belonged to a football player, now it belongs to wasteland."
	icon_state = "yankee"
	item_state = "yankee"
	flags = HEADCOVERSEYES | HEADCOVERSMOUTH
	armor = list(melee = 30, bullet = 10, laser = 0, energy = 0, bomb = 10, bio = 0, rad = 0,fire = 0, acid = 0)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR
	self_weight = 1.5

/obj/item/clothing/head/helmet/f13/eyebot
	name = "eyebot helmet"
	desc = "A dismantled eyebot, hollowed out to accommodate for a humanoid head."
	icon_state = "eyebot"
	item_state = "eyebot"
	flags = HEADCOVERSEYES | HEADCOVERSMOUTH
	armor = list(melee = 40, bullet = 20, laser = 10, energy = 10, bomb = 10, bio = 0, rad = 0, acid = 20)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES||HIDEHAIR
	put_on_delay = 10
	strip_delay = 50
	resistance_flags = FIRE_PROOF
	self_weight = 0.5

/obj/item/clothing/head/helmet/f13/combat
	name = "combat helmet"
	desc = "An old combat helmet, out of use around the time of the Great War."
	icon_state = "combat"
	item_state = "combat"
	armor = list(melee = 50, bullet = 30, laser = 20, energy = 20, bomb = 20, bio = 0, rad = 0, acid = 0)
	flags_inv = HIDEEARS|HIDEHAIR
	put_on_delay = 10
	strip_delay = 50
	resistance_flags = FIRE_PROOF
	self_weight = 2

/obj/item/clothing/head/helmet/f13/trooper
	name = "trooper helmet"
	desc = "A dully-colored helmet designed to provide troopers a basic head protection.<br>It has a very rough \"mass produced\" look to it, as it is issued to all NCR soldiers and MPs."
	icon_state = "trooper"
	item_state = "trooper"
	armor = list(melee = 30, bullet = 20, laser = 10, energy = 10, bomb = 20, bio = 0, rad = 0, acid = 10)
	flags_inv = HIDEEARS|HIDEHAIR
	put_on_delay = 10
	strip_delay = 30
	resistance_flags = FIRE_PROOF
	self_weight = 0.2

/obj/item/clothing/head/helmet/f13/ranger
	name = "ranger helmet"
	desc = "An old military helmet, commonly worn by NCR Rangers."
	icon_state = "ranger"
	item_state = "ranger"
	armor = list(melee = 50, bullet = 30, laser = 30, energy = 30, bomb = 30, bio = 0, rad = 80, acid = 20)
	flags = HEADCOVERSEYES | HEADCOVERSMOUTH
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR
	put_on_delay = 10
	strip_delay = 50
	resistance_flags = FIRE_PROOF
	self_weight = 0.45
	darkness_view = 8
	invis_view = SEE_INVISIBLE_MINIMUM
	glass_colour_type = /datum/client_colour/glass_colour/red
	actions_types = list(/datum/action/item_action/toggle)
	visor_vars_to_toggle = VISOR_DARKNESSVIEW | VISOR_INVISVIEW
	can_toggle = 1
	var/enabled = 1

/obj/item/clothing/head/helmet/f13/ranger/New()
	..()
	visor_toggling()

/obj/item/clothing/head/helmet/f13/ranger/attack_self(mob/user)
	to_chat(user, "<span class='notice'>You [up ? "enabled" : "disabled"] [src].</span>")
	visor_toggling()
	user << sound('sound/misc/compiler-stage2.ogg',0,0,0,50)
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		C.head_update(src, forced = 1)
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()

/obj/item/clothing/head/helmet/f13/ranger/old
	name = "old ranger helmet"
	desc = "An old military helmet, commonly worn by Desert Rangers, that went through the fire and flames, saving a single life in a heavy bloodshed.<br>This particular helmet has a \"Forgive me mama\" insciption on the side."
	icon_state = "oldranger"
	item_state = "oldranger"
	armor = list(melee = 40, bullet = 20, laser = 20, energy = 20, bomb = 20, bio = 0, rad = 40, acid = 10)
	self_weight = 0.45

/obj/item/clothing/head/helmet/f13/legrecruit
	name = "recruit helmet"
	desc = "A Legion recruit helmet, that's made of fine molerat leather. Or was it gecko leather? I think this other guy from Legion had a helmet made of brahmin leather..."
	icon_state = "legrecruit"
	item_state = "legrecruit"
	armor = list(melee = 30, bullet = 20, laser = 10, energy = 10, bomb = 20, bio = 0, rad = 0,fire = 0, acid = 10)
	flags_inv = HIDEEARS|HIDEHAIR
	put_on_delay = 10
	strip_delay = 30
	self_weight = 0.6

/obj/item/clothing/head/helmet/f13/legvexil
	name = "vexillarius hat"
	desc = "Vis gregis est lupus, ac vis lupi est grex.<br>100% of wolf."
	icon_state = "legvexil"
	item_state = "legvexil"
	armor = list(melee = 20, bullet = 10, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0,fire = 0, acid = 0)
	flags_inv = HIDEEARS|HIDEHAIR
	put_on_delay = 10
	strip_delay = 50
	self_weight = 0.6

/obj/item/clothing/head/helmet/f13/legdecan
	name = "decanus helmet"
	desc = "A Legion decanus helmet, it's made of tanned leather and decorated with feathers."
	icon_state = "legdecan"
	item_state = "legdecan"
	armor = list(melee = 40, bullet = 20, laser = 10, energy = 10, bomb = 30, bio = 0, rad = 0,fire = 0, acid = 0)
	flags_inv = HIDEEARS|HIDEHAIR
	put_on_delay = 10
	strip_delay = 40
	self_weight = 0.6

/obj/item/clothing/head/helmet/f13/legdecan/alt //Variant with spiky feathers and pre-made goggles.
	name = "decanus helmet"
	desc = "A Legion decanus helmet, it's made of tanned leather.<br>This one has particularly spiky feathers..."
	icon_state = "legdecanalt"
	item_state = "legdecanalt"
	flags = HEADCOVERSEYES
	flags_inv = HIDEHAIR

/obj/item/clothing/head/helmet/f13/legcenturion
	name = "centurion helmet"
	desc = "A metal helmet commonly worn by Caesar's Legion ranked officer - the Centurion."
	icon_state = "legcenturion"
	item_state = "legcenturion"
	armor = list(melee = 50, bullet = 30, laser = 20, energy = 20, bomb = 20, bio = 0, rad = 30, fire = 30, acid = 30)
	flags_inv = HIDEEARS|HIDEHAIR
	put_on_delay = 10
	strip_delay = 50
	self_weight = 0.6

/obj/item/clothing/head/helmet/f13/leglegate
	name = "legate helmet"
	desc = "A metal helmet destined to adorn the head of Caesar's Legion ranked officer - the Legate."
	icon_state = "leglegate"
	item_state = "leglegate"
	armor = list(melee = 60, bullet = 40, laser = 30, energy = 30, bomb = 30, bio = 0, rad = 40, acid = 20)
	flags = HEADCOVERSEYES | HEADCOVERSMOUTH
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR
	put_on_delay = 10
	strip_delay = 50
	resistance_flags = FIRE_PROOF
	self_weight = 0.6

/obj/item/clothing/head/f13/strange
	name = "strange helmet"
	desc = "That's a very strange metal helmet...<br>I want to believe."
	icon = 'icons/fallout/clothing/hats.dmi'
	icon_state = "strange"
	item_state = "helmet"
	armor = list(melee = 40, bullet = 20, laser = 40, energy = 40, bomb = 20, bio = 100, rad = 50, acid = 100)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES||HIDEHAIR
	put_on_delay = 10
	strip_delay = 50
	resistance_flags = FIRE_PROOF
	self_weight = 3

/obj/item/clothing/head/helmet/f13/doom
	name = "marine helmet"
	desc = "A helmet made of an unknown alloy.<br>You feel like this helmet would allow you to survive through Hell on Earth, or on Mars, it doesn't matter..."
	icon_state = "doom"
	item_state = "doom"
	armor = list(melee = 50, bullet = 40, laser = 40, energy = 40, bomb = 50, bio = 100, rad = 100, fire = 100)
	flags_inv = HIDEEARS|HIDEHAIR
	put_on_delay = 30
	strip_delay = 10
	resistance_flags = UNACIDABLE
	self_weight = 1

/obj/item/clothing/head/helmet/f13/magneto
	name = "magneto's helmet"
	desc = "This helmet helps to resist all but the strongest or most unexpected of telepathic attacks.<br>This is achieved due to technology wired into the helmet itself."
	icon_state = "magneto"
	item_state = "magneto"
	armor = list(melee = 60, bullet = 50, laser = 50, energy = 50, bomb = 60, bio = 100, rad = 100, fire = 30)
	flags_inv = HIDEEARS|HIDEHAIR
	put_on_delay = 10
	strip_delay = 50
	resistance_flags = UNACIDABLE
	self_weight = 0.5

//Power armor helmets
/obj/item/clothing/head/helmet/power_armor
	var/brightness_on = 4 //luminosity when the light is on
	var/on = 0
	light_color = LIGHT_COLOR_YELLOW
	icon = 'icons/fallout/clothing/hats.dmi'

/obj/item/clothing/head/helmet/power_armor/proc/toogle_light(mob/user)
	on = !on
	icon_state = "[initial(icon_state)][on ? "-light" : ""]"
	item_state = "[initial(item_state)][on ? "-light" : ""]"
	user.update_inv_head()
	if(on)
		set_light(brightness_on)
	else
		set_light(0)
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()

/obj/item/clothing/head/helmet/power_armor/ui_action_click(mob/user, actiontype)
	if(istype(actiontype, /datum/action/item_action/toggle_helmet_light))
		toogle_light(user)
		return 1
	return ..()

/obj/item/clothing/head/helmet/power_armor/shocktrooper
	name = "shocktrooper power helmet"
	desc = "A 'black devil' power armor helmet used exclusively by the Enclave military forces, developed after the Great War, and the destruction of the Enclave Oil Rig in 2241.<br>It looks badass."
	icon_state = "shocktrooper"
	item_state = "shocktrooper"
	flags = HEADCOVERSEYES | HEADCOVERSMOUTH | STOPSPRESSUREDMAGE
	armor = list(melee = 90, bullet = 70, laser = 60, energy = 60, bomb = 70, bio = 100, rad = 90)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_HELM_MAX_TEMP_PROTECT
	put_on_delay = 50
	strip_delay = 200
	resistance_flags = FIRE_PROOF | UNACIDABLE
	self_weight = 5

/obj/item/clothing/head/helmet/power_armor/superadvanced
	name = "advanced Mk II power helmet"
	desc = "An advanced power armor Mk II helmet - an improved model of advanced power armor used exclusively by the Enclave military forces, developed after the Great War.<br>It looks rather threatening."
	icon_state = "superadvanced"
	item_state = "superadvanced"
	flags = HEADCOVERSEYES | HEADCOVERSMOUTH | STOPSPRESSUREDMAGE
	armor = list(melee = 80, bullet = 60, laser = 50, energy = 50, bomb = 60, bio = 100, rad = 80)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_HELM_MAX_TEMP_PROTECT
	put_on_delay = 50
	strip_delay = 200
	resistance_flags = FIRE_PROOF | UNACIDABLE
	self_weight = 5

/obj/item/clothing/head/helmet/power_armor/advanced
	name = "advanced Mk I power helmet"
	desc = "An advanced power armor Mk I helmet, typically used by the Enclave. It looks somewhat threatening."
	icon_state = "advanced"
	item_state = "advanced"
	flags = HEADCOVERSEYES | HEADCOVERSMOUTH | STOPSPRESSUREDMAGE
	armor = list(melee = 70, bullet = 50, laser = 40, energy = 40, bomb = 50, bio = 100, rad = 70)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_HELM_MAX_TEMP_PROTECT
	put_on_delay = 50
	strip_delay = 200
	resistance_flags = FIRE_PROOF | UNACIDABLE
	self_weight = 5

/obj/item/clothing/head/helmet/power_armor/ncr
	name = "salvaged power helmet"
	desc = "A pre-War power armor helmet, recovered and maintained by NCR engineers.<br>It's damn hot inside of it."
	icon_state = "t45bhelmet"
	item_state = "t45bhelmet"
	flags = HEADCOVERSEYES | HEADCOVERSMOUTH
	armor = list(melee = 50, bullet = 30, laser = 20, energy = 20, bomb = 30, bio = 80, rad = 40)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR
	put_on_delay = 50
	strip_delay = 100
	resistance_flags = FIRE_PROOF | UNACIDABLE
	actions_types = list(/datum/action/item_action/toggle_helmet_light)
	self_weight = 5

/obj/item/clothing/head/helmet/power_armor/t45d
	name = "T-45d power helmet"
	desc = "An old pre-War power armor helmet.<br>It's pretty hot inside of it."
	icon_state = "t45dhelmet"
	item_state = "t45dhelmet"
	flags = HEADCOVERSEYES | HEADCOVERSMOUTH | STOPSPRESSUREDMAGE
	armor = list(melee = 60, bullet = 40, laser = 30, energy = 30, bomb = 40, bio = 100, rad = 60)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT
	put_on_delay = 50
	strip_delay = 100
	resistance_flags = FIRE_PROOF | UNACIDABLE
	actions_types = list(/datum/action/item_action/toggle_helmet_light)
	self_weight = 5

//Knights of the Apocalypse

/obj/item/clothing/head/helmet/knight
	name = "medieval helmet"
	desc = "A classic metal helmet worn by all ranks of knights and horsemen of the Old Era."
	icon_state = "knight_green"
	item_state = "knight_green"
	armor = list(melee = 40, bullet = 20, laser = 0, energy = 0, bomb = 10, bio = 0, rad = 0, fire = 0, acid = 30)
	flags = null
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	strip_delay = 80
	dog_fashion = null
	self_weight = 5

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

/obj/item/clothing/head/helmet/knight/f13/metal
	name = "metal helmet"
	icon_state = "metalhelmet"
	item_state = "metalhelmet"

/obj/item/clothing/head/helmet/knight/f13/rider
	name = "rider helmet" //Not raider. Rider.
	desc = "It's a fancy dark metal helmet with orange spray painted flames."
	icon_state = "rider"
	item_state = "rider"
	self_weight = 1