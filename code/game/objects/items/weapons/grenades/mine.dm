/obj/item/weapon/grenade/mine
	name = "mine"
	desc = "Better stay away from that thing."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "uglymine"
	var/triggered = 0
	det_time = 0																										//Взрывается моментально


/obj/item/weapon/grenade/mine/attack_self(mob/user)
	if(!active)
		to_chat(user, "<span class='warning'>You plant the [name]!</span>")											//Сообщение, которое выводится игроку при установке.
		visible_message("<span class='danger'>[user] plants the [src]!</span>")										//Сообщение всем присутствующим
		playsound(user.loc, 'sound/weapons/armbomb.ogg', 60, 1)
		active = 1
//			icon_state = initial(icon_state) + "_active"																//Если будешь менять спрайт у активной - измени эту строку.
		add_fingerprint(user)																						//Оставляем отпечатки моба на мине

		var/turf/bombturf = get_turf(src)																			//Следующие шесть строк вообще не обязательны, лишь пишут в логи, что кто-то поставил мину.
		var/area/A = get_area(bombturf)
		var/message = "[ADMIN_LOOKUPFLW(user)]) has primed a [name] for detonation at [ADMIN_COORDJMP(bombturf)]"
		bombers += message
		message_admins(message)
		log_game("[key_name(usr)] has primed a [name] for detonation at [A.name] [COORD(bombturf)].")

		if(user)
			user.drop_item()																						//Роняем мину на пол
			anchored = 1																							//И крепим её к полу



/obj/item/weapon/grenade/mine/proc/mineEffect(mob/victim)																//Сюда пишем эффект от мины. По-хорошему, нужно переписать, чтоб юзался прок prime()
	to_chat(victim, "<span class='danger'>*click*</span>")

/obj/item/weapon/grenade/mine/Crossed(AM as mob|obj)
	if(active)
		if(ismob(AM))
			var/mob/MM = AM
			if(!(MM.movement_type & FLYING))
				triggermine(AM)
		else
			triggermine(AM)

/obj/item/weapon/grenade/mine/proc/triggermine(mob/victim)
	if(triggered)
		return
	visible_message("<span class='danger'>[victim] sets off [bicon(src)] [src]!</span>")
	var/datum/effect_system/spark_spread/s = new /datum/effect_system/spark_spread
	s.set_up(3, 1, src)
	s.start()
	mineEffect(victim)
	triggered = 1
	qdel(src)



/obj/item/weapon/grenade/mine/explosive
	name = "explosive mine"
	var/range_devastation = 0
	var/range_heavy = 1
	var/range_light = 2
	var/range_flash = 3

/obj/effect/mine/explosive/mineEffect(mob/victim)
	explosion(loc, range_devastation, range_heavy, range_light, range_flash)


/obj/item/weapon/grenade/mine/explosive/planted
	active = 1
	anchored = 1