//Loot spawners. Divided by types.
// TODO: Armor spawners.


/obj/effect/spawner/lootdrop/crafts
	color = "#0FFFA0"
	loot = list(
	/obj/item/crafting/diode = 5,
	/obj/item/crafting/transistor = 5,
	/obj/item/crafting/capacitor = 5,
	/obj/item/crafting/fuse = 5,
	/obj/item/crafting/resistor = 5,
	/obj/item/crafting/switch = 5,
	/obj/item/crafting/bulb = 5,
	/obj/item/crafting/board = 5,
	/obj/item/crafting/buzzer = 5,
	/obj/item/crafting/frame = 5,
	/obj/item/crafting/small_gear = 5,
	/obj/item/crafting/large_gear = 5,
	/obj/item/crafting/duct_tape = 5,
	/obj/item/crafting/wonderglue = 5,
	/obj/item/crafting/turpentine = 5,
	/obj/item/crafting/abraxo = 5,
	/obj/item/crafting/reloader = 5,
	/obj/item/crafting/igniter = 5,
	/obj/item/crafting/timer = 5,
	/obj/item/crafting/sensor = 5)

/obj/effect/spawner/lootdrop/wrange_low
	color = "#CCCCCC"
	loot = list(
	/obj/item/weapon/gun/ballistic/automatic/pistol/n99 = 33,
	/obj/item/weapon/gun/ballistic/shotgun/pipe = 33,
	/obj/item/weapon/gun/energy/laser/pistol = 33)

/obj/effect/spawner/lootdrop/wrange_middle
	color = "#0AAAFA"
	loot = list(
	/obj/item/weapon/gun/energy/laser/rifle = 50,
	/obj/item/weapon/gun/energy/plasma/pistol = 50,
	/obj/item/weapon/gun/energy/plasma/glock = 50,
	/obj/item/weapon/gun/ballistic/automatic/assault_rifle = 50,
	/obj/item/weapon/gun/ballistic/shotgun/rifle = 50,
	/obj/item/weapon/gun/ballistic/shotgun/rifle/scope = 50,
	/obj/item/weapon/gun/ballistic/shotgun/trail = 50)

/obj/effect/spawner/lootdrop/wrange_high
	color = "#FFAAFA"
	loot = list(
	/obj/item/weapon/gun/ballistic/revolver/magnum = 50,
	/obj/item/weapon/gun/energy/plasma = 50,
	/obj/item/weapon/gun/energy/laser/rifle/aer13 = 50,
	/obj/item/weapon/gun/ballistic/automatic/smg10mm = 50,
	/obj/item/weapon/gun/ballistic/automatic/rifle = 50)

/obj/effect/spawner/lootdrop/wrange_legend
	color = "#FF0000"
	loot = list(
	/obj/item/weapon/gun/ballistic/automatic/bozar = 25,
	/obj/item/weapon/gun/energy/laser/rifle/tri = 25,
	/obj/item/weapon/gun/energy/plasma/turbo = 25,
	/obj/item/weapon/gun/energy/plasma/tri = 25)

/obj/effect/spawner/lootdrop/ammo
	color = "#FF00FF"
	loot = list(
	/obj/item/ammo_box/magazine/m10mm = 50,
	/obj/item/ammo_box/magazine/m10mm_adv = 50,
	/obj/item/ammo_box/magazine/m10mm_auto = 50,
	/obj/item/ammo_box/m44 = 50,
	/obj/item/ammo_box/magazine/m308 = 50,
	/obj/item/ammo_box/m308 = 50,
	/obj/item/ammo_box/magazine/m223 = 50,
	/obj/item/ammo_box/m223 = 50,
	/obj/item/ammo_casing/shotgun/buckshot = 50)

/obj/effect/spawner/lootdrop/wmelee_low
	color = "#FF0000"
	loot = list(
	/obj/item/weapon/pipe = 50,
	/obj/item/weapon/tireiron = 50,
	/obj/item/weapon/twohanded/baseball = 50,
	/obj/item/weapon/hammer = 50)

