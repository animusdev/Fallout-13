//Fallout 13 contributor packs directory

/datum/content_pack
	var
		name = "What?"
		id = "shit"
		desc = "Something is wrong! Maybe you already have this content pack?"
		list/items = list()
		list/sorted_items = list()
		list/roles = list()
		list/pets = list()
		price = 99999
	proc
		on_set(client/client)
			return 1
		generate_sorted_list() //
			sorted_items["weapon"] = list()
			sorted_items["misc"] = list()
			sorted_items["head"] = list()
			sorted_items["armor"] = list()
			sorted_items["gloves"] = list()
			sorted_items["shoes"] = list()
			sorted_items["uniform"] = list()
		sort_items()
			for(var/item in items)
				if(get_var_from_type(item, "w_class") < WEIGHT_CLASS_NORMAL)
					sorted_items["misc"] |= item
				sorted_items[slot_name_by_type(item)] |= item
	New()
		. = ..()
		if(!items.len)
			return .
		generate_sorted_list()
		sort_items()


/datum/content_pack/starter
	name = "Starter"
	id = "starter"
	desc = "<b>Available to: All factions!</b><br>Everyone has these vital items, for free!<br><i>Note: All roles have listed weapons and items that go to pocket slots. Although, some roles have certain clothing items disabled by default to preserve the general role stylistics. Settler role has it all.</i>"
	items = list(
		/obj/item/clothing/shoes/f13/rag,
		// Hats
		/obj/item/clothing/head/f13/headscarf,
		/obj/item/clothing/head/f13/pot,
		// Uniforms
		/obj/item/clothing/under/pants/f13/ghoul,
		/obj/item/clothing/under/pants/f13/cloth,
		/obj/item/clothing/under/pants/f13/caravan,
		/obj/item/clothing/under/f13/rag,
		/obj/item/clothing/under/f13/tribal,
		/obj/item/clothing/under/f13/female/tribal,
		/obj/item/clothing/under/f13/settler,
		/obj/item/clothing/under/f13/brahmin,
		/obj/item/clothing/under/f13/female/brahmin,
		/obj/item/clothing/under/f13/worn,
		// Suits
		/obj/item/clothing/suit/f13/mantle_liz,
		// Items
		/obj/item/weapon/reagent_containers/food/drinks/flask/survival,
		/obj/item/weapon/dice/d6,
		/obj/item/weapon/deck,
		/obj/item/weapon/storage/fancy/cigarettes,
		/obj/item/weapon/storage/fancy/cigarettes/tortoise,
		/obj/item/weapon/storage/box/matches,
		/obj/item/device/flashlight/torch,
		// Weapons
		/obj/item/weapon/pipe,
		/obj/item/weapon/tireiron,
		/obj/item/weapon/pan,
		/obj/item/weapon/kitchen/rollingpin,
		/obj/item/weapon/kitchen/knife,
		/obj/item/weapon/kitchen/knife/butcher,
		/obj/item/weapon/scalpel,
		/obj/item/weapon/shovel,
		/obj/item/weapon/hammer,
		/obj/item/weapon/crowbar,
		/obj/item/weapon/screwdriver,
		/obj/item/weapon/wirecutters,
		/obj/item/weapon/wrench,
		/obj/item/weapon/weldingtool/experimental,
		/obj/item/weapon/restraints/legcuffs/bola
		)
	price = -1

/datum/content_pack/cigarettes
	name = "Cigarettes for Lead Developer"
	id = "cigarettes"
	desc = "<b>Available to: All factions!</b><br>The most simple way to encourage the Lead Developer - Jackerzz aka Maxyo, is to get him a pack of cigarettes.<br>...<br><i>Note: World Health Organization discourages you from smoking. Inhaling any kind of smoke is bad for your health!</i>"
	items = list(
		/obj/item/weapon/storage/fancy/rollingpapers,
		/obj/item/weapon/storage/fancy/cigarettes/cigpack_myron,
		/obj/item/weapon/storage/fancy/cigarettes/cigpack_joy,
		/obj/item/clothing/mask/cigarette,
		/obj/item/clothing/mask/cigarette/rollie,
		/obj/item/clothing/mask/cigarette/cigar,
		/obj/item/clothing/mask/cigarette/cigar/cohiba,
		/obj/item/clothing/mask/cigarette/cigar/havana
		)
	price = 60

