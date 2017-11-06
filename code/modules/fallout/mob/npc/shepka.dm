//Fallout 13 - memorial to human cruelty.

/mob/living/simple_animal/hostile/doggo
	name = "Doggo"
	desc = "A nice dog. Real friend for any human."
	icon = 'icons/fallout/mobs/animal.dmi'
	icon_state = "shepherd"
	icon_living = "shepherd"
	icon_dead = "shepherd_dead"
	icon_gib = "gib"
	turns_per_move = 1
	response_help = "pets"
	response_disarm = "pushes aside"
	response_harm = "kicks"
	butcher_results = list(/mob/living/simple_animal/hostile/megafauna/colossus = 1)
	maxHealth = 100
	health = 100
	self_weight = 5

	faction = list("city", "ncr")

	sound_speak_chance = 5
	sound_speak = list('sound/f13npc/dog_charge1.ogg','sound/f13npc/dog_charge2.ogg','sound/f13npc/dog_charge3.ogg')

	aggro_sound_chance = 50
	aggro_sound = list('sound/f13npc/dog_alert1.ogg','sound/f13npc/dog_alert2.ogg','sound/f13npc/dog_alert3.ogg')

	environment_smash = 0
	melee_damage_lower = 5
	melee_damage_upper = 25
	aggro_vision_range = 10 //I SEE EVERYTHING
	idle_vision_range = 10
	attacktext = "Woof!"
	attack_sound = 'sound/weapons/bite.ogg'
	move_to_delay = 1
