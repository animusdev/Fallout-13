//Fallout 13 fridge directory

/obj/structure/closet/fridge
	name = "fridge"
	desc = "An old, pre-War refrigerator.<br>While being covered in rust and making blood-chilling noises, it still keeps your Nuka-Cola cold."
	icon_state = "fridge"

/obj/structure/closet/fridge/standard/New()
	..()
	for(var/i = 0, i < 4, i++)
		new /obj/item/weapon/reagent_containers/food/snacks/grown/mutfruit(src)
	for(var/i = 0, i < 3, i++)
		new /obj/item/weapon/reagent_containers/food/snacks/f13/cram(src)
	for(var/i = 0, i < 2, i++)
		new /obj/item/weapon/reagent_containers/food/drinks/bottle/nukacola(src)
	for(var/i = 0, i < 1, i++)
		new /obj/item/weapon/reagent_containers/food/snacks/meat/steak/molerat(src)

/obj/structure/closet/fridge/meat/New()
	..()
	for(var/i = 0, i < 4, i++)
		new /obj/item/weapon/reagent_containers/food/snacks/meat/slab/gecko(src)

/obj/structure/closet/fridge/cannibal/New()
	..()
	for(var/i = 0, i < 4, i++)
		new /obj/item/weapon/reagent_containers/food/snacks/meat/slab/human(src)

/obj/structure/closet/crate/freezer
	desc = "An old, rusted freezer, still good at keeping things cold though."
	name = "freezer"
	icon_state = "freezer"