/datum/content_pack/team_fortress
	name = "Hat simulator"
	id = "team_fortress"
	desc = "<b>Available to: Neutral, City and Raider factions only!</b><br>Experience power of Fallout 13 with our accurately developed hat simulation system.<br>This set includes five additional hats!"
	items = list(
		/obj/item/clothing/head/soft/f13/baseball,
		/obj/item/clothing/head/f13/cowboy,
		/obj/item/clothing/head/f13/bandit,
		/obj/item/clothing/head/f13/stormchaser,
		/obj/item/clothing/head/f13/gambler
		)
	price = 60

/datum/content_pack/wardrobe
	name = "High fashion"
	id = "wardrobe"
	desc = "<b>Available to: Neutral and City factions only!</b><br>Got tired of your character looking like a homeless junkie?<br>This pack was created specially for you - wasteland fashion collection of year 2255 !<br>This set inludes a pair of worn but sturdy work boots, and seven additional outfits that provide considerable diversity in character creation.<br><i>Note: Bonus item - a dark red wasteland wanderer jacket that can be zipped up as well.</i>"
	items = list(
		/obj/item/clothing/shoes/f13/explorer,
		// Uniforms
		/obj/item/clothing/under/f13/relaxedwear,
		/obj/item/clothing/under/f13/spring,
		/obj/item/clothing/under/f13/merchant,
		/obj/item/clothing/under/f13/trader,
		/obj/item/clothing/under/f13/caravaneer,
		/obj/item/clothing/under/f13/lumberjack,
		/obj/item/clothing/under/f13/machinist,
		// Suits
		/obj/item/clothing/suit/toggle/labcoat/f13/wanderer
		)
	price = 180

/datum/content_pack/bard
	name = "Musical instruments"
	id = "bard"
	desc = "<b>Available to: All factions!</b><br>Russian General says, :<br><i>\"I do not like rock-and-roll music. This is too loud! I like folk music, soft, nice music, huh? Polka, waltz, anything!\"</i><br><b>Six String Samurai (1998)</b>"
	items = list(
		/obj/item/device/harmonica,
		/obj/item/device/instrument/guitar
		)
	price = 180

/datum/content_pack/trooper_armor
	name = "Batallion themed NCR armor"
	id = "trooper_armor"
	desc = "<b>Available to: NCR Trooper and NCR Sergeant roles only!</b><br>Form a strike squad with your friends, wearing the matching NCR armor sets!<br>This set includes six additional trooper armor skins:<br>White star insignia<br>Red star insignia<br>Holy cross insignia<br>Hear symbol insignia<br>Radiation symbol insignia<br>White skull insignia"
	items = list(
		/obj/item/clothing/suit/armor/f13/ncr/patriot,
		/obj/item/clothing/suit/armor/f13/ncr/commie,
		/obj/item/clothing/suit/armor/f13/ncr/preacher,
		/obj/item/clothing/suit/armor/f13/ncr/lover,
		/obj/item/clothing/suit/armor/f13/ncr/stalker,
		/obj/item/clothing/suit/armor/f13/ncr/punisher
		)
	price = 60

/datum/content_pack/heavy_trooper
	name = "NCR Heavy Infantry Corps"
	id = "heavy_trooper"
	desc = "<b>Available to: NCR Trooper and NCR Sergeant roles only!</b><br>Become the NCR Heavy Trooper with a set of NCR salvaged power armor and a big gun!"
	items = list(
		/obj/item/clothing/head/helmet/power_armor/ncr,
		/obj/item/clothing/suit/armor/f13/power_armor/ncr,
		/obj/item/weapon/twohanded/largehammer,
		/obj/item/weapon/gun/ballistic/automatic/rifle,
		/obj/item/ammo_box/magazine/m308,
		)
	price = 180

