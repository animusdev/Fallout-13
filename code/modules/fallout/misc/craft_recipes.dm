//Fallout 13 crafting recipes general directory

//Weapons

/datum/crafting_recipe/spear
	name = "Spear"
	result = /obj/item/weapon/twohanded/tribal_spear
	reqs = list(/obj/item/crafting/duct_tape = 1,
				/obj/item/weapon/kitchen/knife = 1,
				/obj/item/weapon/grown/log = 1)
	time = 200
	category = CAT_WEAPON

/datum/crafting_recipe/throwing_spear
	name = "Throwing Spear"
	result = /obj/item/weapon/spear
	reqs = list(/obj/item/stack/sheet/metal = 1)
	time = 100
	tools = list(/obj/item/weapon/weldingtool)
	category = CAT_WEAPON

//Misc

/datum/crafting_recipe/satchel
	name = "Satchel"
	result = /obj/item/weapon/storage/backpack/satchel
	time = 150
	reqs = list(/obj/item/stack/sheet/animalhide = 2,
				/obj/item/crafting/duct_tape = 1,
				/obj/item/crafting/wonderglue = 1)
	category = CAT_MISC

/datum/crafting_recipe/radio
	name = "Radio"
	result = /obj/item/device/radio
	time = 500
	reqs = list(/obj/item/crafting/diode = 2,
				/obj/item/crafting/transistor = 1,
				/obj/item/crafting/capacitor = 2,
				/obj/item/crafting/resistor = 3,
				/obj/item/crafting/bulb = 1,
				/obj/item/crafting/board = 1,
				/obj/item/crafting/frame = 1)
	category = CAT_MISC

//Armor

/datum/crafting_recipe/shoes
	name = "Shoes"
	result = /obj/item/clothing/shoes/f13/tan
	reqs = list(/obj/item/stack/sheet/animalhide = 3,
				/obj/item/crafting/wonderglue = 1)
	tools = list(/obj/item/weapon/wirecutters)
	time = 150
	category = CAT_PRIMAL

/datum/crafting_recipe/tribalclothing
	name = "Tribal clothing"
	result = /obj/item/clothing/under/f13/tribal
	reqs = list(/obj/item/stack/sheet/animalhide/gecko = 2,
				/obj/item/crafting/wonderglue = 1)
	tools = list(/obj/item/weapon/wirecutters)
	time = 100
	category = CAT_PRIMAL

/datum/crafting_recipe/tribalarmor
	name = "Tribal Armor"
	result = /obj/item/clothing/suit/armor/f13/tribal
	reqs = list(/obj/item/stack/sheet/animalhide = 3,
				/obj/item/crafting/duct_tape = 1)
	tools = list(/obj/item/weapon/wirecutters)
	time = 150
	category = CAT_PRIMAL

/datum/crafting_recipe/leatherarmor
	name = "Leather Armor"
	result = /obj/item/clothing/suit/armor/f13/leatherarmor
	reqs = list(/obj/item/stack/sheet/animalhide = 6,
				/obj/item/crafting/duct_tape = 1,
				/obj/item/crafting/wonderglue = 1)
	tools = list(/obj/item/weapon/screwdriver, /obj/item/weapon/wirecutters)
	time = 200
	category = CAT_PRIMAL

/datum/crafting_recipe/chestplate
	name = "Metal Chestplate"
	result = /obj/item/clothing/suit/armor/f13/chestplate
	reqs = list(/obj/item/stack/sheet/animalhide = 1,
				/obj/item/stack/cable_coil = 2,
				/obj/item/stack/sheet/metal = 3,
				/obj/item/crafting/wonderglue = 1)
	tools = list(/obj/item/weapon/screwdriver, /obj/item/weapon/wirecutters)
	time = 100
	category = CAT_PRIMAL

/datum/crafting_recipe/metalarmor
	name = "Metal Armor"
	result = /obj/item/clothing/suit/armor/f13/metalarmor
	reqs = list(/obj/item/clothing/suit/armor/f13/chestplate = 1,
				/obj/item/stack/sheet/animalhide = 3,
				/obj/item/stack/cable_coil = 5,
				/obj/item/stack/sheet/metal = 5,
				/obj/item/crafting/duct_tape = 2,
				/obj/item/crafting/wonderglue = 1)
	tools = list(/obj/item/weapon/screwdriver, /obj/item/weapon/wirecutters)
	time = 200
	category = CAT_PRIMAL

