/* In this file:
 * Wood floor
 * Grass floor
 * Carpet floor
 */

/turf/simulated/floor/wood
	icon = 'icons/turf/floors/wood.dmi'
	icon_state = "wood1"
	floor_tile = /obj/item/stack/tile/wood
	broken_states = list("wood-b1","wood-b2","wood-b3","wood-b4")

/turf/simulated/floor/wood/New()
	..()
	icon = 'icons/turf/floors/wood.dmi' // REMOVE IT WHEN MAP FIX
	if(!broken && !burnt)
		icon_state = "wood[rand(1,3)]"

/turf/simulated/floor/wood/attackby(obj/item/C, mob/user, params)
	if(..())
		return
	if(istype(C, /obj/item/weapon/screwdriver))
		if(broken || burnt)
			return
		user << "<span class='danger'>You unscrew the planks.</span>"
		new floor_tile(src)
		make_plating()
		playsound(src, 'sound/items/Screwdriver.ogg', 80, 1)
		return

/turf/simulated/floor/wood/broken
	icon_state = "wood-b"
	broken = 1

/turf/simulated/floor/wood/broken/New()
	..()
	if(icon_state != "wood-b")
		icon_state = pick(broken_states)

/turf/simulated/floor/grass
	name = "Grass patch"
	icon_state = "grass"
	floor_tile = /obj/item/stack/tile/grass
	broken_states = list("sand")

/turf/simulated/floor/grass/New()
	..()
	spawn(1)
		update_icon()
/*
/turf/simulated/floor/grass/attackby(obj/item/C, mob/user, params)
	if(..())
		return
	if(istype(C, /obj/item/weapon/shovel))
		new /obj/item/weapon/ore/glass(src)
		new /obj/item/weapon/ore/glass(src) //Make some sand if you shovel grass
		user << "<span class='notice'>You shovel the grass.</span>"
		make_plating()
*/
/turf/simulated/floor/carpet
	name = "Carpet"
	icon = 'icons/turf/floors/carpet.dmi'
	icon_state = "carpet"
	floor_tile = /obj/item/stack/tile/carpet
	broken_states = list("damaged")
	smooth = SMOOTH_TRUE
	canSmoothWith = null

/turf/simulated/floor/carpet/New()
	..()
	spawn(1)
		update_icon()

/turf/simulated/floor/carpet/update_icon()
	if(!..())
		return 0
	if(!broken && !burnt)
		if(smooth)
			smooth_icon(src)
	else
		make_plating()
		if(smooth)
			smooth_icon_neighbors(src)

/turf/simulated/floor/carpet/break_tile()
	broken = 1
	update_icon()

/turf/simulated/floor/carpet/burn_tile()
	burnt = 1
	update_icon()



/turf/simulated/floor/fakespace
	icon = 'icons/turf/space.dmi'
	icon_state = "0"
	floor_tile = /obj/item/stack/tile/fakespace
	broken_states = list("damaged")

/turf/simulated/floor/fakespace/New()
	..()
	icon_state = "[rand(0,25)]"