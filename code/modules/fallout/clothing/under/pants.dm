//Fallout 13 pants directory

/obj/item/clothing/under/pants/f13
	icon = 'icons/fallout/clothing/uniforms.dmi'
	self_weight = 0.3

/obj/item/clothing/under/pants/f13/cloth
	name = "cloth pants"
	desc = "A pair of worn dusty cloth pants made of various textile pieces.<br>Commonly found all over the wasteland."
	icon_state = "cloth"
	item_color = "cloth"

/obj/item/clothing/under/pants/f13/caravan //Caravanner - someone who travels with caravan. Caravaneer - caravan leader.
	name = "caravanner pants"
	desc = "A pair of wide dusty cargo pants.<br>Commonly worn by caravanners or caravan robbers."
	icon_state = "caravan"
	item_color = "caravan"

/obj/item/clothing/under/pants/f13/khan
	name = "Great Khan pants"
	desc = "A cloth pants with leather armor pads attached on sides.<br>These are commonly worn by Great Khans raiders."
	icon_state = "khan"
	item_color = "khan"
	flags = THICKMATERIAL
	body_parts_covered = LEGS
	armor = list(melee = 10, bullet = 10, laser = 0, energy = 0, bomb = 10, bio = 0, rad = 0, fire = 0)

/obj/item/clothing/under/pants/f13/doom
	name = "green pants"
	desc = "An odd green pants made of synthetic material."
	icon_state = "green"
	item_color = "green"
	flags = THICKMATERIAL
	resistance_flags = UNACIDABLE
	body_parts_covered = LEGS
	self_weight = 3
	armor = list(melee = 60, bullet = 40, laser = 40, energy = 40, bomb = 50, bio = 100, rad = 100, fire = 100)