/datum/crafting_recipe/bmetalarmor
	name = "Black Metal Armor"
	result = /obj/item/clothing/suit/armor/f13/bmetalarmor
	reqs = list(/obj/item/clothing/suit/armor/f13/metalarmor = 1,
				/obj/item/stack/sheet/animalhide = 2,
				/obj/item/stack/cable_coil = 5,
				/obj/item/stack/sheet/metal = 5,
				/obj/item/crafting/duct_tape = 1,
				/obj/item/crafting/wonderglue = 2)
	tools = list(/obj/item/weapon/screwdriver, /obj/item/weapon/wirecutters)
	time = 200
	category = CAT_PRIMAL

//Chems

/datum/crafting_recipe/healingpowder
	name = "Healing Powder"
	result = /obj/item/stack/medical/healingpowder
	time = 50
	reqs = list(/obj/item/weapon/reagent_containers/food/snacks/grown/broc = 1,
				/obj/item/weapon/reagent_containers/food/snacks/grown/xander = 1)
	category = CAT_MISC

/datum/crafting_recipe/stimpak
	name = "Stimpak"
	result = /obj/item/weapon/reagent_containers/f13stimpack
	reqs = list(/obj/item/stack/medical/healingpowder = 1,
				/obj/item/weapon/reagent_containers/food/drinks/bottle/nukacola = 1,
				/obj/item/crafting/wonderglue = 1)
	tools = list(/obj/item/weapon/lighter, /obj/item/weapon/reagent_containers/glass/beaker)
	time = 50
	category = CAT_MISC

/datum/crafting_recipe/superstimpak
	name = "Super Stimpak"
	result = /obj/item/weapon/reagent_containers/f13stimpack/super
	reqs = list(/obj/item/stack/medical/healingpowder = 2,
				/obj/item/weapon/reagent_containers/food/drinks/bottle/nukacola = 2,
				/obj/item/crafting/wonderglue = 2)
	tools = list(/obj/item/weapon/lighter, /obj/item/weapon/reagent_containers/glass/beaker)
	time = 100
	category = CAT_MISC

/datum/crafting_recipe/turbo
	name = "Turbo"
	result = /obj/item/weapon/reagent_containers/pill/patch/turbo
	reqs = list(/obj/item/weapon/reagent_containers/pill/patch/jet = 1,
				/obj/item/crafting/duct_tape = 1,
				/obj/item/crafting/turpentine = 1,
				/obj/item/crafting/abraxo = 1)
	tools = list(/obj/item/weapon/lighter, /obj/item/weapon/reagent_containers/glass/beaker)
	time = 100
	category = CAT_MISC


///crc

/datum/crafting_recipe/reloader_set
	name = "Reloader cartridges"
	result = /obj/item/crafting/reloader_set
	time = 100
	reqs = list(/obj/item/crafting/turpentine = 1,
				/datum/reagent/consumable/sodiumchloride = 10,
				/obj/item/weapon/reagent_containers/food/drinks/bottle/nukacola = 1)
	category = CAT_MISC

/datum/crafting_recipe/weapon_repair_kit
	name = "Weapon repair kit"
	result = /obj/item/crafting/weapon_repair_kit
	time = 100
	reqs = list(/obj/item/crafting/small_gear = 2,
				/obj/item/crafting/large_gear = 1 ,
				/obj/item/crafting/duct_tape =2,
				/obj/item/crafting/wonderglue = 1,
				/obj/item/weapon/screwdriver = 1)
	category = CAT_MISC


/datum/crafting_recipe/ghillie
	name = "Ghillie suit"
	result = /obj/item/clothing/suit/armor/f13/ghillie
	time = 200
	reqs = list(/obj/item/stack/sheet/animalhide = 2,
				/obj/item/crafting/duct_tape = 1,
				/obj/item/crafting/wonderglue = 2,
				/obj/item/stack/cable_coil = 2,
				/obj/item/clothing/suit/ = 1)
	tools = list(/obj/item/weapon/wirecutters)
	category = CAT_MISC

/datum/crafting_recipe/ghillie_hat
	name = "Ghillie hood"
	result = /obj/item/clothing/head/armor/f13/ghillie_hat
	time = 100
	reqs = list(/obj/item/stack/sheet/animalhide = 1,
				/obj/item/crafting/duct_tape = 1,
				/obj/item/crafting/wonderglue = 1,
				/obj/item/stack/cable_coil = 1,
				/obj/item/clothing/head/ = 1)
	tools = list(/obj/item/weapon/wirecutters)
	category = CAT_MISC