/obj/effect/spawner/lootdrop/wmelee_middle
	color = "#FF0000"
	loot = list(
	/obj/item/weapon/machete = 50,
	/obj/item/weapon/golf9 = 50,
	/obj/item/weapon/spear = 50)

/obj/effect/spawner/lootdrop/wmelee_high
	color = "#FF0000"
	loot = list(
	/obj/item/weapon/twohanded/largehammer = 50,
	/obj/item/weapon/twohanded/sledgehammer = 50,
	/obj/item/weapon/twohanded/tribal_spear = 50,
	/obj/item/weapon/powergauntlet = 50,
	/obj/item/weapon/golf10 = 50)

/obj/effect/spawner/lootdrop/wmelee_legend
	color = "#FF0000"
	loot = list(
	/obj/item/weapon/twohanded/superhammer = 50)

/obj/effect/spawner/lootdrop/food
	color = "#FF0000"
	loot = list(
	/obj/item/weapon/reagent_containers/food/snacks/meat/steak/gecko = 50,
	/obj/item/weapon/reagent_containers/food/snacks/meat/steak/molerat = 50,
	/obj/item/weapon/reagent_containers/food/snacks/meat/steak/wolf = 50,
	/obj/item/weapon/reagent_containers/food/snacks/meat/steak/deathclaw = 50,
	/obj/item/weapon/reagent_containers/food/snacks/f13/bubblegum = 50,
	/obj/item/weapon/reagent_containers/food/snacks/f13/bubblegum/large = 50,
	/obj/item/weapon/reagent_containers/food/snacks/f13/cram = 50,
	/obj/item/weapon/reagent_containers/food/snacks/f13/cram/large = 50.1,
	/obj/item/weapon/reagent_containers/food/snacks/f13/yumyum = 50,
	/obj/item/weapon/reagent_containers/food/snacks/f13/fancylads = 50,
	/obj/item/weapon/reagent_containers/food/snacks/f13/sugarbombs = 50,
	/obj/item/weapon/reagent_containers/food/snacks/f13/crisps = 50,
	/obj/item/weapon/reagent_containers/food/snacks/f13/steak = 50,
	/obj/item/weapon/reagent_containers/food/snacks/f13/specialapples = 50,
	/obj/item/weapon/reagent_containers/food/snacks/f13/dandyapples = 50,
	/obj/item/weapon/reagent_containers/food/snacks/f13/blamco = 50,
	/obj/item/weapon/reagent_containers/food/snacks/f13/blamco/large = 50.1,
	/obj/item/weapon/reagent_containers/food/snacks/f13/mechanic = 50,
	/obj/item/weapon/reagent_containers/food/snacks/f13/instamash = 50,
	/obj/item/weapon/reagent_containers/food/snacks/f13/porknbeans = 50,
	/obj/item/weapon/reagent_containers/food/snacks/f13/borscht = 50,
	/obj/item/weapon/reagent_containers/food/snacks/f13/dog = 50,
	/obj/item/weapon/reagent_containers/food/snacks/f13/mre = 50,
	/obj/item/weapon/reagent_containers/food/snacks/f13/galette = 50,
	/obj/item/weapon/reagent_containers/food/snacks/grown/broc = 50,
	/obj/item/weapon/reagent_containers/food/snacks/grown/xander = 50,
	/obj/item/weapon/reagent_containers/food/snacks/grown/mutfruit = 50,
	/obj/item/weapon/reagent_containers/food/snacks/grown/ferocactus = 50,
	/obj/item/weapon/reagent_containers/food/snacks/grown/shroom = 50.1,
	/obj/item/weapon/reagent_containers/food/snacks/grown/glow = 50.1)

