//Fallout 13 general food directory

//WASTELAND MEATS

/obj/item/weapon/reagent_containers/food/snacks/meat/slab/gecko
	name = "gecko fillet"
	desc = "A fillet of gecko meat."
	icon_state = "fishfillet"
	list_reagents = list("nutriment" = 6, "carpotoxin" = 1, "vitamin" = 2)
	bitesize = 2 //Smaller animal
	filling_color = "#FA8072"
	cooked_type = /obj/item/weapon/reagent_containers/food/snacks/meat/steak/gecko
	slice_path = null

/obj/item/weapon/reagent_containers/food/snacks/meat/slab/molerat
	name = "molerat meat"
	desc = "A slab of molerat meat."
	list_reagents = list("nutriment" = 3, "carpotoxin" = 3)
	bitesize = 4
	filling_color = "#FA8072"
	cooked_type = /obj/item/weapon/reagent_containers/food/snacks/meat/steak/molerat
	slice_path = null

/obj/item/weapon/reagent_containers/food/snacks/meat/slab/deathclaw
	name = "deathclaw meat"
	desc = "A slab of deathclaw meat."
	list_reagents = list("nutriment" = 9, "vitamin" = 9)
	bitesize = 6 //Big slabs of meat from a massive creature
	filling_color = "#FA8072"
	cooked_type = /obj/item/weapon/reagent_containers/food/snacks/meat/steak/deathclaw
	slice_path = null

//WASTELAND STEAKS

/obj/item/weapon/reagent_containers/food/snacks/meat/steak/gecko
	name = "gecko steak"
	desc = "Tastes like chicken."

/obj/item/weapon/reagent_containers/food/snacks/meat/steak/molerat
	name = "molerat steak"
	desc = "A smelly molerat steak.<br>What did you expect from roasted mutant rodent meat?"

/obj/item/weapon/reagent_containers/food/snacks/meat/steak/deathclaw
	name = "deathclaw steak"
	desc = "A piece of hot spicy meat, eaten by only the most worthy hunters - or the most rich clients."
	list_reagents = list("nutriment" = 10)
	bonus_reagents = list("nutriment" = 5, "vitamin" = 10) //It wouldn't make sense for it to be worse than the normal

//WASTELAND JUNK FOOD

/obj/item/weapon/reagent_containers/food/snacks/f13
	name = "ERROR"
	desc = "Badmins spawn shit"
	icon = 'icons/fallout/objects/food&drinks/food.dmi'

/obj/item/weapon/reagent_containers/food/snacks/f13/bubblegum
	name = "Bubblegum"
	desc = "Big Pops branded bubblegum."
	icon_state = "bubblegum"
	bonus_reagents = list("radium" = 2, "vitamin" = 1)
	list_reagents = list("nutriment" = 2)
	filling_color = "#B22222"

/obj/item/weapon/reagent_containers/food/snacks/f13/cram
	name = "Cram"
	desc = "It is a blue labeled tin of processed meat, primarily used as rations for soldiers in pre-War times."
	icon_state = "cram"
	bonus_reagents = list("radium" = 1, "vitamin" = 5)
	list_reagents = list("nutriment" = 20)
	filling_color = "#B22222"

/obj/item/weapon/reagent_containers/food/snacks/f13/craml
	name = "Cram"
	desc = "It's a large blue labeled tin of processed meat, primarily used as rations for soldiers during the Pre-War times."
	icon_state = "cram_large"
	bonus_reagents = list("radium" = 1, "vitamin" = 5)
	list_reagents = list("nutriment" = 40)
	filling_color = "#B22222"

/obj/item/weapon/reagent_containers/food/snacks/f13/yumyum
	name = "YumYum"
	desc = "YumYum was a pre-War company in the United States, producing packaged foods.<br>YumYum Deviled Eggs was their major product."
	icon_state = "yumyum"
	bonus_reagents = list("radium" = 1, "vitamin" = 2)
	list_reagents = list("nutriment" = 10)
	filling_color = "#B22222"

/obj/item/weapon/reagent_containers/food/snacks/f13/fancylads
	name = "Fancy Lads"
	desc = "The presence of snack cakes is a nod to the urban myth that Twinkies and other similar foods would survive a nuclear war.<br>The slogan is 'A big delight in every bite'."
	icon_state = "fancylads"
	bonus_reagents = list("radium" = 2, "vitamin" = 1)
	list_reagents = list("nutriment" = 20)
	filling_color = "#B22222"

/obj/item/weapon/reagent_containers/food/snacks/f13/sugarbombs
	name = "Sugar Bombs"
	desc = "Sugar Bombs is a pre-War breakfast cereal that can be found all around the Wasteland, packaged in white and blue boxes with a red ovoid logo at the top, fully labeled as 'Sugar Bombs breakfast cereal'."
	icon_state = "sugarbombs"
	bonus_reagents = list("radium" = 3, "vitamin" = 2)
	list_reagents = list("nutriment" = 10, "sugar" = 10)
	filling_color = "#B22222"