/datum/content_pack/khan
	name = "Great Khan"
	id = "khan"
	desc = "<b>Available to: Neutral and Raider factions only!</b><br>The glory of the Great Khans will be restored with this themed outfit set!<br>Or you can use this tribal spear to effectively defend yourself against a wildlife, at the start of the game.<br><i>Note: Great Khan jacket can be zipped up as well.</i>"
	items = list(
		/obj/item/clothing/head/helmet/f13/khan,
		/obj/item/clothing/suit/toggle/labcoat/f13/khan,
		/obj/item/clothing/under/pants/f13/khan,
		/obj/item/clothing/shoes/f13/khan,
		/obj/item/weapon/twohanded/tribal_spear,
		/obj/item/weapon/restraints/legcuffs/bola/tribal
		)
	price = 180

/datum/content_pack/super_ten
	name = "Super 10"
	id = "super_ten"
	desc = "<b>Available to: All factions!</b><br>Pay-to-win pack of 10mm guns and a powerful 10 iron club."
	items = list(
		/obj/item/weapon/golf10,
		/obj/item/weapon/gun/ballistic/automatic/pistol/n99,
		/obj/item/ammo_box/magazine/m10mm_adv,
		/obj/item/weapon/gun/ballistic/automatic/smg10mm,
		/obj/item/ammo_box/magazine/m10mm_auto
		)
	price = 240

/datum/content_pack/punk
	name = "Punk"
	id = "punk"
	desc = "<b>Available to: Neutral and Raider factions only!</b><br>If the game doesn't feel metal enough for you, this set of items may fix it.<br><i>Note: Punk lives!</i><br>"
	items = list(
		/obj/item/clothing/shoes/f13/military/diesel,
		/obj/item/clothing/shoes/f13/military/female/diesel,
		/obj/item/clothing/suit/armor/f13/punk,
		/obj/item/device/instrument/eguitar,
		/obj/item/key/motorcycle
		)
	price = 300

/datum/content_pack/off
	name = "OFF"
	id = "off"
	desc = "<b>Available to: Neutral and Raider factions only!</b><br>Carefully selected items from OFF game.<br><i>Note: Purification in progress...</i><br>"
	items = list(
		/obj/item/clothing/head/soft/black,
		/obj/item/clothing/under/f13/batter,
		/obj/item/weapon/twohanded/baseball,
		/obj/item/clothing/gloves/f13/baseball,
		/obj/item/clothing/shoes/f13/fancy
		)
	price = 300

/datum/content_pack/madmax
	name = "Mad Max"
	id = "madmax"
	desc = "<b>Available to: Neutral and Raider factions only!</b><br>Carefully selected items from an entire Mad Max movie franchise.<br><i>Note: Steering wheel is used just like a car key.<br>The content pack may be expanded in future with new items you will get for free if you already had this pack.</i>"
	items = list(
		/obj/item/clothing/suit/f13/mfp,
		/obj/item/clothing/suit/f13/mfp/raider,
		/obj/item/weapon/reagent_containers/food/snacks/f13/dog,
		/obj/item/weapon/gun/ballistic/shotgun/trail,
		/obj/item/clothing/head/f13/safari,
		/obj/item/clothing/under/pants/f13/warboy,
		/obj/item/key/buggy/wheel
		)
	price = 600

/datum/content_pack/doom
	name = "Doom"
	id = "doom"
	desc = "<b>Available to: Neutral and Raider factions only!</b><br>Carefully selected items from Doom game.<br><i>Note: Union Aerospace Corporation welcomes you aboard a shuttle leaving Earth on the way to Mars. Please fasten your seatbelts and have a safe flight!</i>"
	items = list(
		/obj/item/clothing/head/helmet/f13/doom,
		/obj/item/clothing/suit/armor/f13/doom,
		/obj/item/clothing/under/pants/f13/doom,
		/obj/item/clothing/gloves/f13/doom,
		/obj/item/clothing/shoes/f13/doom,
		/obj/item/weapon/twohanded/required/chainsaw
		)
	price = 1000