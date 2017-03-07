/proc/playsound(atom/source, soundin, vol as num, vary, extrarange as num, falloff, surround = 1)

	soundin = get_sfx(soundin) // same sound for everyone

	if(isarea(source))
		throw EXCEPTION("playsound(): source is an area")
		return

	var/frequency = get_rand_frequency() // Same frequency for everybody
	var/turf/turf_source = get_turf(source)
	var/volume
	var/distance
	var/range = world.view + extrarange
 	// Looping through the player list has the added bonus of working for mobs inside containers
	for (var/P in player_list)
		var/mob/M = P
		if(!M || !M.client)
			continue
		var/turf/T = get_turf(M)
		distance = get_dist(T, turf_source)
		if(distance <= range)
			if(T && T.z == turf_source.z)
				volume = vol * (1 - distance/range) * M.client.prefs.sounds_volume
				M.playsound_local(turf_source, soundin, volume, vary, frequency, falloff, surround)


/atom/proc/playsound_local(turf/turf_source, soundin, vol as num, vary, frequency, falloff, surround = 1, environment = -1, channel = 0, status = 0, repeat = 0)
	soundin = get_sfx(soundin)

	var/sound/S = sound(soundin)
	S.wait = 0 //No queue
	S.channel = channel
	S.volume = vol

	var/area/A = get_area(src)
	if(environment == -1 && A)
		environment = A.environment

	S.environment = environment

	S.repeat = repeat

	S.status = status

	if (vary)
		if(frequency)
			S.frequency = frequency
		else
			S.frequency = get_rand_frequency()

	if(isturf(turf_source))
		var/turf/T = get_turf(src)
/*
		//Atmosphere affects sound
		var/pressure_factor = 1
		var/datum/gas_mixture/hearer_env = T.return_air()
		var/datum/gas_mixture/source_env = turf_source.return_air()

		if(hearer_env && source_env)
			var/pressure = min(hearer_env.return_pressure(), source_env.return_pressure())
			if(pressure < ONE_ATMOSPHERE)
				pressure_factor = max((pressure - SOUND_MINIMUM_PRESSURE)/(ONE_ATMOSPHERE - SOUND_MINIMUM_PRESSURE), 0)
		else //space
			pressure_factor = 0

		var/distance = get_dist(T, turf_source)
		if(distance <= 1)
			pressure_factor = max(pressure_factor, 0.15) //touching the source of the sound

		S.volume *= pressure_factor
		//End Atmosphere affecting sound
*/
		// 3D sounds, the technology is here!
		if(T != src.loc)

			// Find the player's view resolution and set the falloff point to the edge
			// of the client's screen.
			var/x = findtext(world.view, "x")
			S.falloff = x ? copytext(world.view, 1, x) : world.view

			// Change 'layer' to another variable if an altitude variable is used.
			S.x = T.x - src.x
			var/sy = T.y - src.y
			var/sz = T.layer - src.layer
			S.y = (sy + sz) * 0.707106781187
			S.z = (sy - sz) * 0.707106781187

	to_chat(src, S)

/mob/playsound_local(turf/turf_source, soundin, vol as num, vary, frequency, falloff, surround = 1, environment = -1, channel = 0, status, repeat = 0)
	if(!client || ear_deaf > 0)
		return
	if(dizziness >= 5)
		environment = 24
	else if(druggy >= 10)
		environment = 23
	..()

/mob/proc/stopLobbySound()
	client.sound_system.MusicFade(null, 0, 100)

/client/proc/playtitlemusic()
	if(!ticker || !ticker.login_music)
		return
	if(prefs && (prefs.toggles & SOUND_LOBBY))
		sound_system.PlayMusic(ticker.login_music)

/proc/get_rand_frequency()
	return rand(32000, 55000) //Frequency stuff only works with 45kbps oggs.

