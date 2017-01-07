/obj/structure/mob_spawner
	var/max_count = 1
	name = "Not Working"
	var/curr_count = 0
	var/spawn_delay = 15
	var/self_destruct = 0
	var/mob/living/simple_animal/spawnmob
	var/mob/living/simple_animal/spawnable
	var/spawning = 1
	density = 0
	opacity = 0
	invisibility = 60
	icon = 'icons/mob/screen_gen.dmi'
	icon_state = "x"
	var/list/spawned_mobs = list()

/obj/structure/mob_spawner/New()
	..()
	Spawn()


/obj/structure/mob_spawner/proc/Spawn()
	if(!check())
		spawn(spawn_delay)
			Spawn()
		return
	if(spawning)
		spawnable = new spawnmob(loc)
		curr_count++
		spawnable.spawner = src
		spawned_mobs += spawnable
	spawn(spawn_delay)
		Spawn()
	return

/obj/structure/mob_spawner/proc/check()
	if(curr_count < max_count)
		return 1
	return 0
obj/structure/mob_spawner/proc/mob_death(var/mob/b)
	b.spawner = null
	spawned_mobs -= b
	curr_count--
	if(self_destruct && (curr_count >= 0))
		qdel(src)

/obj/structure/mob_spawner/deathclaw
	name = "Deathclaw"
	spawnmob = /mob/living/simple_animal/hostile/deathclaw
	spawn_delay = 6000
	max_count = 1
/obj/structure/mob_spawner/cazador
	name = "Cazador"
	spawnmob = /mob/living/simple_animal/hostile/cazador
	spawn_delay = 1500
	max_count = 1
/obj/structure/mob_spawner/molerat
	name = "Molerat"
	spawnmob = /mob/living/simple_animal/hostile/molerat
	spawn_delay = 300
	max_count = 1
/obj/structure/mob_spawner/gekkon
	name = "Gekkon"
	spawnmob = /mob/living/simple_animal/hostile/gekkon
	spawn_delay = 1000
	max_count = 1
/obj/structure/mob_spawner/rad_scorpion
	name = "Rad Scorpion"
	spawnmob = /mob/living/simple_animal/hostile/rad_scorpion
	spawn_delay = 6000
	max_count = 1