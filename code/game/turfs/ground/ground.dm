
/turf/ground
	icon = 'icons/turf/floors3.dmi'
	name = "\proper ground"
	icon_state = "wasteland1"
	intact = 1
	temperature = T20C
	oxygen = MOLES_O2STANDARD
	nitrogen = MOLES_N2STANDARD
	smooth = SMOOTH_TRUE
	var/sun_light
	var/open_space = 1

turf/ground/New()
	..()
	var/area/area = src.loc
	if(area && area.open_space)
		open_space = 1
		sun_light = SSsun.global_sun_light
	else
		open_space = 0
		sun_light = 0
/turf/ground/Destroy()
	return QDEL_HINT_LETMELIVE

/turf/ground/proc/update_sunlight()
	var/lum = 0
	if(sun_light && open_space)
		for(var/turf/T in RANGE_TURFS(1,src))
			if(istype(T,/turf/simulated))
				lum = 1
				break
			else if(istype(T,/turf/ground))
				var/turf/ground/g = T
				if(g.open_space)
					lum = 1
					break
	if(lum)
		SetLuminosity(sun_light,0)
		return
	SetLuminosity(0)

/turf/ground/return_air()
	var/datum/gas_mixture/GM = new

	GM.oxygen = oxygen
	GM.carbon_dioxide = carbon_dioxide
	GM.nitrogen = nitrogen
	GM.toxins = toxins

	GM.temperature = temperature

	return GM
/turf/ground/attack_paw(mob/user)
	return src.attack_hand(user)

/turf/ground/attackby(obj/item/C, mob/user, params)
	if(istype(C,/obj/item/stack/tile/plasteel))
		var/obj/item/stack/tile/plasteel/S = C
		if(S.use(1))
			playsound(src, 'sound/weapons/Genhit.ogg', 50, 1)
			user << "<span class='notice'>You build a floor.</span>"
			ChangeTurf(/turf/simulated/floor/plating)
		else
			user << "<span class='warning'>You need one floor tile to build a floor!</span>"

/turf/ground/ChangeTurf(var/path)
	var/bt = src.type
	var/bti = icon_state
	var/btd = dir

	var/turf/t = ..()

	smooth_icon_neighbors(src)
	src.fullUpdateMineralOverlays(src)
	t.baseturf = bt
	t.baseturf_icon = bti
	t.baseturf_dir = btd
///turf/ground/Entered(atom/movable/A)
//	..()

/turf/ground/handle_slip()
	return

/turf/ground/singularity_act()
	return

/turf/ground/init_lighting()
	..()
	update_sunlight()

/turf/ground/can_have_cabling()
	return 1

/turf/ground/desert
	name = "\proper desert"
	icon_state = "desert1"
	slowdown = 2
	//PIT
	var/turf_type = /turf/ground/desert
	var/dug = 0
	var/storedindex = 0
	var/mob/living/gravebody
	var/obj/structure/closet/coffin/gravecoffin
	var/pitcontents = list()
	var/obj/dugpit/ground/mypit
	var/unburylevel = 0
	//////
/turf/ground/desert/New()
	..()
	icon_state = "wasteland[rand(1,31)]"

/turf/ground/road
	name = "\proper road"
	icon_state = "outermiddle"

/turf/ground/mountain
	icon = 'icons/turf/floors2.dmi'
	name = "\proper mountain"
	icon_state = "mountain0"
	sun_light = 0
	open_space = 0

/turf/ground/mountain/New()
	icon_state = "mountain[rand(1,10)]"