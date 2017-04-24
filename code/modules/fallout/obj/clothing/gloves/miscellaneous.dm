//Fallout 13 gloves directory

/obj/item/clothing/gloves/f13
	icon = 'icons/fallout/clothing/gloves.dmi'
	self_weight = 0.1
	armor = list(melee = 10, bullet = 10, laser = 10, energy = 10, bomb = 10, bio = 10, rad = 10, fire = 10, acid = 10)

/obj/item/clothing/gloves/f13/baseball
	name = "baseball glove"
	desc = "A baseball glove or mitt is a large leather glove worn by baseball players of the defending team which assist players in catching and fielding balls hit by a batter or thrown by a teammate."
	icon_state = "baseball"
	item_state = "b_shoes"
	item_color = null
	transfer_prints = TRUE
	strip_delay = 20
	put_on_delay = 40
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT

/obj/item/clothing/gloves/f13/leather //Make a craft recipe, and delete this comment.
	name = "leather gloves"
	desc = "A large leather gloves made of wasteland animals hides, that were tanned and carefully stiched together."
	icon_state = "leather"
	item_state = "leather"
	item_color = null
	transfer_prints = TRUE
	strip_delay = 20
	put_on_delay = 40
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT

/obj/item/clothing/gloves/f13/military
	name = "military gloves"
	desc = "A black leather gloves, destined to strangle foes, break necks, and pull the trigger."
	icon_state = "military"
	item_state = "military"
	item_color = null
	transfer_prints = TRUE
	strip_delay = 20
	put_on_delay = 40
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT

/obj/item/clothing/gloves/f13/ncr
	name = "soldier gloves"
	desc = "A large leather gloves commonly worn by NCR servicemen."
	icon_state = "ncr"
	item_state = "ncr"
	item_color = null
	transfer_prints = TRUE
	strip_delay = 20
	put_on_delay = 40
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT

/obj/item/clothing/gloves/f13/legionlegate
	name = "legate gloves"
	desc = "A large metal gloves commonly worn by Caesar's Legion ranked officer - the Legate."
	icon_state = "legionlegate"
	item_state = "legionlegate"
	item_color = null
	transfer_prints = TRUE
	strip_delay = 20
	put_on_delay = 40
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT

/obj/item/clothing/gloves/f13/doom
	name = "strange gloves"
	desc = "These gloves look like a part of some sort of space suit, or maybe an exquisite armor, but you can't tell for sure."
	icon_state = "doom"
	item_state = "doom"
	item_color = null
	transfer_prints = TRUE
	strip_delay = 20
	put_on_delay = 40
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT
	armor = list(melee = 10, bullet = 10, laser = 10, energy = 10, bomb = 10, bio = 80, rad = 80, fire = 80, acid = 50)