/proc/get_sfx(soundin)
	if(istext(soundin))
		switch(soundin)
			if ("shatter")
				soundin = pick('sound/effects/Glassbr1.ogg','sound/effects/Glassbr2.ogg','sound/effects/Glassbr3.ogg')
			if ("explosion")
				soundin = pick('sound/effects/Explosion1.ogg','sound/effects/Explosion2.ogg')
			if ("bigexplosion")
				soundin = pick('sound/f13effects/explosion_1.ogg','sound/f13effects/explosion_2.ogg')
			if ("explosion_far")
				soundin = pick('sound/f13effects/explosion_distant_1.ogg','sound/f13effects/explosion_distant_2.ogg', 'sound/f13effects/explosion_distant_3.ogg','sound/f13effects/explosion_distant_4.ogg')
			if ("sparks")
				soundin = pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg','sound/effects/sparks4.ogg')
			if ("rustle")
				soundin = pick('sound/effects/rustle1.ogg','sound/effects/rustle2.ogg','sound/effects/rustle3.ogg','sound/effects/rustle4.ogg','sound/effects/rustle5.ogg')
			if ("bodyfall")
				soundin = pick('sound/effects/bodyfall1.ogg','sound/effects/bodyfall2.ogg','sound/effects/bodyfall3.ogg','sound/effects/bodyfall4.ogg')
			if ("punch")
				soundin = pick('sound/weapons/punch1.ogg','sound/weapons/punch2.ogg','sound/weapons/punch3.ogg','sound/weapons/punch4.ogg')
			if ("clownstep")
				soundin = pick('sound/effects/clownstep1.ogg','sound/effects/clownstep2.ogg')
			if ("swing_hit")
				soundin = pick('sound/weapons/genhit1.ogg','sound/weapons/genhit2.ogg','sound/weapons/genhit3.ogg')
			if ("hiss")
				soundin = pick('sound/voice/hiss1.ogg','sound/voice/hiss2.ogg','sound/voice/hiss3.ogg','sound/voice/hiss4.ogg')
			if ("pageturn")
				soundin = pick('sound/effects/pageturn1.ogg','sound/effects/pageturn2.ogg','sound/effects/pageturn3.ogg')
			if ("gunshot")
				soundin = pick('sound/weapons/Gunshot.ogg','sound/weapons/Gunshot2.ogg','sound/weapons/Gunshot3.ogg','sound/weapons/Gunshot4.ogg')
			if ("10mmfire")
				soundin = pick('sound/f13weapons/10mm_fire_01.ogg','sound/f13weapons/10mm_fire_02.ogg','sound/f13weapons/10mm_fire_03.ogg')
			if ("harmonica")
				soundin = pick('sound/harmonica/fharp1.ogg','sound/harmonica/fharp2.ogg','sound/harmonica/fharp3.ogg','sound/harmonica/fharp4.ogg','sound/harmonica/fharp5.ogg','sound/harmonica/fharp6.ogg','sound/harmonica/fharp7.ogg','sound/harmonica/fharp8.ogg')
			if ("krotchy")
				soundin = pick('sound/f13items/k_daddysaidonly.wav','sound/f13items/k_donttouchme.wav','sound/f13items/k_mommysaiddont.wav')
			if ("ricochet")
				soundin = pick(	'sound/weapons/effects/ric1.ogg','sound/weapons/effects/ric2.ogg','sound/weapons/effects/ric3.ogg','sound/weapons/effects/ric4.ogg','sound/weapons/effects/ric5.ogg')
			if ("terminal_type")
				soundin = pick('sound/machines/terminal_button01.ogg','sound/machines/terminal_button02.ogg','sound/machines/terminal_button03.ogg', \
								'sound/machines/terminal_button04.ogg','sound/machines/terminal_button05.ogg','sound/machines/terminal_button06.ogg', \
								'sound/machines/terminal_button07.ogg','sound/machines/terminal_button08.ogg')
			if ("footsteps")
				soundin = pick ('sound/effects/footsteps/footsteps.ogg', 'sound/effects/footsteps/footsteps2.ogg')
			if ("erikafootsteps")
				soundin = pick('sound/effects/footsteps/tile1.wav','sound/effects/footsteps/tile2.wav')
			if ("grassfootsteps")
				soundin = pick('sound/effects/footsteps/grass/grass1.wav','sound/effects/footsteps/grass/grass2.wav','sound/effects/footsteps/grass/grass3.wav','sound/effects/footsteps/grass/grass4.wav')
			if ("dirtfootsteps")
				soundin = pick('sound/effects/footsteps/dirt/dirt1.wav','sound/effects/footsteps/dirt/dirt2.wav','sound/effects/footsteps/dirt/dirt3.wav','sound/effects/footsteps/dirt/dirt4.wav')
			if ("waterfootsteps")
				soundin = pick('sound/effects/footsteps/water/slosh1.wav','sound/effects/footsteps/water/slosh2.wav','sound/effects/footsteps/water/slosh3.wav','sound/effects/footsteps/water/slosh4.wav')
			if ("sandfootsteps")
				soundin = pick('sound/effects/footsteps/sand/sand_step1.ogg','sound/effects/footsteps/sand/sand_step2.ogg','sound/effects/footsteps/sand/sand_step3.ogg','sound/effects/footsteps/sand/sand_step4.ogg','sound/effects/footsteps/sand/sand_step5.ogg','sound/effects/footsteps/sand/sand_step6.ogg','sound/effects/footsteps/sand/sand_step7.ogg','sound/effects/footsteps/sand/sand_step8.ogg')
			if ("woodfootsteps")
				soundin = pick('sound/effects/footsteps/wood/wood_step1.ogg','sound/effects/footsteps/wood/wood_step2.ogg','sound/effects/footsteps/wood/wood_step3.ogg','sound/effects/footsteps/wood/wood_step4.ogg','sound/effects/footsteps/wood/wood_step5.ogg','sound/effects/footsteps/wood/wood_step6.ogg','sound/effects/footsteps/wood/wood_step7.ogg','sound/effects/footsteps/wood/wood_step8.ogg')
			if ("carpetfootsteps")
				soundin = pick('sound/effects/footsteps/carpet/carpet_step1.ogg','sound/effects/footsteps/carpet/carpet_step2.ogg','sound/effects/footsteps/carpet/carpet_step3.ogg','sound/effects/footsteps/carpet/carpet_step4.ogg','sound/effects/footsteps/carpet/carpet_step5.ogg','sound/effects/footsteps/carpet/carpet_step6.ogg','sound/effects/footsteps/carpet/carpet_step7.ogg','sound/effects/footsteps/carpet/carpet_step8.ogg')
	return soundin

/proc/playsound_global(file, repeat=0, wait, channel, volume)
	for(var/V in clients)
		to_chat(V, sound(file, repeat, wait, channel, volume))
