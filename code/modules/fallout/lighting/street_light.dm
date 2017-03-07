/obj/machinery/light/street
	name = "street light"
	icon_state = "lamppost0"
	base_state = "lamppost"
	icon = 'icons/fallout/machines/64x96.dmi'
	fitting = "lamp post"
	brightness = 6
	active_power_usage = 100
	density = 0
	layer = 8
	pixel_x = -20
	desc = "Obviously it's a raised source of light on the edge of a road or walkway.<br>Have you now satisfied your curiosity?"
	light_type = null
	light_color = LIGHT_COLOR_YELLOW

/obj/machinery/light/street/process()
	..()
//	if(sun_triger)
//		if(SSsun.global_sun_light < 5 && !on)
//			seton(1)
//		if(SSsun.global_sun_light >= 5 && on)
//			seton(0)
/////////CLOSE YOUR EYES NOW!
/obj/machinery/light/street/attackby()
	return 0
/obj/machinery/light/street/attack_alien()
	return 0
/obj/machinery/light/street/attack_animal()
	return 0
/obj/machinery/light/street/attack_hand()
	return 0
/obj/machinery/light/street/attack_tk()
	return 0
/obj/machinery/light/street/explode()
	return 0
/obj/machinery/light/street/break_light_tube()
	return 0
/////////Now you can open them