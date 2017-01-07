//functions for digging pits in the ground and storing stuff in it
#define NUMCONTENT 5
#define NUMBURYTIMES 3

/obj/dugpit
	name = "Pit"
	anchored = 1
	icon = 'icons/obj/Pit.dmi'
	mouse_opacity = 0
	var/turf/simulated/floor/plating/asteroid/parent

obj/dugpit/New(lnk)
	..()
	parent = lnk

/obj/dugpit/proc/dugresist(usr)
	//try to unbury self
	var/mob/living/user = usr
	user << "<span class='danger'>You start digging from inside, trying to unbury self!</span>"
	if(do_after(user, (5*10), target = src))
		if (prob(10))
			user << "<span class='danger'>You have managed to move some of the ground!</span>"
			parent.unburylevel++
			if (parent.unburylevel>=NUMBURYTIMES)
				user << "<span class='danger'>You have undug yourself!</span>"
				parent.gets_dug(null)
		else
			user << "<span class='danger'>The ground is too heavy!</span>"

/obj/dugpit/return_air()
	var/datum/gas_mixture/GM = new

	GM.oxygen = 0
	GM.carbon_dioxide = 0
	GM.nitrogen = 0
	GM.toxins = 0

	GM.temperature = parent.temperature

	return GM


/turf/simulated/floor/plating/asteroid //floor piece
	name = "Asteroid"
	baseturf = /turf/simulated/floor/plating/asteroid
	icon = 'icons/turf/floors.dmi'
	icon_state = "asteroid"
	icon_plating = "asteroid"
	var/environment_type = "asteroid"
	var/turf_type = /turf/simulated/floor/plating/asteroid //Because caves do whacky shit to revert to normal
	var/dug = 0       //0 = has not yet been dug, 1 = has already been dug
	var/storedindex = 0 //amount of stored items
	var/mob/living/gravebody //is there a body in the pit?
	var/obj/structure/closet/coffin/gravecoffin //or maybe a coffin?
	var/pitcontents = list()
	var/obj/dugpit/mypit
	var/unburylevel = 0

/turf/simulated/floor/plating/asteroid/proc/handle_item_insertion(obj/item/W, mob/usr)
	if(!istype(W))
		return
	if (storedindex>=NUMCONTENT)
		usr << "<span class='danger'>The pit is filled with items to the limit!</span>"
		return
	if(usr)
		if(!usr.unEquip(W))
			return
	if(usr)
		if(usr.client && usr.s_active != src)
			usr.client.screen -= W

		add_fingerprint(usr)

		if(!istype(W, /obj/item/weapon/gun/energy/kinetic_accelerator/crossbow))
			for(var/mob/M in viewers(usr, null))
				if(M == usr)
					usr << "<span class='notice'>You put [W] in the hole.</span>"
				else if(in_range(M, usr)) //If someone is standing close enough, they can tell what it is...
					M.show_message("<span class='notice'>[usr] puts [W] in the hole.</span>", 1)
				else if(W && W.w_class >= 3) //Otherwise they can only see large or normal items from a distance...
					M.show_message("<span class='notice'>[usr] puts [W] in the hole.</span>", 1)
		pitcontents += W
		W.loc = mypit
		storedindex = storedindex+1

/turf/simulated/floor/plating/asteroid/attack_hand(mob/living/carbon/human/M)
	if (dug)
		if (storedindex==0)
			usr << "<span class='danger'>There is nothing in the pit!</span>"
			return
		else
			var/obj/item/I = pitcontents[storedindex]
			storedindex = storedindex - 1
			I.loc = M.loc
			pitcontents-=I

/turf/simulated/floor/plating/asteroid/proc/finishBury(mob/user)
	user << "<span class='notice'>You cover the hole with dirt.</span>"
	dug = 0
	icon_plating = "[environment_type]"
	icon_state = "[environment_type]"
	mypit.invisibility = 101

/turf/simulated/floor/plating/asteroid/proc/finishBody()
	gravebody.loc = mypit
	unburylevel = 0

/turf/simulated/floor/plating/asteroid/proc/finishCoffin()
	gravecoffin.loc = mypit

/turf/simulated/floor/plating/asteroid/attackby(obj/item/W, mob/user, params)
	//note that this proc does not call ..()
	if(!W || !user)
		return 0
	var/digging_speed = 0
	if (istype(W, /obj/item/weapon/shovel))
		var/obj/item/weapon/shovel/S = W
		digging_speed = S.digspeed
	else if (istype(W, /obj/item/weapon/pickaxe))
		var/obj/item/weapon/pickaxe/P = W
		digging_speed = P.digspeed
	if (digging_speed)
		var/turf/T = user.loc
		if (!( istype(T, /turf) ))
			return
		if (dug)
			for (var/mob/living/mobongrave in mypit.loc)
				//bury the first one
				gravebody = mobongrave
				break
			for (var/obj/structure/closet/coffin/curcoffin in mypit.loc)
				if (!curcoffin.opened)
					gravecoffin = curcoffin
					break
			playsound(src, 'sound/effects/shovel_dig.ogg', 50, 1)
			if (gravebody!=null)
				user << "<span class='notice'>You start covering the body in the hole with dirt...</span>"
				if (do_after(user, digging_speed*3, target=gravebody))
					if(istype(src, /turf/simulated/floor/plating/asteroid))
						finishBury(user)
						finishBody()
			else if (gravecoffin != null)
				user << "<span class='notice'>You start burying the coffin...</span>"
				if (do_after(user, digging_speed*1.5, target=gravebody))
					if(istype(src, /turf/simulated/floor/plating/asteroid))
						finishBury(user)
						finishCoffin()
			else
				user << "<span class='notice'>You start covering the hole with dirt...</span>"
				if(do_after(user, digging_speed, target = src))
					if(istype(src, /turf/simulated/floor/plating/asteroid))
						finishBury(user)


		else
			user << "<span class='notice'>You start digging...</span>"
			playsound(src, 'sound/effects/shovel_dig.ogg', 50, 1) //FUCK YO RUSTLE I GOT'S THE DIGS SOUND HERE
			if(do_after(user, digging_speed, target = src))
				if(istype(src, /turf/simulated/floor/plating/asteroid))
					user << "<span class='notice'>You dig a hole.</span>"
					gets_dug(user)
					new /obj/item/weapon/ore/glass(src)
					new /obj/item/weapon/ore/glass(src)
	else
		//not digging
		if (dug)
			//add items
			handle_item_insertion(W, user)


/turf/simulated/floor/plating/asteroid/proc/gets_dug(mob/user)
	if(dug)
		return
	for (var/obj/item/I in pitcontents)
		I.loc = user.loc
	if (mypit==null)
		mypit = new/obj/dugpit(src)
	mypit.invisibility = 0
	storedindex = 0
	pitcontents = list()
	dug = 1
	icon_plating = "[environment_type]_dug"
	icon_state = "[environment_type]_dug"
	slowdown = 0
	if (gravebody!=null)
		if (user!=null)
			user << "<span class='danger'>You have found a body in the pit!</span>"
		gravebody.loc = mypit.loc
	if (gravecoffin!=null)
		if (user!=null)
			user << "<span class='notice'>You have uncovered a coffin from the grave.</span>"
		gravecoffin.loc = mypit.loc
	gravebody = null
	gravecoffin = null
	return