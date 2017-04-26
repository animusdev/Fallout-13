var/stormactive=0
proc/sandstorm(var/position)
	for(var/area/A in world) //block(locate(1,1,1),locate(250,250,1)))
		if(A.outdoors && !stormactive)
			for(var/mob/M in view(10,A))
				M << sound('sound/f13effects/sandstorm_warning.ogg')
				spawn(600)
					lightingsandloop(A,M)
					stormactive=1
					M << sound('sound/f13effects/thunder_distant_1.ogg')
					spawn(400)
						M << sound('sound/f13effects/thunder_distant_2.ogg')
						spawn(200)
							M << sound('sound/f13effects/sandstorm_transition.ogg')
							spawn(80)
								M << sound('sound/f13effects/sandstorm_loop.ogg')
								spawn(6000)
									M << sound('sound/f13effects/sandstorm_transition.ogg')
									spawn(200)
										M << sound('sound/f13effects/thunder_distant_1.ogg')
										return(1)


proc/lightingsandloop(var/area/A,var/mob/M)
	if(A.outdoors)
		lightningstrike(A,M)
		spawn(600)
			lightningstrike(A,M)
			spawn(600)
				lightningstrike(A,M)
				spawn(600)
					lightningstrike(A,M)
					spawn(600)
						lightningstrike(A,M)
						spawn(600)
							lightningstrike(A,M)
							spawn(600)
								lightningstrike(A,M)
								spawn(600)
									lightningstrike(A,M)
									spawn(600)
										lightningstrike(A,M)
										spawn(600)
											lightningstrike(A,M)
											spawn(600)
												lightningstrike(A,M)
proc/lightningstrike(var/area/A,var/mob/M,var/turf/T,var/L)
	if(A.outdoors)
		var/list/ls=pick('sound/f13effects/thunder_1.ogg','sound/f13effects/thunder_2.ogg','sound/f13effects/thunder_3.ogg','sound/f13effects/thunder_4.ogg')
		for(T in view(1,A))
			T.overlays+='icons/effects/224x224.dmi'
			spawn(25)
				T.overlays-='icons/effects/224x224.dmi'
			for(M in view(7,T))
				M << sound(ls)
				for(M in view(1,T))
					if(M.client)
						M << "You have been hit by lightning stopping your heart."
					M.death()
				spawn(1)
					return

proc/dodaychange()
	day+=1
	if(day>=31)
		month+=1
		day=1

