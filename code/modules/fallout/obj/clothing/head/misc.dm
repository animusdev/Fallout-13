//Fallout 13 various hats directory

/obj/item/clothing/head/f13
	icon = 'icons/fallout/clothing/hats.dmi'
	self_weight = 0.8

/obj/item/clothing/head/f13/police
	name = "pre-War police hat"
	desc = "A police hat of dark blue in color with a silver colored badge on the frontside.<br>The badge is inscripted with the words SPECIAL and POLICE."
	icon_state = "retropolice"
	item_state = "fedora"

/obj/item/clothing/head/f13/safari //Referencing the Jebediah from Mad Max III
	name = "pith helmet"
	desc = "A lightweight cloth-covered helmet made of pith.<br>Suitable for explorers or batshit crazy pilots."
	icon_state = "safari"
	item_state = "dethat"
	flags_inv = HIDEHAIR
	armor = list(melee = 40, bullet = 10, laser = 0, energy = 0, bomb = 20, bio = 0, rad = 0,fire = 30, acid = 0)

/obj/item/clothing/head/f13/stormchaser
	name = "stormchaser hat"
	desc = "Home, home on the wastes,<br>Where the mole rat and the fire gecko play.<br>Where seldom is heard a discouraging word,<br>And my skin is not glowing all day."
	icon_state = "stormchaser"
	item_state = "fedora"
	flags_inv = HIDEEARS|HIDEHAIR

/obj/item/clothing/head/f13/headscarf
	name = "headscarf"
	desc = "A piece of cloth that be worn on head for a variety of purposes, such as protection of the head or hair from rain, wind, dirt, cold, warmth, for sanitation, for fashion, recognition or social distinction - with religious significance, to hide baldness, out of modesty, or other forms of social convention."
	icon_state = "headscarf"
	item_state = "dethat"
	flags_inv = HIDEMASK|HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR

/obj/item/clothing/head/f13/pot
	name = "metal cooking pot"
	desc = "Step one: Start with the sauce.<br>Step two: Add the noodles.<br>Step three: Stir the pasta.<br>Step four: Turn up the heat.<br>Step five: Burn the house."
	icon_state = "pot"
	item_state = "fedora"
	force = 10
	hitsound = 'sound/items/trayhit1.ogg'
	flags_inv = HIDEHAIR

/obj/item/clothing/head/f13/cowboy
	name = "cowboy hat"
	desc = "A high-crowned, wide-brimmed hat best known as the defining piece of attire for the North American cowboy."
	icon_state = "cowboy"
	item_state = "dethat"
	flags_inv = HIDEHAIR

/obj/item/clothing/head/f13/bandit
	name = "bandit hat"
	desc = "A black cowboy hat with a large brim, curved to the sides, and a silver eagle pinned to the front."
	icon_state = "bandit"
	item_state = "fedora"
	flags_inv = HIDEHAIR

/obj/item/clothing/head/f13/ncr
	name = "officer beret"
	desc = "A soft round cap, usually of wool felt, with a flat crown that tilts to one side, used to identify officers of the New California Republic Army.<br>The beret seems to be camouflaged in various shades of green and brown, and has a cap badge of the NCR two-headed bear roaring up at a gold star."
	icon_state = "officer"
	item_state = "dethat"
	flags_inv = HIDEHAIR

/obj/item/clothing/head/f13/sergeant
	name = "ranger hat"
	desc = "A brown broad-brimmed felt hat, with a high crown, pinched symmetrically at the four corners.<br>It has the insignia plate of the New California Republic Rangers."
	icon_state = "sergeant"
	item_state = "dethat"
	flags_inv = HIDEHAIR

/obj/item/clothing/head/f13/gambler
	name = "gambler hat"
	desc = "A perfect hat for a ramblin' gamblin' man." //But I got to ramble (ramblin' man) //Oh I got to gamble (gamblin' man) //Got to got to ramble (ramblin' man) //I was born a ramblin' gamblin' man
	icon_state = "gambler"
	item_state = "dethat"

//Fluff

/obj/item/clothing/head/f13/rastacap
	name = "rastacap"
	desc = "<font color='#157206'>Him haffi drop him fork and run,</font><br><font color='green'>Him can't stand up to Jah Jah son,</font><br><font color='#fd680e'>Him haffi lef' ya with him gun,</font><br><font color='red'>Dig off with him bomb.</font>"
	icon_state = "rastacap"
	item_state = "fedora"
	flags_inv = HIDEEARS|HIDEHAIR|HIDEFACIALHAIR
	cold_protection = HEAD //This tam brings the warm reggae and Jamaican sun with it.
	min_cold_protection_temperature = FIRE_HELM_MIN_TEMP_PROTECT

/obj/item/clothing/head/f13/fez
	name = "fez"
	desc = "Fezzes are cool!"
	icon_state = "fez"
	item_state = "secsoft"

/obj/item/clothing/head/f13/beaver
	name = "beaverkin"
	desc = "A hat made from felted beaver fur which makes this hat both comfortable and elegant."
	icon_state = "beaver"
	item_state = "that"

/obj/item/clothing/head/f13/purple
	name = "purple top hat"
	desc = "You may not own the best jail in the observed Universe, or the best chocolate factory in the entire world, but at least you can try to have that purple top hat."
	icon_state = "ptophat"
	item_state = "that"

/obj/item/clothing/head/f13/det_hat_alt
	name = "detective's fedora"
	desc = "There's only one man who can sniff out the dirty stench of crime, and he's likely wearing this black hat."
	icon_state = "detectivealt"
	self_weight = 1
	item_state = "fedora"
	armor = list(melee = 30, bullet = 10, laser = 10, energy = 10, bomb = 10, bio = 0, rad = 0,fire = 0, acid = 0)

/obj/item/clothing/head/f13/trilby
	name = "feather trilby"
	desc = "A sharp, stylish blue hat with a feather."
	icon_state = "trilby"
	item_state = "fedora"

/obj/item/clothing/head/f13/battlecruiser
	name = "captain's hat"
	desc = "The Yamato is loaded. And so am I."
	icon_state = "battlecruiser"
	item_state = "battlecruiser"
	self_weight = 3
	armor = list(melee = 30, bullet = 20, laser = 20, energy = 10, bomb = 20, bio = 0, rad = 0,fire = 0, acid = 0)

//Fluff welding masks

/obj/item/clothing/head/welding/f13
	icon = 'icons/fallout/clothing/hats.dmi'
	self_weight = 2

/obj/item/clothing/head/welding/f13/fire
	name = "cremator welding helmet"
	desc = "A welding helmet with burning flame painted over it.<br>It sure is creepy but nevertheless badass."
	icon_state = "welding_fire"
	item_state = "welding"
	tint = 1
	armor = list(melee = 20, bullet = 10, laser = 5, energy = 5, bomb = 5, bio = 0, rad = 0, acid = 0)

/obj/item/clothing/head/welding/f13/japan
	name = "nippon welding helmet"
	desc = "Kojin no ato wo motomezu, kojin no motometaru no tokoro wo motome yo."
	icon_state = "welding_japan"
	item_state = "welding"
	tint = 1
	armor = list(melee = 40, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0, acid = 0)