//Fallout 13 eyebot directory

/mob/living/simple_animal/hostile/eyebot
	name = "protectron"
	desc = "A pre-War type of protectron.<br>It's a really dangerous machine."
	icon_state = "eyebot"
	icon_living = "eyebot"
	icon_dead = "eyebot_d"
	icon_gib = "eyebot_d"
	icon = 'icons/fallout/mobs/animal.dmi'
	speak_chance = 0
	turns_per_move = 6
	environment_smash = 0
	response_help = "touches"
	response_disarm = "shoves"
	response_harm = "hits"
	move_to_delay = 0.5
	stat_attack = 1
	robust_searching = 1
	maxHealth = 70
	health = 70
	self_weight = 50

	ambient_sound = 'sound/f13npc/eyebot_loop.ogg'
	sound_speak_chance = 5
	sound_speak = list('sound/machines/buzz-sigh.ogg','sound/misc/interference.ogg')

	aggro_sound_chance = 50
	aggro_sound = 'sound/misc/interference.ogg'

	death_sound = 'sound/f13npc/robot_death.ogg'

	harm_intent_damage = 10
	melee_damage_lower = 2
	melee_damage_upper = 3
	minimum_distance = 6
	retreat_distance = 14
	attacktext = "punches"
	attack_sound = "punch"
	a_intent = "harm"
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 15
	faction = list("hostile", "enclave")
	status_flags = CANPUSH
	vision_range = 12
	aggro_vision_range = 12
	idle_vision_range = 7
	ranged = 1
	projectiletype = /obj/item/projectile/beam
	projectilesound = 'sound/misc/splort.ogg'