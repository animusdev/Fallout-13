proc/respawn_mob()
	for(var/area/A in world)
		if(mob_list.len>0)// && ispath(get_turf(A), /turf/open/) /Gargule (damn shit, it's a kostil`)
			var/mob/living/carbon/human/H
			var/mob/living/simple_animal/hostile/HS

			if(ispath(A, /area/f13/wasteland))
				if(H in range(25) && !(H in range(10)) && !(HS in range(10)))
					var/random = rand(1,100)
					switch(random)
						if(1 to 10)
							spawn_ghoul(3, A)
						if(11 to 50)
							spawn_radscorp(3,A)
						if(41 to 90)
							spawn_bigscorp(2,A)
						if(91 to 100)
							spawn_radroach(3,A)

			if(ispath(A, /area/f13/forest))
				if(H in range(25) && !(H in range(10)) && !(HS in range(10)))
					var/random = rand(1,100)
					switch(random)
						if(1 to 40)
							spawn_cazador(2,A)
							spawn_molerat(1,A)
						if(41 to 95)
							spawn_molerat(3,A)
							spawn_cazador(1,A)
						if(96 to 100)
							spawn_supermutant(1,A)

			if(ispath(A, /area/f13/building))
				if(!(H in range(10)) && !(HS in range(10)))
					var/random = rand(1,100)
					switch(random)
						if(1 to 50)
							spawn_ghoul(3,A)
						if(51 to 80)
							spawn_radghoul(1,A)
							spawn_ghoul(1,A)
						if(81 to 100)
							spawn_radscorp(1,A)

			if(ispath(A, /area/f13/bunker))
				if(!(H in range(10)) && !(HS in range(10)))
					var/random = rand(1,100)
					switch(random)
						if(1 to 20)
							spawn_radghoul(2,A)
						if(21 to 40)
							spawn_bigscorp(2,A)
						if(41 to 70)
							spawn_radscorp(3,A)
						if(71 to 80)
							spawn_molerat(3,A)
						if(81 to 95)
							spawn_radroach(4,A)
						if(96 to 100)
							spawn_supermutant(2,A)

			if(ispath(A, /area/f13/tunnel))
				if(!(H in range(10)) && !(HS in range(10)))
					var/random = rand(1,100)
					switch(random)
						if(1 to 60)
							spawn_molerat(2,A)
						if(61 to 100)
							spawn_ghoul(1,A)

			if(ispath(A, /area/f13/ruins))
				if(!(H in range(10)) && !(HS in range(10)))
					var/random = rand(1,100)
					switch(random)
						if(1 to 40)
							spawn_radroach(3,A)
						if(41 to 70)
							spawn_molerat(2,A)
						if(71 to 95)
							spawn_ghoul(2,A)
						if(96 to 100)
							spawn_supermutant(1,A)

			if(ispath(A, /area/f13/clinic))
				if(!(H in range(10)) && !(HS in range(10)))
					var/random = rand(1,100)
					switch(random)
						if(1 to 60)
							spawn_supermutant(2,A)
						if(61 to 90)
							spawn_ghoul(4,A)
							spawn_radghoul(1,A)
						if(91 to 100)
							spawn_deathclaw(1,A)


			if(ispath(A, /area/f13/office))
				if(!(H in range(10)) && !(HS in range(10)))
					var/random = rand(1,100)
					switch(random)
						if(1 to 60)
							spawn_ghoul(3,A)
						if(61 to 80)
							spawn_radroach(3,A)
						if(81 to 100)
							spawn_radscorp(2,A)

			if(ispath(A, /area/f13/caves))
				if(!(H in range(10)) && !(HS in range(10)))
					var/random = rand(1,100)
					switch(random)
						if(1 to 40)
							spawn_molerat(3,A)
						if(41 to 85)
							spawn_radroach(4,A)
						if(86 to 95)
							spawn_supermutant(1,A)
						if(96 to 100)
							spawn_deathclaw(1,A)

			if(ispath(A, /area/f13/radiation))
				if(!(H in range(10)) && !(HS in range(10)))
					var/random = rand(1,100)
					switch(random)
						if(1 to 60)
							spawn_ghoul(3, A)
							spawn_radghoul(1, A)
						if(61 to 100)
							spawn_radghoul(2,A)
							spawn_ghoul(1,A)

proc/spawn_radroach(var/amount = 1, var/Loc)
	var/i
	for(i = 0, i < amount, i++)
		var/mob/living/simple_animal/hostile/radroach/G = new(Loc)
		G.health = G.maxHealth //:/

proc/spawn_ghoul(var/amount = 1, var/Loc)
	var/i
	for(i = 0, i < amount, i++)
		var/mob/living/simple_animal/hostile/ghoul/G = new(Loc)
		G.health = G.maxHealth//:/

proc/spawn_radghoul(var/amount = 1, var/Loc)
	var/i
	for(i = 0, i < amount, i++)
		var/mob/living/simple_animal/hostile/ghoul/glowing/G = new(Loc)
		G.health = G.maxHealth//:/

proc/spawn_molerat(var/amount = 1, var/Loc)
	var/i
	for(i = 0, i < amount, i++)
		var/mob/living/simple_animal/hostile/molerat/G = new(Loc)
		G.health = G.maxHealth//:/

proc/spawn_cazador(var/amount = 1, var/Loc)
	var/i
	for(i = 0, i < amount, i++)
		var/mob/living/simple_animal/hostile/cazador/G = new(Loc)
		G.health = G.maxHealth//:/

proc/spawn_radscorp(var/amount = 1, var/Loc)
	var/i
	for(i = 0, i < amount, i++)
		var/mob/living/simple_animal/hostile/rad_scorpion/G = new(Loc)
		G.health = G.maxHealth//:/

proc/spawn_bigscorp(var/amount = 1, var/Loc)
	var/i
	for(i = 0, i < amount, i++)
		var/mob/living/simple_animal/hostile/rad_scorpion/black/G = new(Loc)
		G.health = G.maxHealth//:/

proc/spawn_supermutant(var/amount = 1, var/Loc)
	var/i
	for(i = 0, i < amount, i++)
		var/mob/living/simple_animal/hostile/supermutant/G = new(Loc)
		G.health = G.maxHealth//:/

proc/spawn_deathclaw(var/amount = 1, var/Loc)
	var/i
	for(i = 0, i < amount, i++)
		var/mob/living/simple_animal/hostile/deathclaw/G = new(Loc)
		G.health = G.maxHealth//:/
