/mob/living/simple_animal/hostile/ghoul
	name = "Feral Ghoul"
	desc = "necrotic post-humans, are decrepit, rotting, zombie-like mutants."
	icon_state = "feralghoul"
	icon_living = "feralghoul"
	icon_dead = "feralghoul_d"
	icon_gib = "feralghoul_g"
	speak_chance = 0
	turns_per_move = 5
	response_help = "hugs"
	response_disarm = "gently pushes aside"
	response_harm = "hits"
	speed = 0
	maxHealth = 60
	health = 60

	harm_intent_damage = 10
	melee_damage_lower = 20
	melee_damage_upper = 20
	attacktext = "scratche"
	attack_sound = 'sound/weapons/bite.ogg'

	minbodytemp = 0
	maxbodytemp = 1500

	faction = list("ghoul")
	gold_core_spawnable = 1

/mob/living/simple_animal/hostile/ghoul/glowing
	name = "Glowing Feral Ghoul"
	desc = "necrotic post-humans, are decrepit, rotting, zombie-like mutants."
	icon_state = "glowinghoul"
	icon_living = "glowinghoul"
	icon_dead = "glowinghoul_d"
	icon_gib = "glowinghoul_g"
	maxHealth = 100
	health = 100
	harm_intent_damage = 15
	melee_damage_lower = 20
	melee_damage_upper = 20

/mob/living/simple_animal/hostile/ghoul/glowing/New()
	..()
	SetLuminosity(1)