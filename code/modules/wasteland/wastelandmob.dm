/mob/living/simple_animal/hostile/cazador
	name = "Cazador"
	desc = "Big flying thing."
	icon_state = "cazador"
	icon_living = "cazador"
	icon_gib = "carp_gib"
	speak_chance = 0
	turns_per_move = 15
	butcher_results = list()
	response_help = "pets"
	response_disarm = "gently pushes aside"
	response_harm = "hits"
	emote_taunt = list("gnashes")
	taunt_chance = 30
	speed = -5
	maxHealth = 50
	health = 50

	harm_intent_damage = 10
	melee_damage_lower = 16
	melee_damage_upper = 20
	attacktext = "stings"
	attack_sound = 'sound/weapons/bite.ogg'
	speak_emote = list("gnashes")

	//Space carp aren't affected by cold.
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	maxbodytemp = 350

	faction = list("wmob")
	flying = 1
	gold_core_spawnable = 1

/mob/living/simple_animal/hostile/cazador/death(gibbed)
	health = 0
	icon_dead = pick(list("cazador_dead1", "cazador_dead2", "cazador_dead3", "cazador_dead4"))
	icon_state = pick(list("cazador_dead1", "cazador_dead2", "cazador_dead3", "cazador_dead4"))
	stat = DEAD
	density = 0
	if(!gibbed)
		visible_message("<span class='danger'>\the [src] stops moving...</span>")
	..()

/mob/living/simple_animal/hostile/cazador/AttackingTarget()
	..()
	if(ishuman(target))
		var/mob/living/carbon/human/H = target
		H.adjustStaminaLoss(4)

/mob/living/simple_animal/hostile/molerat
	name = "Molerat"
	desc = "A giant rodent"
	icon_state = "mole_rat"
	icon_living = "mole_rat"
	icon_dead = "mole_rat_dead"
	speak_chance = 20
	speak = list("Squeek!", "Squeek, i say", "Squeek", "Squeek", "Squeek", "Squeek!", "Squeek", "Squeek!")
	speak_emote = list("chirps")
	turns_per_move = 1
	response_help = "pets"
	response_disarm = "gently pushes aside"
	response_harm = "hits"
	butcher_results = list(/obj/item/weapon/reagent_containers/food/snacks/meat/slab/molerat = 1)
	maxHealth = 50
	health = 50
	faction = list("wmob")
	melee_damage_lower = 5
	melee_damage_upper = 10
	attacktext = "bites"
	speed = 2

/mob/living/simple_animal/hostile/gekkon
	name = "Gekkon"
	desc = "It's Gekkon, not G.E.C.K."
	icon_state = "gekkon"
	icon_living = "gekkon"
	icon_dead = "gekkon_dead"
	//speak_chance = 20
	//speak = list("Squeek!", "Squeek, i say", "Squeek", "Squeek", "Squeek", "Squeek!", "Squeek", "Squeek!")
	//speak_emote = list("chirps")
	turns_per_move = 1
	response_help = "pets"
	response_disarm = "gently pushes aside"
	response_harm = "hits"
	maxHealth = 60
	health = 60
	butcher_results = list(/obj/item/stack/sheet/gekkonhide = 1, \
	/obj/item/weapon/reagent_containers/food/snacks/meat/slab/gekkon = 1)
	faction = list("wmobs")
	melee_damage_lower = 10
	melee_damage_upper = 15
	attacktext = "bites"
	speed = 2

/mob/living/simple_animal/hostile/deathclaw
	name = "Deathclaw"
	desc = "A huge monster"
	icon = 'icons/mob/deathclaw.dmi'
	icon_state = "deathclaw"
	icon_living = "deathclaw"
	icon_dead = "deathclaw_dead"
	//speak_chance = 40
	//speak = list("GRRRRRR!", "ARGH!", "NNNNNGH!", "HMPH!", "ARRRRR!")
	//speak_emote = list("shouts", "yells")
	speed = 3
	turns_per_move = 5
	response_help = "touches"
	response_disarm = "tries to push aside"
	response_harm = "hits"
	butcher_results = list(/obj/item/weapon/reagent_containers/food/snacks/meat/slab/deathclaw = 5)
	maxHealth = 500
	health = 500
	force_threshold = 20
	faction = list("wclaw")
	melee_damage_lower = 40
	melee_damage_upper = 60
	attacktext = "slashes"
	attack_sound = 'sound/weapons/bladeslice.ogg'


/mob/living/simple_animal/hostile/badmutant
	name = "Mutant"
	desc = "A huge mutant"
	icon = 'icons/mob/hulk.dmi'
	icon_state = "hulk_113_s"
	icon_dead = "hulk_113_s"
	speak_chance = 40
	speak = list("GRRRRRR!", "ARGH!", "NNNNNGH!", "HMPH!", "ARRRRR!")
	speak_emote = list("shouts", "yells")
	speed = 5
	turns_per_move = 5
	response_help = "touches"
	response_disarm = "tries to push aside"
	response_harm = "hits"
	maxHealth = 250
	health = 250
	force_threshold = 15
	faction = list("wmaster")
	melee_damage_lower = 25
	melee_damage_upper = 35
	attacktext = "hits"
	attack_sound = 'sound/weapons/punch4.ogg'

/mob/living/simple_animal/hostile/badmutant/death(gibbed)
	health = 0
	icon = 'icons/mob/Hulk_dead.dmi'
	icon_state = icon_dead
	stat = DEAD
	density = 0
	if(!gibbed)
		visible_message("<span class='danger'>\the [src] stops moving...</span>")
	..()
	//RAd scorpion
/mob/living/simple_animal/hostile/rad_scorpion
	name = "giant rad scorpion"
	desc = "Furry and black, it makes you shudder to look at it. This one has deep red eyes."
	icon_state = "guard"
	icon_living = "guard"
	icon_dead = "guard_dead"
	speak_emote = list("chitters")
	//emote_hear = list("chitters")
	speak_chance = 5
	turns_per_move = 5
	see_in_dark = 10
	butcher_results = list(/obj/item/weapon/reagent_containers/food/snacks/meat/slab/spider = 2, /obj/item/weapon/reagent_containers/food/snacks/spiderleg = 8)
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "hits"
	maxHealth = 200
	health = 200
	melee_damage_lower = 15
	melee_damage_upper = 20
	faction = list("scorpions")
	var/busy = 0
	pass_flags = PASSTABLE
	move_to_delay = 6
	ventcrawler = 2
	attacktext = "bites"
	attack_sound = 'sound/weapons/bite.ogg'
	unique_name = 1
	gold_core_spawnable = 1
	see_invisible = SEE_INVISIBLE_MINIMUM
	see_in_dark = 4
/mob/living/simple_animal/hostile/rad_scorpion/blue
	name = "giant rad scorpion"
	desc = "Furry and black, it makes you shudder to look at it. This one has deep red eyes."
	icon_state = "radscorpion"
	icon_living = "radscorpion"
	icon_dead = "radscorpion_d"
	icon_gib = "radscorpion_g"
	maxHealth = 200
	health = 200
	melee_damage_lower = 10
	melee_damage_upper = 20
	move_to_delay = 5
	faction = list("scorpions")