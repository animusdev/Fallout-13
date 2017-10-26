//Fallout 13 neon signs directory

/obj/machinery/light/sign
	name = "bar sign"
	icon_state = "blue0"
	base_state = "blue"
	icon = 'icons/fallout/machines/64x32.dmi'
	fitting = "sign"
	brightness = 4
	active_power_usage = 50
	density = 0
	desc = "The glow of the sign tempts you to buy a drink..."
	light_color = LIGHT_COLOR_BLUE
	light_type = null

/obj/machinery/light/sign/break_light_tube()
	return 0


/obj/machinery/light/sign/crc_rad
	name = "radio sign"
	icon_state = "crc_radio0"
	base_state = "crc_radio"
	icon = 'icons/fallout/machines/radio.dmi'
	fitting = "sign"
	brightness = 4
	active_power_usage = 50
	density = 0
	desc = "The glow of the sign tempts you find a damn good cofee..."
	light_color = LIGHT_COLOR_RED
	light_type = null
