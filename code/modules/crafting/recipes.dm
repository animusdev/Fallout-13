
/datum/table_recipe
	var/name = "" //in-game display name
	var/reqs[] = list() //type paths of items consumed associated with how many are needed
	var/result //type path of item resulting from this craft
	var/tools[] = list() //type paths of items needed but not consumed
	var/time = 30 //time in deciseconds
	var/parts[] = list() //type paths of items that will be placed in the result
	var/chem_catalysts[] = list() //like tools but for reagents
	var/category = CAT_NONE //where it shows up in the crafting UI


/datum/table_recipe/pin_removal
	name = "Pin Removal"
	result = /obj/item/weapon/gun
	reqs = list(/obj/item/weapon/gun = 1)
	parts = list(/obj/item/weapon/gun = 1)
	tools = list(/obj/item/weapon/screwdriver, /obj/item/weapon/wirecutters)
	time = 50
	category = CAT_WEAPON

/datum/table_recipe/IED
	name = "IED"
	result = /obj/item/weapon/grenade/iedcasing
	reqs = list(/datum/reagent/fuel = 50,
				/obj/item/stack/cable_coil = 1,
				/obj/item/device/assembly/igniter = 1,
				/obj/item/weapon/reagent_containers/food/drinks/soda_cans = 1)
	parts = list(/obj/item/weapon/reagent_containers/food/drinks/soda_cans = 1)
	time = 15
	category = CAT_WEAPON

/datum/table_recipe/lance
	name = "explosive lance (grenade)"
	result = /obj/item/weapon/twohanded/spear
	reqs = list(/obj/item/weapon/twohanded/spear = 1,
				/obj/item/weapon/grenade = 1)
	parts = list(/obj/item/weapon/grenade = 1)
	time = 30
	category = CAT_WEAPON

/datum/table_recipe/lance2
	name = "explosive lance (C4)"
	result = /obj/item/weapon/twohanded/spear
	reqs = list(/obj/item/weapon/twohanded/spear = 1,
				/obj/item/weapon/c4 = 1)
	parts = list(/obj/item/weapon/c4 = 1)
	time = 60
	category = CAT_WEAPON


/datum/table_recipe/molotov
	name = "Molotov"
	result = /obj/item/weapon/reagent_containers/food/drinks/bottle/molotov
	reqs = list(/obj/item/weapon/reagent_containers/glass/rag = 1,
				/obj/item/weapon/reagent_containers/food/drinks/bottle = 1)
	parts = list(/obj/item/weapon/reagent_containers/food/drinks/bottle = 1)
	time = 40
	category = CAT_WEAPON

/datum/table_recipe/stunprod
	name = "Stunprod"
	result = /obj/item/weapon/melee/baton/cattleprod
	reqs = list(/obj/item/weapon/restraints/handcuffs/cable = 1,
				/obj/item/stack/rods = 1,
				/obj/item/weapon/wirecutters = 1,
				/obj/item/weapon/stock_parts/cell = 1)
	time = 40
	parts = list(/obj/item/weapon/stock_parts/cell = 1)
	category = CAT_WEAPON

/datum/table_recipe/teleprod
	name = "Teleprod"
	result = /obj/item/weapon/melee/baton/cattleprod/teleprod
	reqs = list(/obj/item/weapon/restraints/handcuffs/cable = 1,
				/obj/item/stack/rods = 1,
				/obj/item/weapon/wirecutters = 1,
				/obj/item/weapon/stock_parts/cell = 1,
				/obj/item/weapon/ore/bluespace_crystal = 1)
	time = 60
	parts = list(/obj/item/weapon/stock_parts/cell = 1)
	category = CAT_WEAPON

//datum/table_recipe/tailclub
//	name = "Tail Club"
//	result = /obj/item/weapon/tailclub
//	reqs = list(/obj/item/organ/severedtail = 1,
//	            /obj/item/stack/sheet/metal = 1)
//	time = 40
//	category = CAT_WEAPON

//datum/table_recipe/tailwhip
//	name = "Liz O' Nine Tails"
//	result = /obj/item/weapon/melee/chainofcommand/tailwhip
//	reqs = list(/obj/item/organ/severedtail = 1,
//	            /obj/item/stack/cable_coil = 1)
//	time = 40
//	category = CAT_WEAPON

/datum/table_recipe/bola
	name = "Bola"
	result = /obj/item/weapon/restraints/legcuffs/bola
	reqs = list(/obj/item/weapon/restraints/handcuffs/cable = 1,
				/obj/item/stack/sheet/metal = 4)
	time = 30
	category= CAT_WEAPON
