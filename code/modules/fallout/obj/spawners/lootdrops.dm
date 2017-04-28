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
	/obj/item/weapon/gun/energy/laser/rifle = 1,
	/obj/item/weapon/gun/energy/plasma/pistol = 1,
	/obj/item/weapon/gun/energy/plasma/glock = 1,
	/obj/item/weapon/gun/ballistic/automatic/assault_rifle = 1,
	/obj/item/weapon/gun/ballistic/shotgun/rifle = 1,
	/obj/item/weapon/gun/ballistic/shotgun/rifle/scope = 1,
	/obj/item/weapon/gun/ballistic/shotgun/trail = 1)

/obj/effect/spawner/lootdrop/wrange_high
	color = "#FFAAFA"
	loot = list(
	/obj/item/weapon/gun/ballistic/revolver/magnum = 1,
	/obj/item/weapon/gun/energy/plasma = 1,
	/obj/item/weapon/gun/energy/laser/rifle/aer13 = 1,
	/obj/item/weapon/gun/ballistic/automatic/smg10mm = 1,
	/obj/item/weapon/gun/ballistic/automatic/rifle = 1)

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
	/obj/item/ammo_box/magazine/m10mm = 1,
	/obj/item/ammo_box/magazine/m10mm_adv = 1,
	/obj/item/ammo_box/magazine/m10mm_auto = 1,
	/obj/item/ammo_box/m44 = 1,
	/obj/item/ammo_box/magazine/m308 = 1,
	/obj/item/ammo_box/m308 = 1,
	/obj/item/ammo_box/magazine/m223 = 1,
	/obj/item/ammo_box/m223 = 1,
	/obj/item/ammo_casing/shotgun/buckshot = 1)

/obj/effect/spawner/lootdrop/wmelee_low
	color = "#FF0000"
	loot = list(
	/obj/item/weapon/pipe = 1,
	/obj/item/weapon/tireiron = 1,
	/obj/item/weapon/twohanded/baseball = 1,
	/obj/item/weapon/hammer = 1)

/obj/effect/spawner/lootdrop/wmelee_middle
	color = "#FF0000"
	loot = list(
	/obj/item/weapon/machete = 1,
	/obj/item/weapon/golf9 = 1,
	/obj/item/weapon/spear = 1)

/obj/effect/spawner/lootdrop/wmelee_high
	color = "#FF0000"
	loot = list(
	/obj/item/weapon/twohanded/largehammer = 1,
	/obj/item/weapon/twohanded/sledgehammer = 1,
	/obj/item/weapon/twohanded/tribal_spear = 1,
	/obj/item/weapon/powergauntlet = 1,
	/obj/item/weapon/golf10 = 1)

/obj/effect/spawner/lootdrop/wmelee_high
	color = "#FF0000"
	loot = list(
	/obj/item/weapon/twohanded/superhammer = 1)

/obj/effect/spawner/lootdrop/food
	color = "#FF0000"
	loot = list(
	/obj/item/weapon/reagent_containers/food/snacks/meat/steak/gecko = 1,
	/obj/item/weapon/reagent_containers/food/snacks/meat/steak/molerat = 1,
	/obj/item/weapon/reagent_containers/food/snacks/meat/steak/wolf = 1,
	/obj/item/weapon/reagent_containers/food/snacks/meat/steak/deathclaw = 1,
	/obj/item/weapon/reagent_containers/food/snacks/f13/bubblegum = 1,
	/obj/item/weapon/reagent_containers/food/snacks/f13/bubblegum/large = 0.1,
	/obj/item/weapon/reagent_containers/food/snacks/f13/cram = 1,
	/obj/item/weapon/reagent_containers/food/snacks/f13/cram/large = 0.1,
	/obj/item/weapon/reagent_containers/food/snacks/f13/yumyum = 1,
	/obj/item/weapon/reagent_containers/food/snacks/f13/fancylads = 1,
	/obj/item/weapon/reagent_containers/food/snacks/f13/sugarbombs = 1,
	/obj/item/weapon/reagent_containers/food/snacks/f13/crisps = 1,
	/obj/item/weapon/reagent_containers/food/snacks/f13/steak = 1,
	/obj/item/weapon/reagent_containers/food/snacks/f13/specialapples = 1,
	/obj/item/weapon/reagent_containers/food/snacks/f13/dandyapples = 1,
	/obj/item/weapon/reagent_containers/food/snacks/f13/blamco = 1,
	/obj/item/weapon/reagent_containers/food/snacks/f13/blamco/large = 0.1,
	/obj/item/weapon/reagent_containers/food/snacks/f13/mechanic = 1,
	/obj/item/weapon/reagent_containers/food/snacks/f13/instamash = 1,
	/obj/item/weapon/reagent_containers/food/snacks/f13/porknbeans = 1,
	/obj/item/weapon/reagent_containers/food/snacks/f13/borscht = 1,
	/obj/item/weapon/reagent_containers/food/snacks/f13/dog = 1,
	/obj/item/weapon/reagent_containers/food/snacks/f13/mre = 1,
	/obj/item/weapon/reagent_containers/food/snacks/f13/galette = 1,
	/obj/item/weapon/reagent_containers/food/snacks/grown/broc = 1,
	/obj/item/weapon/reagent_containers/food/snacks/grown/xander = 1,
	/obj/item/weapon/reagent_containers/food/snacks/grown/mutfruit = 1,
	/obj/item/weapon/reagent_containers/food/snacks/grown/ferocactus = 1,
	/obj/item/weapon/reagent_containers/food/snacks/grown/shroom = 0.1,
	/obj/item/weapon/reagent_containers/food/snacks/grown/glow = 0.1)

/obj/effect/spawner/lootdrop/trash
	color = "#FF0000"
	loot = list(
	/obj/item/trash/bubblegum = 1,
	/obj/item/trash/bubblegum_large = 1,
	/obj/item/trash/cram = 1,
	/obj/item/trash/cram_large = 1,
	/obj/item/trash/yumyum = 1,
	/obj/item/trash/fancylads = 1,
	/obj/item/trash/sugarbombs = 1,
	/obj/item/trash/crisps = 1,
	/obj/item/trash/steak = 1,
	/obj/item/trash/specialapples = 1,
	/obj/item/trash/dandyapples = 1,
	/obj/item/trash/blamco_large = 1,
	/obj/item/trash/blamco = 1,
	/obj/item/trash/mechanist = 1,
	/obj/item/trash/instamash = 1,
	/obj/item/trash/porknbeans = 1,
	/obj/item/trash/borsht = 1,
	/obj/item/trash/dog = 1,
	/obj/item/trash/mre = 1,
	/obj/item/trash/rotten = 1)