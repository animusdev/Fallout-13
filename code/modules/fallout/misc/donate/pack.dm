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
	desc = "<b>Available to: All roles!</b><br>Everyone has that, for free!<br><i>Note: All roles have the items that go to pocket slots. Although, some roles have certain clothing items disabled by default to preserve the general role stylistics. Settler role has it all.</i>"
	items = list(
		/obj/item/clothing/shoes/f13/rag,
		// Hats
		/obj/item/clothing/head/f13/pot,
		// Uniforms
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
		/obj/item/weapon/storage/fancy/cigarettes,
		/obj/item/weapon/storage/fancy/cigarettes/tortoise,
		/obj/item/weapon/storage/box/matches,
		/obj/item/device/flashlight/torch,
		// Weapons
		/obj/item/weapon/pipe,
		/obj/item/weapon/tireiron,
		/obj/item/weapon/kitchen/rollingpin,
		/obj/item/weapon/kitchen/knife,
		/obj/item/weapon/kitchen/knife/butcher
		)
	price = -1

/datum/content_pack/cigarettes
	name = "Cigarettes for Lead Developer"
	id = "cigarettes"
	desc = "<b>Available to: All roles!</b><br>The most simple way to encourage the Lead Developer - Jackerzz aka Maxyo, is to get him a pack of cigarettes."
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

/datum/content_pack/trooper_armor
	name = "Batallion themed NCR armor (+6 skins)"
	id = "trooper_armor"
	desc = "<b>Available to: NCR Trooper role only!</b><br>Form a strike squad with your friends, wearing the matching NCR armor sets!<br>A set includes:<br>White star insignia<br>Red star insignia<br>Holy cross insignia<br>Hear symbol insignia<br>Radiation symbol insignia<br>White skull insignia"
	items = list(
		/obj/item/clothing/suit/armor/f13/ncr/patriot,
		/obj/item/clothing/suit/armor/f13/ncr/commie,
		/obj/item/clothing/suit/armor/f13/ncr/preacher,
		/obj/item/clothing/suit/armor/f13/ncr/lover,
		/obj/item/clothing/suit/armor/f13/ncr/stalker,
		/obj/item/clothing/suit/armor/f13/ncr/punisher
		)
	price = 60

/datum/content_pack/team_fortress
	name = "Hat simulator (+5 hats)"
	id = "team_fortress"
	desc = "<b>Available to: Neutral, City and Raider roles only!</b><br>Experience power of Fallout 13 with our perfectly developed hat simulation system."
	items = list(
		/obj/item/clothing/head/soft/f13/baseball,
		/obj/item/clothing/head/f13/cowboy,
		/obj/item/clothing/head/f13/bandit,
		/obj/item/clothing/head/f13/stormchaser,
		/obj/item/clothing/head/f13/gambler
		)
	price = 60

/datum/content_pack/bard
	name = "Wandering musician"
	id = "bard"
	desc = "<b>Available to: All roles!</b><br>Russian General says, :<br>\"I do not like rock-and-roll music. This is too loud! I like folk music, soft, nice music, huh? Polka, waltz, anything!\""
	items = list(
		/obj/item/device/harmonica,
		/obj/item/device/instrument/guitar
		)
	price = 180

/datum/content_pack/khan
	name = "Great Khan expansion"
	id = "khan"
	desc = "<b>Available to: Neutral and Raider roles only!</b><br>The glory of the Great Khans will be restored!"
	items = list(
		/obj/item/clothing/under/pants/f13/khan,
		/obj/item/clothing/suit/toggle/labcoat/f13/khan,
		/obj/item/clothing/head/helmet/f13/supaflyhelmet
		)
	price = 180

/datum/content_pack/super_ten
	name = "Super 10"
	id = "super_ten"
	desc = "<b>Available to: All roles!</b><br>Pay-to-win pack of 10mm guns and a powerful 10 iron club."
	items = list(
		/obj/item/weapon/golf10,
		/obj/item/weapon/gun/ballistic/automatic/pistol/n99,
		/obj/item/ammo_box/magazine/m10mm_adv,
		/obj/item/weapon/gun/ballistic/automatic/smg10mm,
		/obj/item/ammo_box/magazine/m10mm_auto
		)
	price = 240

/datum/content_pack/off
	name = "OFF"
	id = "off"
	desc = "<b>Available to: Neutral and Raider roles only!</b><br>Carefully selected items from OFF game."
	items = list(
		/obj/item/clothing/head/soft/black,
		/obj/item/clothing/under/f13/batter,
		/obj/item/weapon/twohanded/baseball,
		/obj/item/clothing/gloves/f13/baseball,
		/obj/item/clothing/shoes/laceup
		)
	price = 300

/datum/content_pack/madmax
	name = "Mad Max"
	id = "madmax"
	desc = "<b>Available to: Neutral and Raider roles only!</b><br>Carefully selected items from Mad Max movie franchise."
	items = list(
		/obj/item/clothing/suit/f13/mfp,
		/obj/item/clothing/head/f13/safari,
		/obj/item/weapon/reagent_containers/food/snacks/f13/dog,
		/obj/item/weapon/gun/ballistic/shotgun/trail
		)
	price = 600