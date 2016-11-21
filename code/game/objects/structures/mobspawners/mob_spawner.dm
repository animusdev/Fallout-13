/obj/structure/mob_spawner
	var/max_count = 5
	var/curr_count = 0
	var/spawn_delay = 1500
	var/next_spawn = 0
	var/last_spawner = 0
	var/self_destruct = 0
	var/mob/living/simple_animal/spawnmob
	density = 0
	opacity = 0
	invisibility = 0
	icon = 'icons/mob/screen_gen.dmi'
	icon_state = ""
	var/list/spawned_mobs = list()

/obj/structure/mob_spawner/New()
			Spawn()
			next_spawn = world.time + spawn_delay
			SSMOBSPAWNER.ass_spawner(src)
/obj/structure/mob_spawner/Destroy()
			SSMOBSPAWNER.rem_spawner(src)
			qdel(src)


/obj/structure/mob_spawner/proc/Spawn()
	var/mob/living/simple_animal/mob = new spawnmob(loc)
	curr_count++
	mob.spawner = src
	spawned_mobs += mob
	next_spawn = world.time + spawn_delay
/obj/structure/mob_spawner/proc/check()
	if((curr_count <= max_count) && (world.time >= next_spawn))
		for(var/mob/A in range(10))
			if(!istype(spawnmob))
				return
		return 1
	return 0
obj/structure/mob_spawner/proc/mob_death(var/mob/b)
	b.spawner = null
	spawned_mobs -= b
	curr_count--
	if(self_destruct && (curr_count >= max_count))
		qdel(src)
	else
		curr_count = 0

/obj/structure/mob_spawner/deathclaw
	spawnmob = /mob/living/simple_animal/hostile/deathclaw
	spawn_delay = 6000
	max_count = 1
/obj/structure/mob_spawner/cazador
	spawnmob = /mob/living/simple_animal/hostile/cazador
	spawn_delay = 1500
	max_count = 5
/obj/structure/mob_spawner/molerat
	spawnmob = /mob/living/simple_animal/hostile/molerat
	spawn_delay = 300
	max_count = 10
/obj/structure/mob_spawner/gekkon
	spawnmob = /mob/living/simple_animal/hostile/gekkon
	spawn_delay = 1000
	max_count = 20
/obj/structure/mob_spawner/rad_scorpion
	spawnmob = /mob/living/simple_animal/hostile/rad_scorpion
	spawn_delay = 2000
	max_count = 20