/*
/datum/table_recipe/ed209
	name = "ED209"
	result = /mob/living/simple_animal/bot/ed209
	reqs = list(/obj/item/robot_parts/robot_suit = 1,
				/obj/item/clothing/head/helmet = 1,
				/obj/item/clothing/suit/armor/vest = 1,
				/obj/item/robot_parts/l_leg = 1,
				/obj/item/robot_parts/r_leg = 1,
				/obj/item/stack/sheet/metal = 5,
				/obj/item/stack/cable_coil = 5,
				/obj/item/weapon/gun/energy/gun/advtaser = 1,
				/obj/item/weapon/stock_parts/cell = 1,
				/obj/item/device/assembly/prox_sensor = 1,
				/obj/item/robot_parts/r_arm = 1)
	tools = list(/obj/item/weapon/weldingtool, /obj/item/weapon/screwdriver)
	time = 60
	category = CAT_ROBOT

/datum/table_recipe/secbot
	name = "Secbot"
	result = /mob/living/simple_animal/bot/secbot
	reqs = list(/obj/item/device/assembly/signaler = 1,
				/obj/item/clothing/head/helmet/sec = 1,
				/obj/item/weapon/melee/baton = 1,
				/obj/item/device/assembly/prox_sensor = 1,
				/obj/item/robot_parts/r_arm = 1)
	tools = list(/obj/item/weapon/weldingtool)
	time = 60
	category = CAT_ROBOT
*/
/datum/table_recipe/cleanbot
	name = "Cleanbot"
	result = /mob/living/simple_animal/bot/cleanbot
	reqs = list(/obj/item/weapon/reagent_containers/glass/bucket = 1,
				/obj/item/device/assembly/prox_sensor = 1,
				/obj/item/robot_parts/r_arm = 1)
	time = 40
	category = CAT_ROBOT
/*
/datum/table_recipe/floorbot
	name = "Floorbot"
	result = /mob/living/simple_animal/bot/floorbot
	reqs = list(/obj/item/weapon/storage/toolbox/mechanical = 1,
				/obj/item/stack/tile/plasteel = 1,
				/obj/item/device/assembly/prox_sensor = 1,
				/obj/item/robot_parts/r_arm = 1)
	time = 50
	category = CAT_ROBOT
*/
/datum/table_recipe/medbot
	name = "Medbot"
	result = /mob/living/simple_animal/bot/medbot
	reqs = list(/obj/item/device/healthanalyzer = 1,
				/obj/item/weapon/storage/firstaid = 1,
				/obj/item/device/assembly/prox_sensor = 1,
				/obj/item/robot_parts/r_arm = 1)
	time = 80
	category = CAT_ROBOT
/*
/datum/table_recipe/flamethrower
	name = "Flamethrower"
	result = /obj/item/weapon/flamethrower
	reqs = list(/obj/item/weapon/weldingtool = 1,
				/obj/item/device/assembly/igniter = 1,
				/obj/item/stack/rods = 1)
	parts = list(/obj/item/device/assembly/igniter = 1,
				/obj/item/weapon/weldingtool = 1)
	tools = list(/obj/item/weapon/screwdriver)
	time = 20
	category = CAT_WEAPON
*/
/*
/datum/table_recipe/meteorshot
	name = "Meteorshot Shell"
	result = /obj/item/ammo_casing/shotgun/meteorshot
	reqs = list(/obj/item/ammo_casing/shotgun/techshell = 1,
				/obj/item/weapon/rcd_ammo = 1,
				/obj/item/weapon/stock_parts/manipulator = 2)
	tools = list(/obj/item/weapon/screwdriver)
	time = 5
	category = CAT_AMMO
	*/
/*
/datum/table_recipe/pulseslug
	name = "Pulse Slug Shell"
	result = /obj/item/ammo_casing/shotgun/pulseslug
	reqs = list(/obj/item/ammo_casing/shotgun/techshell = 1,
				/obj/item/weapon/stock_parts/capacitor/adv = 2,
				/obj/item/weapon/stock_parts/micro_laser/ultra = 1)
	tools = list(/obj/item/weapon/screwdriver)
	time = 5
	category = CAT_AMMO
*/
/datum/table_recipe/dragonsbreath
	name = "Dragonsbreath Shell"
	result = /obj/item/ammo_casing/shotgun/incendiary/dragonsbreath
	reqs = list(/obj/item/ammo_casing/shotgun/techshell = 1,
				/datum/reagent/phosphorus = 5,)
	tools = list(/obj/item/weapon/screwdriver)
	time = 5
	category = CAT_AMMO

/datum/table_recipe/frag12
	name = "FRAG-12 Shell"
	result = /obj/item/ammo_casing/shotgun/frag12
	reqs = list(/obj/item/ammo_casing/shotgun/techshell = 1,
				/datum/reagent/glycerol = 5,
				/datum/reagent/toxin/acid = 5,
				/datum/reagent/toxin/acid/fluacid = 5,)
	tools = list(/obj/item/weapon/screwdriver)
	time = 5
	category = CAT_AMMO

