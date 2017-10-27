/obj/item/weapon/grenade/mine
	name = "mine"
	desc = "Better stay away from that thing."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "uglymine"
	var/triggered = 0
	det_time = 0																										//Âçðûâàåòñÿ ìîìåíòàëüíî


/obj/item/weapon/grenade/mine/attack_self(mob/user)
	if(!active)
		to_chat(user, "<span class='warning'>You plant the [name]!</span>")											//Ñîîáùåíèå, êîòîðîå âûâîäèòñÿ èãðîêó ïðè óñòàíîâêå.
		visible_message("<span class='danger'>[user] plants the [src]!</span>")										//Ñîîáùåíèå âñåì ïðèñóòñòâóþùèì
		playsound(user.loc, 'sound/weapons/armbomb.ogg', 60, 1)
		active = 1
//			icon_state = initial(icon_state) + "_active"																//Åñëè áóäåøü ìåíÿòü ñïðàéò ó àêòèâíîé - èçìåíè ýòó ñòðîêó.
		add_fingerprint(user)																						//Îñòàâëÿåì îòïå÷àòêè ìîáà íà ìèíå

		var/turf/bombturf = get_turf(src)																			//Ñëåäóþùèå øåñòü ñòðîê âîîáùå íå îáÿçàòåëüíû, ëèøü ïèøóò â ëîãè, ÷òî êòî-òî ïîñòàâèë ìèíó.
		var/area/A = get_area(bombturf)
		var/message = "[ADMIN_LOOKUPFLW(user)]) has primed a [name] for detonation at [ADMIN_COORDJMP(bombturf)]"
		bombers += message
		message_admins(message)
		log_game("[key_name(usr)] has primed a [name] for detonation at [A.name] [COORD(bombturf)].")

		if(user)
			user.drop_item()																						//Ðîíÿåì ìèíó íà ïîë
			anchored = 1																							//È êðåïèì å¸ ê ïîëó



/obj/item/weapon/grenade/mine/proc/mineEffect(mob/victim)																//Ñþäà ïèøåì ýôôåêò îò ìèíû. Ïî-õîðîøåìó, íóæíî ïåðåïèñàòü, ÷òîá þçàëñÿ ïðîê prime()
	to_chat(victim, "<span class='danger'>*click*</span>")

/obj/item/weapon/grenade/mine/Crossed(AM as mob|obj/item)
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

/obj/item/weapon/grenade/mine/explosive/mineEffect(mob/victim)
	explosion(loc, range_devastation, range_heavy, range_light, range_flash)


/obj/item/weapon/grenade/mine/explosive/planted
	active = 1
	anchored = 1
