//Fallout 13 shoes directory

/obj/item/clothing/shoes/f13
	icon = 'icons/fallout/clothing/shoes.dmi'
	self_weight = 0.1

/obj/item/clothing/shoes/f13/rag
	name = "footcloths"
	desc = "A footcloths made of ripped cloth.<br>It has soaked in smelly sweat, and it is rather repulsive.<br>Only the poorest of settlers, mostly the drug addicts or slaves wear something like that."
	icon_state = "rag"
	item_state = "rag"

/obj/item/clothing/shoes/f13/tan
	name = "tan shoes"
	desc = "A pair of tanned leather shoes."
	icon_state = "tan"
	item_state = "tan"

/obj/item/clothing/shoes/f13/brownie
	name = "brown shoes"
	desc = "A pair of brown leather shoes."
	icon_state = "brownie"
	item_state = "brownie"

/obj/item/clothing/shoes/f13/cowboy
	name = "cowboy boots"
	desc = "A pair of cowhide boots with spurs.<br>They have a Cuban heel, rounded to pointed toe, high shaft, and, traditionally, no lacing."
	icon_state = "cowboy"
	item_state = "cowboy"

/obj/item/clothing/shoes/f13/combat
	name = "military boots"
	desc = "High speed, no drag combat boots designed for use by US army before the Great War."
	icon_state = "legionleather"
	item_state = "legionleather"
	permeability_coefficient = 0.01
	flags = NOSLIP
	self_weight = 0.8
	armor = list(melee = 10, bullet = 10, laser = 0, energy = 0, bomb = 10, bio = 0, rad = 0, fire = 10, acid = 0)
	strip_delay = 50
	resistance_flags = 0
	self_weight = 0.5
	pockets = /obj/item/weapon/storage/internal/pocket/shoes

/obj/item/clothing/shoes/f13/combat/diesel
	name = "diesel boots"
	desc = "Fancy female knee high platform boots with shiny steel clasps."
	icon_state = "diesel"
	item_state = "diesel"
	armor = list(melee = 20, bullet = 10, laser = 10, energy = 10, bomb = 10, bio = 0, rad = 0, fire = 0, acid = 0)
	cold_protection = FEET
	self_weight = 0.6
	min_cold_protection_temperature = SHOES_MIN_TEMP_PROTECT

/obj/item/clothing/shoes/f13/combat/legionleather
	name = "leather boots"
	desc = "A pair of leather boots commonly worn by the Caesar's Legion recruits."
	icon_state = "legionleather"
	item_state = "legionleather"
	armor = list(melee = 10, bullet = 10, laser = 0, energy = 0, bomb = 10, bio = 0, rad = 0, fire = 10, acid = 0)

/obj/item/clothing/shoes/f13/combat/legionmetal
	name = "metal boots"
	desc = "A pair of metal boots commonly worn by the Caesar's Legion veterans."
	icon_state = "legionmetal"
	item_state = "legionmetal"
	self_weight = 1
	armor = list(melee = 20, bullet = 20, laser = 10, energy = 10, bomb = 20, bio = 0, rad = 0, fire = 20, acid = 0)

/obj/item/clothing/shoes/f13/combat/legionlegate
	name = "legate boots"
	desc = "A pair of heavy boots worn by the Caesar's Legion Legate."
	icon_state = "legionlegate"
	item_state = "legionlegate"
	self_weight = 0.8
	armor = list(melee = 30, bullet = 30, laser = 20, energy = 20, bomb = 30, bio = 0, rad = 10, fire = 30, acid = 10)

//Fluff

/obj/item/clothing/shoes/f13/swimfins
	name = "swimming fins"
	desc = "You see Ivan, if you wear these in the desert - they help you swim good if you find much water."
	icon_state = "flippers"
	item_state = "flippers"
	flags = NOSLIP

/obj/item/clothing/shoes/f13/moon
	name = "moon boots"
	desc = "These boots are constructed with a thin rubber outsole and cellular rubber midsole covered by colorful Nylon fabrics and using polyurethane foams.<br>To the Moon!"
	icon_state = "moon"
	item_state = "moon"
	armor = list(melee = 40, bullet = 20, laser = 20, energy = 20, bomb = 20, bio = 10, rad = 50, fire = 0, acid = 0)
	cold_protection = FEET
	min_cold_protection_temperature = SHOES_MIN_TEMP_PROTECT
	heat_protection = FEET
	max_heat_protection_temperature = SHOES_MAX_TEMP_PROTECT
	flags = NOSLIP
	self_weight = 2

/obj/item/clothing/shoes/combat/light
	name = "light combat boots"
	self_weight = 0.1
	flags = NOSLIP | QUIETSTEPSOUND

/obj/item/clothing/shoes/f13/doom
	name = "mars boots"
	desc = "These boots are constructed with a titanium alloy and some runes engraved on the side.<br>To the Mars!"
	icon_state = "mars"
	item_state = "mars"
	armor = list(melee = 40, bullet = 20, laser = 20, energy = 20, bomb = 20, bio = 80, rad = 80, fire = 80, acid = 50)
	cold_protection = FEET
	min_cold_protection_temperature = SHOES_MIN_TEMP_PROTECT
	heat_protection = FEET
	max_heat_protection_temperature = SHOES_MAX_TEMP_PROTECT
	flags = NOSLIP
	self_weight = 2

/obj/item/clothing/shoes/f13/miner
	name = "mining boots"
	desc = "A heavy-duty work boots with steel reinforced toes and some fluffy wool for extra warmth."
	icon_state = "miner"
	item_state = "miner"
	armor = list(melee = 20, bullet = 0, laser = 0, energy = 0, bomb = 20, bio = 0, rad = 0, fire = 0, acid = 0)
	cold_protection = FEET
	min_cold_protection_temperature = SHOES_MIN_TEMP_PROTECT
	self_weight = 1