/*/datum/table_recipe/ionslug
	name = "Ion Scatter Shell"
	result = /obj/item/ammo_casing/shotgun/ion
	reqs = list(/obj/item/ammo_casing/shotgun/techshell = 1,
				/obj/item/weapon/stock_parts/micro_laser/ultra = 1,
				/obj/item/weapon/stock_parts/subspace/crystal = 1)
	tools = list(/obj/item/weapon/screwdriver)
	time = 5
	category = CAT_AMMO
	*/

/datum/table_recipe/improvisedslug
	name = "Improvised Shotgun Shell"
	result = /obj/item/ammo_casing/shotgun/improvised
	reqs = list(/obj/item/weapon/grenade/chem_grenade = 1,
				/obj/item/stack/sheet/metal = 1,
				/obj/item/stack/cable_coil = 1,
				/datum/reagent/fuel = 5)
	tools = list(/obj/item/weapon/screwdriver)
	time = 5
	category = CAT_AMMO

/datum/table_recipe/improvisedslugoverload
	name = "Overload Improvised Shell"
	result = /obj/item/ammo_casing/shotgun/improvised/overload
	reqs = list(/obj/item/ammo_casing/shotgun/improvised = 1,
				/datum/reagent/blackpowder = 5)
	tools = list(/obj/item/weapon/screwdriver)
	time = 5
	category = CAT_AMMO

/datum/table_recipe/c10mm
	name = "10 mm bullet"
	result = /obj/item/ammo_casing/c10mm
	reqs = list(/obj/item/ammo_casing/c10mm = 1,
				/datum/reagent/blackpowder = 5)
	tools = list(/obj/item/weapon/screwdriver)
	time = 5
	category = CAT_AMMO

/datum/table_recipe/c45
	name = "c45 bullet"
	result = /obj/item/ammo_casing/c45
	reqs = list(/obj/item/ammo_casing/c45 = 1,
				/datum/reagent/blackpowder = 4)
	tools = list(/obj/item/weapon/screwdriver)
	time = 6
	category = CAT_AMMO

/datum/table_recipe/buckshot
	name = "buckshot shell"
	result = /obj/item/ammo_casing/shotgun/buckshot
	reqs = list(/obj/item/ammo_casing/shotgun/buckshot = 1,
				/datum/reagent/blackpowder = 10)
	tools = list(/obj/item/weapon/screwdriver)
	time = 5
	category = CAT_AMMO

/datum/table_recipe/a556
	name = "a556 bullet"
	result = /obj/item/ammo_casing/a556
	reqs = list(/obj/item/ammo_casing/a556 = 1,
				/datum/reagent/blackpowder = 7)
	tools = list(/obj/item/weapon/wrench, /obj/item/weapon/screwdriver)
	time = 8
	category = CAT_AMMO

/*/datum/table_recipe/laserslug
	name = "Laser Slug Shell"
	result = /obj/item/ammo_casing/shotgun/laserslug
	reqs = list(/obj/item/ammo_casing/shotgun/techshell = 1,
				/obj/item/weapon/stock_parts/capacitor/adv = 1,
				/obj/item/weapon/stock_parts/micro_laser/high = 1)
	tools = list(/obj/item/weapon/screwdriver)
	time = 5
	category = CAT_AMMO
*/
/datum/table_recipe/ishotgun
	name = "Improvised Shotgun"
	result = /obj/item/weapon/gun/projectile/revolver/doublebarrel/improvised
	reqs = list(/obj/item/weaponcrafting/reciever = 1,
				/obj/item/pipe = 1,
				/obj/item/weaponcrafting/stock = 1,
				/obj/item/stack/packageWrap = 5,)
	tools = list(/obj/item/weapon/screwdriver)
	time = 150
	category = CAT_WEAPON

/datum/table_recipe/chainsaw
	name = "Chainsaw"
	result = /obj/item/weapon/twohanded/required/chainsaw
	reqs = list(/obj/item/weapon/circular_saw = 1,
				/obj/item/stack/cable_coil = 1,
				/obj/item/stack/sheet/plasteel = 1)
	tools = list(/obj/item/weapon/weldingtool)
	time = 100
	category = CAT_WEAPON
/*
/datum/table_recipe/spooky_camera
	name = "Camera Obscura"
	result = /obj/item/device/camera/spooky
	time = 15
	reqs = list(/obj/item/device/camera = 1,
				/datum/reagent/water/holywater = 10)
	parts = list(/obj/item/device/camera = 1)
	category = CAT_MISC
*/

