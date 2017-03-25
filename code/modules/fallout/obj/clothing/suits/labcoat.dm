//Fallout 13 toggle apparel directory

/obj/item/clothing/suit/toggle/labcoat/f13
	icon = 'icons/fallout/clothing/suits.dmi'
	self_weight = 2

/obj/item/clothing/suit/toggle/labcoat/f13/emergency
	name = "first responder jacket"
	desc = "A high-visibility jacket worn by medical first responders."
	icon_state = "fr_jacket"
	item_state = "fr_jacket"

/obj/item/clothing/suit/toggle/labcoat/f13/warriors
	name = "warriors jacket"
	desc = "A red leather jacket, with a word 'Warriors' sewn above the white wings on the back."
	icon_state = "warriors"
	item_state = "owl"
	body_parts_covered = CHEST
	armor = list(melee = 10, bullet = 10, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0, fire = 0, acid = 0)

/obj/item/clothing/suit/toggle/labcoat/f13/wanderer
	name = "wanderer jacket"
	desc = "A zipped-up hoodie made of tanned leather"
	icon_state = "wanderer"
	item_state = "owl"
	body_parts_covered = CHEST
	armor = list(melee = 10, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0, fire = 0, acid = 0)

/obj/item/clothing/suit/toggle/labcoat/f13/khan
	name = "Great Khan jacket"
	desc = "A black leather jacket, with a specific drawing on the back - an aggressive red eyed skull wearing a fur hat with horns.<br>Oh, and this skull has a mongoloid moustache - it's obviously a Great Khans emblem."
	icon_state = "khan"
	item_state = "jensencoat"
	body_parts_covered = CHEST
	armor = list(melee = 10, bullet = 10, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0, fire = 0, acid = 0)