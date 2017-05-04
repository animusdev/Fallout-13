/turf/closed/wall
	name = "wall"
	desc = "A huge chunk of metal used to separate rooms."
	icon = 'icons/turf/walls/wall.dmi'
	icon_state = "wall"
	explosion_block = 1

	thermal_conductivity = WALL_HEAT_TRANSFER_COEFFICIENT
	heat_capacity = 312500 //a little over 5 cm thick , 312500 for 1 m by 2.5 m by 0.25 m plasteel wall

	var/hardness = 40 //lower numbers are harder. Used to determine the probability of a hulk smashing through.
	var/slicing_duration = 100  //default time taken to slice the wall
	var/sheet_type = /obj/item/stack/sheet/metal
	var/sheet_amount = 2
	var/girder_type = /obj/structure/girder
	var/plating_type = /turf/open/floor/plating
	var/disasemblable = 1
	var/grider = 1

	canSmoothWith = list(
	/turf/closed/wall,
	/turf/closed/wall/r_wall,
	/obj/structure/falsewall,
	/obj/structure/falsewall/brass,
	/obj/structure/falsewall/reinforced,
	/turf/closed/wall/rust,
	/turf/closed/wall/r_wall/rust,
	/turf/closed/wall/clockwork)
	smooth = SMOOTH_TRUE

/turf/closed/wall/attack_tk()
	return

/turf/closed/wall/proc/dismantle_wall(devastated=0, explode=0)
	if(devastated)
		devastate_wall()
	else
		playsound(src, 'sound/items/Welder.ogg', 100, 1)
		var/newgirder = break_wall()
		if(newgirder) //maybe we don't /want/ a girder!
			transfer_fingerprints_to(newgirder)

	for(var/obj/O in src.contents) //Eject contents!
		if(istype(O,/obj/structure/sign/poster))
			var/obj/structure/sign/poster/P = O
			P.roll_and_drop(src)

	var/turf/open/floor/F = ChangeTurf(plating_type)
	if(!F)
		return

	if(explode && prob(33))
		F.ChangeTurf(F.baseturf)

/turf/closed/wall/proc/break_wall()
	if(sheet_type)
		new sheet_type(src, sheet_amount)
	if(grider)
		return new girder_type(src)

/turf/closed/wall/proc/devastate_wall()
	if(sheet_type)
		new sheet_type(src, sheet_amount)
	if(grider)
		new /obj/item/stack/sheet/metal(src)

/turf/closed/wall/ex_act(severity, target)
	if(target == src)
		dismantle_wall(1,1)
		return
	switch(severity)
		if(1)
			take_damage(rand(100,150))
		if(2)
			take_damage(rand(30,50))
		if(3)
			take_damage(rand(5,30))
	if(!density)
		..()


/turf/closed/wall/blob_act(obj/structure/blob/B)
	..()
	take_damage(rand(10,20))

/turf/closed/wall/bullet_act(var/obj/item/projectile/Proj)
	..()
	if(Proj.damage > hardness/4)
		take_damage(Proj.damage/20)

/turf/closed/wall/mech_melee_attack(obj/mecha/M)
	M.do_attack_animation(src)
	switch(M.damtype)
		if(BRUTE)
			playsound(src, 'sound/weapons/punch4.ogg', 50, 1)
			visible_message("<span class='danger'>[M.name] has hit [src]!</span>", null, null, COMBAT_MESSAGE_RANGE)
			if(take_damage(M.force))
				playsound(src, 'sound/effects/meteorimpact.ogg', 100, 1)
		if(BURN)
			playsound(src, 'sound/items/Welder.ogg', 100, 1)
		if(TOX)
			playsound(src, 'sound/effects/spray2.ogg', 100, 1)
			return 0

/turf/closed/wall/attack_paw(mob/living/user)
	user.changeNext_move(CLICK_CD_MELEE)
	return src.attack_hand(user)


/turf/closed/wall/attack_animal(mob/living/simple_animal/M)
	M.changeNext_move(CLICK_CD_MELEE)
	M.do_attack_animation(src)
	if(M.environment_smash >= 2)
		playsound(src, 'sound/effects/bang.ogg', 50, 1)
		var/dam = rand(M.melee_damage_lower, M.melee_damage_upper)
		take_damage(dam > src.hardness/2? dam : 0)
		return

/turf/closed/wall/attack_hulk(mob/user, does_attack_animation = 0)
	..(user, 1)
	if(take_damage(rand(15,30)))
		user.say(pick(";RAAAAAAAARGH!", ";HNNNNNNNNNGGGGGGH!", ";GWAAAAAAAARRRHHH!", "NNNNNNNNGGGGGGGGHH!", ";AAAAAAARRRGH!" ))
	else
		playsound(src, 'sound/effects/bang.ogg', 50, 1)
		to_chat(user, text("<span class='notice'>You punch the wall.</span>"))
	return 1

/turf/closed/wall/attack_hand(mob/user)
	user.changeNext_move(CLICK_CD_MELEE)
	to_chat(user, "<span class='notice'>You push the wall but nothing happens!</span>")
	playsound(src, 'sound/weapons/Genhit.ogg', 25, 1)
	src.add_fingerprint(user)
	..()