/obj/effect/spawner/lootdrop/trash
	color = "#FF0000"
	loot = list(
	/obj/item/trash/f13/bubblegum = 50,
	/obj/item/trash/f13/bubblegum_large = 50,
	/obj/item/trash/f13/cram = 50,
	/obj/item/trash/f13/cram_large = 50,
	/obj/item/trash/f13/yumyum = 50,
	/obj/item/trash/f13/fancylads = 50,
	/obj/item/trash/f13/sugarbombs = 50,
	/obj/item/trash/f13/crisps = 50,
	/obj/item/trash/f13/steak = 50,
	/obj/item/trash/f13/specialapples = 50,
	/obj/item/trash/f13/dandyapples = 50,
	/obj/item/trash/f13/blamco_large = 50,
	/obj/item/trash/f13/blamco = 50,
	/obj/item/trash/f13/mechanist = 50,
	/obj/item/trash/f13/instamash = 50,
	/obj/item/trash/f13/porknbeans = 50,
	/obj/item/trash/f13/borscht = 50,
	/obj/item/trash/f13/dog = 50,
	/obj/item/trash/f13/mre = 50,
	/obj/item/trash/f13/rotten = 50,
	/obj/item/clothing/head/f13/headscarf = 50)

/obj/effect/spawner/lootdrop/clothing_low
	color = "#FF0000"
	loot = list(
	/obj/item/clothing/suit/armor/f13/leatherarmor = 50,
	/obj/item/clothing/suit/armor/f13/slam = 50,
	/obj/item/clothing/glasses/f13/biker = 50,
	/obj/item/clothing/gloves/f13/leather = 50,
	/obj/item/clothing/head/f13/police = 50,
	/obj/item/clothing/head/f13/det_hat_alt = 50,
	/obj/item/clothing/head/f13/bandit = 50,
	/obj/item/clothing/head/helmet/f13/motorcycle = 50,
	/obj/item/clothing/mask/balaclava = 50,
	/obj/item/clothing/shoes/f13/brownie = 50,
	/obj/item/clothing/shoes/f13/tan = 50,
	/obj/item/clothing/shoes/f13/rag = 50,
	/obj/item/clothing/under/f13/brahmin = 50,
	/obj/item/clothing/under/f13/settler = 50,
	/obj/item/clothing/suit/f13/vest = 50)

/obj/effect/spawner/lootdrop/clothing_middle
	color = "#FF0000"
	loot = list(
	/obj/item/clothing/gloves/f13/leather = 50,
	/obj/item/clothing/head/f13/stormchaser = 50,
	/obj/item/clothing/head/helmet/f13/tribal = 50,
	/obj/item/clothing/head/helmet/f13/supaflyhelmet = 50,
	/obj/item/clothing/head/helmet/f13/firefighter = 50,
	/obj/item/clothing/head/helmet/f13/combat_mk1 = 50,
	/obj/item/clothing/shoes/f13/military = 50,
	/obj/item/clothing/shoes/f13/military/diesel = 50,
	/obj/item/clothing/suit/armor/f13/combat_mk1 = 50,
	/obj/item/clothing/suit/armor/f13/kit = 50,
	/obj/item/clothing/suit/armor/f13/yankee = 50,
	/obj/item/clothing/suit/f13/veteran = 50,
	/obj/item/clothing/under/f13/cyberpunk = 50,
	/obj/item/clothing/under/f13/combat = 50,
	/obj/item/clothing/under/f13/petrochico = 50)

/obj/effect/spawner/lootdrop/clothing_high
	color = "#FF0000"
	loot = list(
	/obj/item/clothing/head/helmet/f13/combat_mk2 = 50,
	/obj/item/clothing/suit/armor/f13/bmetalarmor = 50,
	/obj/item/clothing/suit/armor/f13/combat_mk2 = 50)

/obj/effect/spawner/lootdrop/clothing_legend
	color = "#FF0000"
	loot = list(
	/obj/item/clothing/head/helmet/power_armor/t45d = 50,
	/obj/item/clothing/head/helmet/power_armor/ncr = 50,
	/obj/item/clothing/suit/armor/f13/power_armor/t45d = 50,
	/obj/item/clothing/suit/armor/f13/power_armor/ncr = 50,
	/obj/item/clothing/under/f13/recon = 50)