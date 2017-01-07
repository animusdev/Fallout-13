//WARNING - SPRITES NEEDED

/obj/item/mine
	name = "dummy mine"
	desc = "Better stay away from that thing."
	density = 0
	layer = 3
	icon = 'icons/obj/weapons.dmi'
	icon_state = "uglymine"
	var/triggered = 0
	var/active = 0

/obj/item/mine/proc/mineEffect(mob/victim)
	victim << "<span class='danger'>*click*</span>"

/obj/item/mine/proc/mode(activate)
	active = activate
	anchored = activate

/obj/item/mine/examine(mob/user)
	..()
	if(active)
		user << "<span class='danger'>Mine is active</span>"
	else
		user << "<span class='info'>Mine is not active</span>"

/obj/item/mine/attackby(obj/item/I, mob/user, params)
	if(active)
		triggermine(user)
		return

/obj/item/mine/attack_hand(mob/user)
	if(active)
		mode(0)
		visible_message("<span class='notice'>[src] was turned off by [user]</span>")
		return
	..()
/obj/item/mine/attack_self(mob/user)
	mode(1)
	user << "<span class='warning'> [src] has been activated</span>"
	user.drop_item()

/obj/item/mine/Crossed(AM as mob|obj)
	if(!active)
		return
	if(isanimal(AM))
		var/mob/living/simple_animal/SA = AM
		if(!SA.flying)
			triggermine(SA)
	else
		triggermine(AM)

/obj/item/mine/proc/triggermine(mob/victim)
	if(triggered)
		return
	visible_message("<span class='danger'>[victim] sets off \icon[src] [src]!</span>")
	var/datum/effect_system/spark_spread/s = new /datum/effect_system/spark_spread
	s.set_up(3, 1, src)
	s.start()
	mineEffect(victim)
	triggered = 1
	qdel(src)


/obj/item/mine/explosive
	name = "explosive mine"
	var/range_devastation = 0
	var/range_heavy = 1
	var/range_light = 2
	var/range_flash = 3

/obj/item/mine/explosive/mineEffect(mob/victim)
	explosion(loc, range_devastation, range_heavy, range_light, range_flash)


/obj/item/mine/stun
	name = "stun mine"
	var/stun_time = 8

/obj/item/mine/stun/mineEffect(mob/victim)
	if(isliving(victim))
		victim.Weaken(stun_time)

/obj/item/mine/kickmine
	name = "kick mine"

/obj/item/mine/kickmine/mineEffect(mob/victim)
	if(isliving(victim) && victim.client)
		victim << "<span class='userdanger'>You have been kicked FOR NO REISIN!</span>"
		del(victim.client)


/obj/item/mine/gas
	name = "oxygen mine"
	var/gas_amount = 360
	var/gas_type = SPAWN_OXYGEN

/obj/item/mine/gas/mineEffect(mob/victim)
	atmos_spawn_air(gas_type, gas_amount)


/obj/item/mine/gas/plasma
	name = "plasma mine"
	gas_type = SPAWN_TOXINS


/obj/item/mine/gas/n2o
	name = "\improper N2O mine"
	gas_type = SPAWN_N2O


/obj/item/mine/sound
	name = "honkblaster 1000"
	var/sound = 'sound/items/bikehorn.ogg'

/obj/item/mine/sound/mineEffect(mob/victim)
	playsound(loc, sound, 100, 1)


/obj/item/mine/sound/bwoink
	name = "bwoink mine"
	sound = 'sound/effects/adminhelp.ogg'