/turf/closed/wall/attackby(obj/item/weapon/W, mob/user, params)
	user.changeNext_move(CLICK_CD_MELEE)
	if (!user.IsAdvancedToolUser())
		to_chat(user, "<span class='warning'>You don't have the dexterity to do this!</span>")
		return

	//get the user's location
	if(!isturf(user.loc))
		return	//can't do this stuff whilst inside objects and such

	add_fingerprint(user)

	//THERMITE related stuff. Calls src.thermitemelt() which handles melting simulated walls and the relevant effects
	if( thermite )
		if(W.is_hot())
			thermitemelt(user)
			return

	if(!disasemblable)
		return

	var/turf/T = user.loc	//get user's location for delay checks

	//the istype cascade has been spread among various procs for easy overriding
	if(try_wallmount(W,user,T) || try_decon(W,user,T) || try_destroy(W,user,T))
		return 1


/turf/closed/wall/proc/try_wallmount(obj/item/weapon/W, mob/user, turf/T)
	//check for wall mounted frames
	if(istype(W,/obj/item/wallframe))
		var/obj/item/wallframe/F = W
		if(F.try_build(src))
			F.attach(src)
		return 1
	//Poster stuff
	else if(istype(W,/obj/item/weapon/poster))
		place_poster(W,user)
		return 1

	return 0


/turf/closed/wall/proc/try_decon(obj/item/weapon/W, mob/user, turf/T)
	if( istype(W, /obj/item/weapon/weldingtool) )
		var/obj/item/weapon/weldingtool/WT = W
		if( WT.remove_fuel(0,user) )
			to_chat(user, "<span class='notice'>You begin slicing through the outer plating...</span>")
			playsound(src, W.usesound, 100, 1)
			if(do_after(user, slicing_duration*W.toolspeed, target = src))
				if(!iswallturf(src) || !user || !WT || !WT.isOn() || !T)
					return 1
				if( user.loc == T && user.get_active_held_item() == WT )
					to_chat(user, "<span class='notice'>You remove the outer plating.</span>")
					dismantle_wall()
					return 1
	else if( istype(W, /obj/item/weapon/gun/energy/plasmacutter) )
		to_chat(user, "<span class='notice'>You begin slicing through the outer plating...</span>")
		playsound(src, 'sound/items/Welder.ogg', 100, 1)
		if(do_after(user, slicing_duration*W.toolspeed, target = src))
			if(!iswallturf(src) || !user || !W || !T)
				return 1
			if( user.loc == T && user.get_active_held_item() == W )
				to_chat(user, "<span class='notice'>You remove the outer plating.</span>")
				dismantle_wall()
				visible_message("The wall was sliced apart by [user]!", "<span class='italics'>You hear metal being sliced apart.</span>")
				return 1
	return 0


/turf/closed/wall/proc/try_destroy(obj/item/weapon/W, mob/user, turf/T)
	if(istype(W, /obj/item/weapon/pickaxe/drill/jackhammer))
		var/obj/item/weapon/pickaxe/drill/jackhammer/D = W
		if(!iswallturf(src) || !user || !W || !T)
			return 1
		if( user.loc == T && user.get_active_held_item() == W )
			D.playDigSound()
			dismantle_wall()
			visible_message("<span class='warning'>[user] smashes through the [name] with the [W.name]!</span>", "<span class='italics'>You hear the grinding of metal.</span>")
			return 1
	return 0


/turf/closed/wall/proc/thermitemelt(mob/user)
	overlays = list()
	var/obj/effect/overlay/O = new/obj/effect/overlay( src )
	O.name = "thermite"
	O.desc = "Looks hot."
	O.icon = 'icons/effects/fire.dmi'
	O.icon_state = "2"
	O.anchored = 1
	O.opacity = 1
	O.density = 1
	O.layer = FLY_LAYER

	playsound(src, 'sound/items/Welder.ogg', 100, 1)

	if(thermite >= 50)
		var/burning_time = max(100,300 - thermite)
		var/turf/open/floor/F = ChangeTurf(plating_type)
		F.burn_tile()
		F.add_hiddenprint(user)
		QDEL_IN(O, burning_time)
	else
		thermite = 0
		QDEL_IN(O, 50)

/turf/closed/wall/singularity_pull(S, current_size)
	if(current_size >= STAGE_FIVE)
		take_damage(40)
		return
	if(current_size == STAGE_FOUR)
		take_damage(20)

/turf/closed/wall/narsie_act()
	if(prob(20))
		ChangeTurf(/turf/closed/wall/mineral/cult)

/turf/closed/wall/ratvar_act(force)
	. = ..()
	if(.)
		ChangeTurf(/turf/closed/wall/clockwork)

/turf/closed/wall/storage_contents_dump_act(obj/item/weapon/storage/src_object, mob/user)
	return 0

/turf/closed/wall/acid_act(acidpwr, acid_volume)
	if(explosion_block >= 2)
		acidpwr = min(acidpwr, 50) //we reduce the power so strong walls never get melted.
	. = ..()

/turf/closed/wall/acid_melt()
	dismantle_wall(1)
