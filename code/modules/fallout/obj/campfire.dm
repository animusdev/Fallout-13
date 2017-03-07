/obj/structure/campfire
	name = "campfire"

	density = 0
	anchored = 1
	opacity = 0

	var/fired = 0

	var/fuel = 300

	light_color = LIGHT_COLOR_FIRE

	var/burned = 0

	var/list/hearers = list()

	desc = "It's campfire. I need some fire source."

	icon = 'icons/fallout/objects/structures/campfire.dmi'
	icon_state = "campfire20"

/obj/structure/campfire/Destroy()
	SSobj.processing.Remove(src)
	..()

/obj/structure/campfire/attackby(obj/item/P, mob/user, params)
	if(burned)
		to_chat(user, "You remove campfire ashes.")
		qdel(src)
		return
	if(fired)
		return
	if(istype(P, /obj/item/weapon/weldingtool))
		var/obj/item/weapon/weldingtool/WT = P
		if(WT.isOn())
			fire(user)
	else if(istype(P, /obj/item/device/flashlight/torch/flare))
		var/obj/item/device/flashlight/torch/flare/F = P
		if(F.on)
			fire(user)
	else if(istype(P, /obj/item/weapon/lighter))
		var/obj/item/weapon/lighter/L = P
		if(L.lit)
			fire(user)
	else if(istype(P, /obj/item/candle))
		var/obj/item/candle/C = P
		if(C.lit)
			fire(user)
	else if(istype(P, /obj/item/weapon/match))
		var/obj/item/weapon/match/M = P
		if(M.lit)
			fire(user)
	else if(istype(P, /obj/item/clothing/mask/cigarette))
		var/obj/item/clothing/mask/cigarette/M = P
		if(M.lit)
			fire(user)
	else if(istype(P, /obj/item/stack/sheet/mineral/wood))
		var/obj/item/stack/sheet/mineral/wood/W = P
		if(fuel > 400)
			to_chat(user, "You can't add anymore")
			return
		if(W.use(1))
			user.visible_message("[user] has added fuel to [src].", "<span class='notice'>You have added fuel to [src].</span>")
			fuel += 60
	else if(istype(P, /obj/item/weapon/reagent_containers/food/snacks))
		if(!ishuman(user))
			return
		var/mob/living/carbon/human/H = user
		var/obj/item/weapon/reagent_containers/food/snacks/F = P
		to_chat(user, "You begin cook [F.name]")
		if(do_after(user, 20, target = src))
			if(F.cooked_type)
				H.drop_item()
				var/obj/item/weapon/reagent_containers/food/snacks/S = new F.cooked_type ()
				H.put_in_active_hand(S)
				F.initialize_cooked_food(S, 0.8)
				feedback_add_details("food_made","[F.type]")
			else
				H.drop_item()
				var/obj/item/weapon/reagent_containers/food/snacks/S = new /obj/item/weapon/reagent_containers/food/snacks/badrecipe()
				H.put_in_active_hand(S)
			qdel(F)

/obj/structure/campfire/process()
	var/turf/location = get_turf(src)
	fuel--
	if(fuel > 200)
		set_light(8)
	else if(fuel > 100)
		set_light(5)
	else
		set_light(2)
	if(fuel <= 0)
		name = "burned campfire"
		desc = "It's burned..."
		icon_state = "campfire0"
		fired = 0
		burned = 1
		set_light(0)
		StopAmbient()
		STOP_PROCESSING(SSobj, src)
		update_icon()
		return

	if(location)
		location.hotspot_expose(70000, 5)
		return

/obj/structure/campfire/proc/fire(mob/living/user)

	BeginAmbient('sound/effects/comfyfire.ogg', 20, 12)

	playsound(src, 'sound/items/welder.ogg', 25, 1, -3)
	START_PROCESSING(SSobj, src)
	set_light(8)
	fired = 1
	desc = "Fired campfire... It's hot."
	if(user)
		user.visible_message("[user] has fire [src].", "<span class='notice'>You have fire [src].</span>")
	update_icon()
/obj/structure/campfire/update_icon()
	if(fired)
		icon_state = "campfire21"
		overlays = list(image(icon,icon_state = "campfire_o"))
	else
		icon_state = "campfire20"
		overlays.Cut()
	..()