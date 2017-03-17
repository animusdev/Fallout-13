/mob/living/simple_animal/hostile/deathclaw
	name = "Deathclaw"
	desc = "A huge monster"
	icon = 'icons/fallout/mobs/deathclaw.dmi'
	icon_state = "deathclaw"
	icon_living = "deathclaw"
	icon_dead = "deathclaw_dead"
	speed = 1
	move_to_delay = 1.5
	turns_per_move = 5
	response_help = "touches"
	response_disarm = "tries to push aside"
	response_harm = "hits"
	butcher_results = list(/obj/item/weapon/reagent_containers/food/snacks/meat/slab/deathclaw = 5, /obj/item/stack/sheet/animalhide/deathclaw=3)
	maxHealth = 500
	health = 500
	self_weight = 300

	ambient_sound = 'sound/f13npc/deathclaw_loop.ogg'
	sound_speak_chance = 5
	sound_speak = list('sound/f13npc/deathclaw_charge1.ogg','sound/f13npc/deathclaw_charge2.ogg','sound/f13npc/deathclaw_charge3.ogg')

	environment_smash = 3 // YOU CAN'T HIDE FROM ME
	force_threshold = 15
	faction = list("hostile", "deathclaw")
	melee_damage_lower = 25
	melee_damage_upper = 60
	aggro_vision_range = 12
	idle_vision_range = 7
	pixel_w = -16
	mob_size = MOB_SIZE_LARGE
	attacktext = "slashes"
	attack_sound = 'sound/weapons/bladeslice.ogg'