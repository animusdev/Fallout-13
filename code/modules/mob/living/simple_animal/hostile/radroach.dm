/mob/living/simple_animal/hostile/radroach
	name = "Radroach"
	desc = "Great American cockroaches, colloquially called radroaches, or giant cockroaches, are giant versions of the pre-War species that have been mutated by radiation.."
	icon_state = "radroach"
	icon_living = "radroach"
	icon_dead = "radroach_d"
	icon_gib = "radroach_g"
	speak_chance = 0
	turns_per_move = 5
	response_help = "pets"
	response_disarm = "gently pushes aside"
	response_harm = "hits"
	speed = 0
	maxHealth = 20
	health = 20

	harm_intent_damage = 5
	melee_damage_lower = 20
	melee_damage_upper = 20
	attacktext = "bite"
	attack_sound = 'sound/weapons/bite.ogg'

	minbodytemp = 0
	maxbodytemp = 1500

	faction = list("radroach")