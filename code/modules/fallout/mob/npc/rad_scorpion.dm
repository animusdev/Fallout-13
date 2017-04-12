//Fallout 13 rad scorpion directory

/mob/living/simple_animal/hostile/rad_scorpion
	name = "rad scorpion"
	desc = "It's a rad scorpion with a blue shell, the look of it makes you shudder.<br>This one has razor sharp sting."
	icon_state = "radscorpion"
	icon_living = "radscorpion"
	icon_dead = "radscorpion_d"
	icon_gib = "radscorpion_g"
	icon = 'icons/fallout/mobs/animal.dmi'
	turns_per_move = 5
	see_in_dark = 10
	butcher_results = list(/obj/item/weapon/reagent_containers/food/snacks/meat/slab/spider = 2, /obj/item/weapon/reagent_containers/food/snacks/spiderleg = 8)
	response_help  = "touches"
	response_disarm = "hits"
	response_harm   = "kicks"
	maxHealth = 200
	health = 200
	self_weight = 120

	sound_speak_chance = 5
	sound_speak = list('sound/f13npc/scorpion_charge1.ogg','sound/f13npc/scorpion_charge2.ogg','sound/f13npc/scorpion_charge3.ogg')

	aggro_sound_chance = 50
	aggro_sound = 'sound/f13npc/scorpion_alert.ogg'

	melee_damage_lower = 5
	melee_damage_upper = 20
	environment_smash = 1
	faction = list("hostile", "scorpion")
	move_to_delay = 5
	attacktext = "bites"
	attack_sound = 'sound/weapons/bite.ogg'
	see_invisible = SEE_INVISIBLE_MINIMUM
	see_in_dark = 10
	aggro_vision_range = 8
	idle_vision_range = 7

/mob/living/simple_animal/hostile/rad_scorpion/black
	name = "giant rad scorpion"
	desc = "It's a giant rad scorpion with a black shell, the look of it makes you shudder in fear.<br>This one has giant pincers."
	icon_state = "radscorpion_black"
	icon_living = "radscorpion_black"
	icon_dead = "radscorpion_black_d"
	icon_gib = "gib"
	maxHealth = 275
	health = 275
	melee_damage_lower = 10
	melee_damage_upper = 30
	move_to_delay = 4
	faction = list("scorpion")