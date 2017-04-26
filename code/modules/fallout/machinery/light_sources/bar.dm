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
	desc = "The glow of this sign encourages me to buy a drink in the bar... Tempting..."
	light_color = LIGHT_COLOR_BLUE
	light_type = null

/obj/machinery/light/sign/break_light_tube()
	return 0