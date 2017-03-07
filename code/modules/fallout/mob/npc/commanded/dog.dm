/mob/living/simple_animal/hostile/commanded/dog
	name = "dog"
	desc = "A large brown bear, grown by admins for admins."

	icon_state = "husky"
	icon_living = "husky"
	icon_dead = "husky_dead"

	health = 150
	maxHealth = 150

	move_to_delay = 2

	density = 1

	response_help  = "pets"
	response_disarm = "bops"
	response_harm   = "kicks"
	speak = list("YAP", "Woof!", "Bark!", "AUUUUUU")
	speak_emote = list("barks", "woofs")
	emote_hear = list("barks!", "woofs!", "yaps.","pants.")
	emote_see = list("shakes its head.", "chases its tail.","shivers.")
	faction = list("dog")
	see_in_dark = 5
	speak_chance = 1
	turns_per_move = 10

	attacktext = "bites"
	melee_damage_lower = 15
	melee_damage_upper = 30

	known_commands = list("stay", "stop", "attack", "follow", "defend", "enemy", "friend", "pull")