/obj/item/weapon/reagent_containers/food/snacks/f13/crisps
	name = "Crisps"
	desc = "Potato Crisps are packaged in a small red and green box, with a yellow bubble encouraging the purchaser to 'See Moon Map Offer on Back!'."
	icon_state = "crisps"
	bonus_reagents = list("radium" = 1, "vitamin" = 1)
	list_reagents = list("nutriment" = 5)
	filling_color = "#B22222"

/obj/item/weapon/reagent_containers/food/snacks/f13/steak
	name = "Salisbury Steak"
	desc = "Salisbury Steaks are found in big, subdued red boxes."
	icon_state = "steak"
	bonus_reagents = list("radium" = 2, "vitamin" = 5)
	list_reagents = list("nutriment" = 50)
	filling_color = "#B22222"

/obj/item/weapon/reagent_containers/food/snacks/f13/dandyapples
	name = "Dandy Apples"
	desc = "Dandy Boy Apples were envisioned and produced from the pre-War company Dandy Boy, consisting of candied apples packaged in a red cardboard box."
	icon_state = "dandyapples"
	bonus_reagents = list("radium" = 2, "vitamin" = 2)
	list_reagents = list("nutriment" = 10)
	filling_color = "#B22222"

/obj/item/weapon/reagent_containers/food/snacks/f13/blamco
	name = "BlamCo"
	desc = "BlamCo was a pre-War company in the United States, producing packaged foods.<br>BlamCo Mac & Cheese was their major product.<br>Unlike other foods, like apples or eggs, wheat cannot be freeze-dried. How the macaroni remains edible is unclear."
	icon_state = "blamco"
	bonus_reagents = list("radium" = 3, "vitamin" = 2)
	list_reagents = list("nutriment" = 15)
	filling_color = "#B22222"

/obj/item/weapon/reagent_containers/food/snacks/f13/instamash
	name = "InstaMash"
	desc = "InstaMash is packaged in a white box with blue highlights.<br>It appears to be a form of instant potatoes."
	icon_state = "instamash"
	bonus_reagents = list("radium" = 2, "vitamin" = 2)
	list_reagents = list("nutriment" = 15)
	filling_color = "#B22222"

/obj/item/weapon/reagent_containers/food/snacks/f13/porknbeans
	name = "Pork n' Beans"
	desc = "Pork n' Beans come in a small brown and orange tin, with a label that reads 'Greasy Prospector Improved Pork And Beans'.<br>Toward the bottom of the label is printed that the beans come 'With Hickory Smoked Pig Fat Chunks'."
	icon_state = "porknbeans"
	bonus_reagents = list("radium" = 3, "vitamin" = 2)
	list_reagents = list("nutriment" = 35)
	filling_color = "#B22222"

//Grownable

/obj/item/weapon/reagent_containers/food/snacks/grown/broc
	seed = /obj/item/seeds/broc
	name = "broc flower"
	desc = "Broc flower grows on broc plants and can be used in the crafting of healing powder and stimpaks due to it's mild healing properties."
	icon_state = "broc"
	//slot_flags = SLOT_HEAD
	filling_color = "#FF6347"

/obj/item/weapon/reagent_containers/food/snacks/grown/xander
	seed = /obj/item/seeds/xander
	name = "xander root"
	desc = "Xander root is a large, turnip-like root with mild healing properties. It can easily be identified by its exposed head and tall green stalk protruding from a raised ring of dirt, resembling an onion. Once collected, xander root can be used in the crafting of both healing powder and stimpaks."
	icon_state = "xander"
	filling_color = "#FF6347"

/obj/item/weapon/reagent_containers/food/snacks/grown/fungus
	seed = /obj/item/seeds/fungus
	name = "cave fungus"
	desc = "Cave fungus is an edible mushroom which has the ability to decrease radioation."
	icon_state = "fungus"
	filling_color = "#FF6347"

/obj/item/weapon/reagent_containers/food/snacks/grown/mutfruit
	seed = /obj/item/seeds/mutfruit
	name = "Mutfruit"
	desc = "Mutfruit provides both hydration and sustenance, and provides them at moderately higher levels than other fruits, it gives a small amount of Radiation."
	icon_state = "mutfruit"
	filling_color = "#FF6347"

/obj/item/weapon/reagent_containers/food/snacks/grown/feracactus
	seed = /obj/item/seeds/feracactus
	name = "Barrel cactus fruit"
	desc = "Barrel cactus fruit are found on barrel cactus; a spherical cacti that can be encountered while wandering the Texas. They usually form in groups, with one large barrel cactus that contains the fruit surrounded by several smaller cacti. Like all other Texas plants, fruit-bearing barrel cacti will eventually grow back after being picked."
	icon_state = "feracactus"
	filling_color = "#FF6347"
