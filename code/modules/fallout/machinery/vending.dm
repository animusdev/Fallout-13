//Fallout 13 vending machines directory

/obj/machinery/vending/nukacolavend
	name = "\improper Nuka-Cola vending machine"
	icon = 'icons/fallout/machines/vending.dmi'
	icon_state = "nuka_vending"
	icon_deny = "nuka_vending-deny"
	product_slogans = "Take the leap... enjoy a Quantum!"
	products = list(/obj/item/weapon/reagent_containers/food/drinks/bottle/nukacola/radioactive = 20)
	contraband = list(/obj/item/weapon/reagent_containers/food/drinks/bottle/nukacola = 4)
	refill_canister = /obj/item/weapon/vending_refill/nukacolavend
	self_weight = 150

/obj/machinery/vending/nukacolavend/New()
	desc = pick("You can barely read the engravement on the side of a machine:<br>\"Warning: If you tamper with this unit you will have to answer to the Nuka-Cola Corporation.\"","The machine makes you nostalgic for the best days of your childhood.<br>What if there are still some bottles left? Or maybe not.","If there is anything left from humanity after all the decades of rage and stagnation, that sure is Nuka-Cola.")
	..()

/obj/machinery/vending/nukacolavend/full
	name = "\improper pristine Nuka-Cola vending machine"
	icon_state = "nuka_vending"
	icon_deny = "nuka_vending-deny"
	product_slogans = "Take the leap... enjoy a Quantum!"
	products = list(/obj/item/weapon/reagent_containers/food/drinks/bottle/nukacola = 20)
	contraband = list(/obj/item/weapon/reagent_containers/food/drinks/bottle/nukacola = 10)
	refill_canister = /obj/item/weapon/vending_refill/nukacolavend/full

/obj/machinery/vending/nukacolavend/full/New()
	desc = pick("You can clearly read the engravement on the side of a machine:<br>\"Warning: If you tamper with this unit you will have to answer to the Nuka-Cola Corporation.\"","This particular machine seems to be in a better condition than something you could see out in the wastes.<br>What if there are still some bottles left?","Cola. Cola never changes.<br>The Romans waged war because they didn't try Nuka-Cola. Spain built an empire from its lust for everything but Nuka-Cola.<br>All the empires on Earth have fallen, but Cola never changes.")
	..()

/obj/item/weapon/vending_refill/nukacolavend
	machine_name = "Nuka-Cola vending machine"
	icon_state = "refill_cola"
	charges = list(20, 2, 0)//of 60 standard, 6 contraband
	init_charges = list(20, 2, 0)

/obj/item/weapon/vending_refill/nukacolavend/full
	machine_name = "pristine Nuka-Cola vending machine"
	icon_state = "refill_cola"
	charges = list(20, 2, 0)//of 60 standard, 6 contraband
	init_charges = list(20, 2, 0)