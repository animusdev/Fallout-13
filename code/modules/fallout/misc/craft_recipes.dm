//Weapons
/datum/crafting_recipe/spear
	name = "Spear"
	result = /obj/item/weapon/twohanded/tribal_spear
	reqs = list(/obj/item/crafting/duct_tape = 1,
				/obj/item/weapon/kitchen/knife/combat = 1,
				/obj/item/weapon/grown/log = 1)
	time = 40
	category = CAT_WEAPON

//Med
/datum/crafting_recipe/healpowder
	name = "Heal Powder"
	result = /obj/item/weapon/reagent_containers/pill/patch/healpowder
	time = 20
	reqs = list(/obj/item/weapon/reagent_containers/food/snacks/grown/broc = 1, /obj/item/weapon/reagent_containers/food/snacks/grown/xander = 1)
	category = CAT_MISC

