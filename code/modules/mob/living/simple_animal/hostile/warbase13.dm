/mob/living/simple_animal/hostile/robot
	name = "Protectron"
	desc = "Death to Wasteland."
	icon_state = "protectronWB"
	icon_living = "protectronWB"
	icon_dead = "protectronWB-d"
	icon_gib = "protectronWB"
	speak_chance = 0
	turns_per_move = 5
	response_help = "pokes"
	response_disarm = "shoves"
	response_harm = "hits"
	speed = 3
	stat_attack = 1
	robust_searching = 1
	maxHealth = 230
	health = 230
	harm_intent_damage = 5
	melee_damage_lower = 15
	melee_damage_upper = 30
	minimum_distance = 2
	retreat_distance = 2
	attacktext = "punches"
	attack_sound = 'sound/weapons/punch1.ogg'
	a_intent = "harm"
	var/weapon1
	var/weapon2
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 15
	faction = list("syndicate")
	status_flags = CANPUSH
	vision_range = 12
	aggro_vision_range = 12
	idle_vision_range = 12

/mob/living/simple_animal/hostile/robot/death(gibbed)
	..(gibbed)
	if(weapon1)
		new weapon1 (src.loc)
	if(weapon2)
		new weapon2 (src.loc)
	return

/mob/living/simple_animal/hostile/robot/ranged
	name = "Protectron"
	desc = "Pre-war type of protectron, hmmm... its really dangerous machine."
	rapid = 1
	ranged = 1
	projectiletype = /obj/item/projectile/beam/robotlaser
	projectilesound = 'sound/weapons/laser.ogg'