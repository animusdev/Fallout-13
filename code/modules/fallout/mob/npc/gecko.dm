//Fallout 13 gecko directory

/mob/living/simple_animal/hostile/gecko
	name = "gecko"
	desc = "It's Gecko, not G.E.C.K."
	icon_state = "gecko"
	icon_living = "gecko"
	icon_dead = "gecko_dead"
	icon_gib = "gib"
	turns_per_move = 1
	response_help = "pokes"
	response_disarm = "pushes aside"
	response_harm = "kicks"
	maxHealth = 50
	health = 50
	self_weight = 35

	sound_speak_chance = 5
	sound_speak = list('sound/f13npc/gecko_charge1.ogg','sound/f13npc/gecko_charge2.ogg','sound/f13npc/gecko_charge3.ogg')

	death_sound = 'sound/f13npc/gecko_death.ogg'

	aggro_sound_chance = 50
	aggro_sound = 'sound/f13npc/gecko_alert.ogg'

	environment_smash = 0
	butcher_results = list(/obj/item/stack/sheet/animalhide/gecko = 1, \
	/obj/item/weapon/reagent_containers/food/snacks/meat/slab/gecko = 1)
	faction = list("hostile", "gecko")
	icon = 'icons/fallout/mobs/animal.dmi'
	melee_damage_lower = 5
	melee_damage_upper = 15
	aggro_vision_range = 10
	idle_vision_range = 5
	attacktext = "bites"
	attack_sound = 'sound/weapons/bite.ogg'
	move_to_delay = 2