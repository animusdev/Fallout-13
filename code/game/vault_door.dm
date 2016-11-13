/obj/structure/vaultdoor
	name = "vault door"
	icon = 'icons/obj/doors/gear.dmi'
	icon_state = "closed"
	density = 1
	anchored = 1
	var/state = 0
	//0 - closed
	//1 - opening
	//2 - closing
	//3 - opened

/obj/structure/vaultdoor/New()
	..()
	pixel_x = -32
	pixel_y = -32

/obj/structure/vaultdoor/proc/start_open()
	playsound(loc, 'sound/f13machines/doorgear_open.ogg', 50, 0, 10)
	state = 1
	sleep(110)
	mid_open()

/obj/structure/vaultdoor/proc/start_close()
	playsound(loc, 'sound/f13machines/doorgear_close.ogg', 50, 0, 10)
	state = 2
	sleep(90)
	mid_close()

/obj/structure/vaultdoor/proc/mid_open()
	icon_state = "opening"
	sleep(40)
	finish_open()

/obj/structure/vaultdoor/proc/mid_close()
	icon_state = "closing"
	density = 1
	sleep(60)
	finish_close()

/obj/structure/vaultdoor/proc/finish_open()
	state = 3
	density = 0
	icon_state = "open"

/obj/structure/vaultdoor/proc/finish_close()
	state = 0
	icon_state = "closed"

/obj/structure/vaultdoor/proc/open()
	if (state == 0)
		start_open()

/obj/structure/vaultdoor/proc/close()
	if (state == 3)
		start_close()

/obj/structure/vaultdoor/proc/vaultactivate()
	if (state==0)
		open()
	else if (state == 3)
		close()

/obj/machinery/doorButtons/vaultButton
	name = "vault access"
	icon = 'icons/obj/lever.dmi'
	icon_state = "lever0"
	anchored = 1
	density = 1

/obj/machinery/doorButtons/vaultButton/proc/activate()
	for(var/obj/structure/vaultdoor/vdoor in world)
		vdoor.vaultactivate()

/obj/machinery/doorButtons/vaultButton/attackby(obj/item/weapon/W, mob/user, params)
	activate()

/obj/machinery/doorButtons/vaultButton/attack_hand(mob/user)
	activate()
