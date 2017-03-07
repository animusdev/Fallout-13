/obj/screen/plane_master
	screen_loc = "CENTER"
//	icon_state = "blank"
	appearance_flags = NO_CLIENT_COLOR | PLANE_MASTER | RESET_TRANSFORM | RESET_COLOR | RESET_ALPHA
	blend_mode = BLEND_OVERLAY

/obj/screen/plane_master/game_world
	name = "game world plane master"
	plane = GAME_PLANE
	blend_mode = BLEND_MULTIPLY
	invisibility     = INVISIBILITY_LIGHTING
	color = list(null,null,null,"#0000","#000f")
/*
/obj/screen/plane_master/lighting
	name = "lighting plane master"
	plane = 1
	blend_mode = BLEND_OVERLAY
	icon_state = "blank"
	invisibility     = INVISIBILITY_LIGHTING
	appearance_flags = RESET_TRANSFORM | RESET_COLOR | RESET_ALPHA
	mouse_opacity = 0

/obj/screen/plane_master/lighting/New()
	..()
	var/matrix/M = matrix()
	M.Scale(world.view*2.2)
	transform = M
*/