/datum/table_recipe/leatherarmor
	name = "leather armor"
	result = /obj/item/clothing/suit/armor/f13/leatherarmor
	reqs = list(/obj/item/stack/sheet/gekkonhide = 3,
				/obj/item/stack/cable_coil = 5)
	tools = list(/obj/item/weapon/screwdriver, /obj/item/weapon/wirecutters)
	time = 120
	category = CAT_ARMOR

/datum/table_recipe/leatherhat
	name = "leather hat"
	result = /obj/item/clothing/head/lizard
	reqs = list(/obj/item/stack/sheet/gekkonhide = 1,
				/obj/item/stack/cable_coil = 2)
	tools = list(/obj/item/weapon/screwdriver, /obj/item/weapon/wirecutters)
	time = 40
	category = CAT_ARMOR

/datum/table_recipe/metalarmor
	name = "metal armor"
	result = /obj/item/clothing/suit/armor/f13/bmetalarmor
	reqs = list(/obj/item/stack/sheet/gekkonhide = 1,
				/obj/item/stack/cable_coil = 5,
				/obj/item/stack/sheet/metal = 5)
	tools = list(/obj/item/weapon/screwdriver, /obj/item/weapon/wirecutters)
	time = 120
	category = CAT_ARMOR

/datum/table_recipe/Imetalarmor
	name = "improved metal armor"
	result = /obj/item/clothing/suit/armor/f13/ibmetalarmor
	reqs = list(/obj/item/stack/sheet/gekkonhide = 1,
				/obj/item/stack/cable_coil = 5,
				/obj/item/stack/sheet/metal = 4,
				/obj/item/stack/sheet/plasteel = 2)
	tools = list(/obj/item/weapon/screwdriver, /obj/item/weapon/wirecutters)
	time = 120
	category = CAT_ARMOR

/datum/table_recipe/IImetalarmor
	name = "upgrading metal armor"
	result = /obj/item/clothing/suit/armor/f13/ibmetalarmor
	reqs = list(/obj/item/clothing/suit/armor/f13/bmetalarmor = 1,
				/obj/item/stack/cable_coil = 1,
				/obj/item/stack/sheet/plasteel = 2)
	tools = list(/obj/item/weapon/screwdriver, /obj/item/weapon/wirecutters)
	time = 120
	category = CAT_ARMOR

/datum/table_recipe/gladiator
	name = "gladiator clothing"
	result = /obj/item/clothing/under/gladiator
	reqs = list(/obj/item/stack/sheet/gekkonhide = 1,
				/obj/item/stack/cable_coil = 6,
				/obj/item/stack/sheet/metal = 2)
	tools = list(/obj/item/weapon/screwdriver, /obj/item/weapon/wirecutters)
	time = 120
	category = CAT_ARMOR

/datum/table_recipe/gauze
	name = "Medical gauze"
	result = /obj/item/stack/medical/gauze
	reqs = list(/obj/item/clothing/under = 1)
	time = 20
	category = CAT_MED

/datum/table_recipe/healpowder
	name = "Healing powder"
	result = /obj/item/weapon/reagent_containers/pill/patch/healpowder
	reqs = list(/obj/item/weapon/reagent_containers/food/snacks/grown/broc = 1,
				/obj/item/weapon/reagent_containers/food/snacks/grown/xander = 1)
	time = 20
	category = CAT_MED

/datum/table_recipe/stimpak
	name = "Stimpak"
	result = /obj/item/weapon/reagent_containers/pill/patch/stimpak
	reqs = list(/obj/item/weapon/reagent_containers/pill/patch/healpowder = 1,
				/obj/item/weapon/reagent_containers/food/drinks/nukacola = 1)
	tools = list(/obj/item/weapon/lighter, /obj/item/weapon/reagent_containers/glass/beaker)
	time = 60
	category = CAT_MED

/datum/table_recipe/superstimpak
	name = "Super Stimpak"
	result = /obj/item/weapon/reagent_containers/pill/patch/supstimpak
	reqs = list(/obj/item/weapon/reagent_containers/pill/patch/stimpak = 1,
				/obj/item/stack/sheet/gekkonhide = 1,
				/obj/item/stack/cable_coil = 5)
	tools = list(/obj/item/weapon/lighter, /obj/item/weapon/screwdriver, /obj/item/weapon/wirecutters)
	time = 90
	category = CAT_MED

/datum/table_recipe/lizardhat
	name = "Lizard Cloche Hat"
	result = /obj/item/clothing/head/lizard
	time = 20
	reqs = list(/obj/item/organ/severedtail = 1)

/datum/table_recipe/lizardhat_alternate
	name = "Lizard Cloche Hat"
	result = /obj/item/clothing/head/lizard
	time = 20
	reqs = list(/obj/item/stack/sheet/animalhide/lizard = 1)
