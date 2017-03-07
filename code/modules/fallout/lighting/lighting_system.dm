/*
	This is /tg/'s 'newer' lighting system. It's basically a combination of Forum_Account's and ShadowDarke's
	respective lighting libraries heavily modified by Carnwennan for /tg/station with further edits by
	MrPerson. Credits, where due, to them.

	Originally, like all other lighting libraries on BYOND, we used areas to render different hard-coded light levels.
	The idea was that this was cheaper than using objects. Well as it turns out, the cost of the system is primarily from the
	massive loops the system has to run, not from the areas or objects actually doing any work. Thus the newer system uses objects
	so we can have more lighting states and smooth transitions between them.

	This is a queueing system. Everytime we call a change to opacity or luminosity throwgh set_opacity() or set_light(),
	we are simply updating variables and scheduling certain lights/turfs for an update. Actual updates are handled
	periodically by the SSlighting subsystem. Specifically, it runs check() on every light datum that ran changed().
	Then it runs redraw_lighting() on every turf that ran update_lumcount().

	Unlike our older system, there are hardcoded maximum luminosities (different for certain atoms).
	This is to cap the cost of creating lighting effects.
	(without this, an atom with luminosity of 20 would have to update 41^2 turfs!) :s

	Each light remembers the effect it casts on each turf. It reduces cost of removing lighting effects by a lot!

	Known Issues/TODO:
		Shuttles still do not have support for dynamic lighting (I hope to fix this at some point) -probably trivial now
		No directional lighting support. (prototype looked ugly)
		Allow lights to be weaker than 'cap' radius
		Colored lights
*/

/datum/light_source
	var/atom/owner
	var/radius = 0
	var/luminosity = 0
	var/cap = 0
	var/changed = 0
	var/mode = LIGHTING_REGULAR
	var/list/effect = list()

	var/color = DEFAULT_LIGHT_COLOR_HEX

	var/__x = 0		//x coordinate at last update
	var/__y = 0		//y coordinate at last update

/datum/light_source/New(atom/A)
	if(!istype(A))
		CRASH("The first argument to the light object's constructor must be the atom that is the light source. Expected atom, received '[A]' instead.")
	..()
	owner = A
	UpdateLuminosity(A.luminosity)

/datum/light_source/Destroy()
	if(owner && owner.light == src)
		remove_effect()
		owner.light = null
		owner.luminosity = 0
		owner = null
	if(changed)
		SSlighting.changed_lights -= src
	return ..()

/datum/light_source/proc/UpdateLuminosity(new_luminosity, new_cap, color = DEFAULT_LIGHT_COLOR_HEX)
	if(new_luminosity < 0)
		new_luminosity = 0

	if(luminosity == new_luminosity && (new_cap == null || cap == new_cap))
		return

	radius = max(LIGHTING_MIN_RADIUS, new_luminosity)
	luminosity = new_luminosity

	src.color = color

	if (new_cap != null)
		cap = new_cap

	changed()


//Check a light to see if its effect needs reprocessing. If it does, remove any old effect and create a new one
/datum/light_source/proc/check()
	if(!owner)
		remove_effect()
		return 0

	if(changed)
		changed = 0
		remove_effect()
		return add_effect()

	return 1

//Tell the lighting subsystem to check() next fire
/datum/light_source/proc/changed()
	if(owner)
		__x = owner.x
		__y = owner.y
	if(!changed)
		changed = 1
		SSlighting.changed_lights |= src

//Remove current effect
/datum/light_source/proc/remove_effect().
	for(var/turf/T in effect)
		LAZYREMOVE(T.affecting_lights, src)
		T.update_lumcount(-effect[T], mode)

	effect.Cut()

//Apply a new effect.
/datum/light_source/proc/add_effect()
	// only do this if the light is turned on and is on the map
	if(!owner || !owner.loc)
		return 0
	var/range = owner.get_light_range(radius)
	if(range <= 0 || luminosity <= 0)
		owner.luminosity = 0
		return 0

	effect = list()
	var/turf/To = get_turf(owner)


	for(var/atom/movable/AM in To)
		if(AM == owner)
			continue
		if(AM.opacity)
			range = 1
			break

	owner.luminosity = range
	var/center_strength = 0
	if (cap <= 0)
		center_strength = LIGHTING_CAP/LIGHTING_LUM_FOR_FULL_BRIGHT*(luminosity)
	else
		center_strength = cap

	for(var/turf/T in view(range+1, To))

#ifdef LIGHTING_CIRCULAR
		var/distance = cheap_hypotenuse(T.x, T.y, __x, __y)
#else
		var/distance = max(abs(T,x - __x), abs(T.y - __y))
#endif

		var/delta_lumcount = Clamp(center_strength * (range - distance) / range, 0, LIGHTING_CAP)

		if(delta_lumcount > 0)
			effect[T] = delta_lumcount
			T.update_lumcount(delta_lumcount, mode)

			LAZYINITLIST(T.affecting_lights)
			T.affecting_lights |= src

	return 1

/atom
	var/datum/light_source/light

//Objects with opacity will trigger nearby lights to update at next SSlighting fire
/atom/movable/Destroy()
	qdel(light)
	if(opacity && isturf(loc))
		loc.UpdateAffectingLights()
	return ..()


//Sets our luminosity.
//If we have no light it will create one.
//If we are setting luminosity to 0 the light will be cleaned up by the controller and garbage collected once all its
//queues are complete.
//if we have a light already it is merely updated, rather than making a new one.
//The second arg allows you to scale the light cap for calculating falloff.

/atom/proc/set_light(new_luminosity, new_cap, color = DEFAULT_LIGHT_COLOR_HEX)
	if (!light)
		if (new_luminosity <= 0)
			return
		light = new(src)

	light.UpdateLuminosity(new_luminosity, new_cap, color)

/atom/proc/AddLuminosity(delta_luminosity)
	if(light)
		set_light(light.luminosity + delta_luminosity, color = (light ? light.color : DEFAULT_LIGHT_COLOR_HEX))
	else
		set_light(delta_luminosity, color = (light ? light.color : DEFAULT_LIGHT_COLOR_HEX))

/area/set_light(new_luminosity)			//we don't want dynamic lighting for areas
	luminosity = !!new_luminosity


//change our opacity (defaults to toggle), and then update all lights that affect us.
/atom/proc/set_opacity(new_opacity)
	if(new_opacity == null)
		new_opacity = !opacity			//default = toggle opacity
	else if(opacity == new_opacity)
		return 0						//opacity hasn't changed! don't bother doing anything
	opacity = new_opacity				//update opacity, the below procs now call light updates.
	UpdateAffectingLights()
	return 1

/atom/movable/light_color
	icon = LIGHTING_ICON
	layer = LIGHTING_LAYER - 0.1
	plane = LIGHTING_PLANE - 1
	mouse_opacity = 0
	blend_mode = BLEND_MULTIPLY
	invisibility = INVISIBILITY_LIGHTING

	anchored = 1

/atom/movable/light_color/Move()
	return 0

/atom/movable/light
	icon = LIGHTING_ICON
	icon_state = LIGHTING_ICON_STATE
	layer = LIGHTING_LAYER
	plane = LIGHTING_PLANE
	mouse_opacity = 0
	blend_mode = BLEND_OVERLAY
	invisibility = INVISIBILITY_LIGHTING

	luminosity = 0
	infra_luminosity = 1
	anchored = 1

/atom/movable/light/Destroy(force)
	if(!force)
		return QDEL_HINT_LETMELIVE
	var/turf/T = loc
	. = ..()
	if (T.lighting_object == src)
		T.lighting_object = null

/atom/movable/light/New()
	if (!isturf(loc))
		PutOut()
		throw EXCEPTION("Invalid light placement: loc must be a turf")
	var/turf/T = loc

	if (T.lighting_object && T.lighting_object != src)
		PutOut()
		throw EXCEPTION("BUG: /atom/movable/light created on a turf that already has one")
	T.lighting_object = src

/atom/movable/light/proc/PutOut()
	alpha = 0
	qdel(src, force = TRUE)

/atom/movable/light/Move()
	return 0

/turf
	var/lighting_lumcount = 0
	var/lighting_changed = 0
	var/atom/movable/light/lighting_object //Will be null for space turfs and anything in a static lighting area
	var/list/affecting_lights			//all /light_source affecting this turf, lazy initialized
	var/starlight = 0					//Amount of starlight hitting this turf

	var/light_color = list(0,0,0)

	var/atom/movable/light_color/r_underlay
	var/atom/movable/light_color/g_underlay
	var/atom/movable/light_color/b_underlay

/turf/proc/recalculate_color()
	var/tmp/list/rgb
	var/tmp/list/C
	var/tmp/power

	for(var/datum/light_source/L in affecting_lights)
		if(L.color == null || L.color == DEFAULT_LIGHT_COLOR_HEX)
			C = DEFAULT_LIGHT_COLOR_RGB
		else
			C = ReadRGB(L.color)
		if(!rgb)
			rgb = C
			continue
		power = (L.effect[src])/lighting_lumcount
		rgb[1] = Lerp(rgb[1], C[1], power)
		rgb[2] = Lerp(rgb[2], C[2], power)
		rgb[3] = Lerp(rgb[3], C[3], power)
	if(!rgb)
		light_color = DEFAULT_LIGHT_COLOR_RGB
	else
		light_color = rgb

	update_color()


/turf/proc/update_color()

	if(!r_underlay)
		r_underlay = new(src)
		r_underlay.icon_state = "red"
	if(!g_underlay)
		g_underlay = new(src)
		g_underlay.icon_state = "green"
	if(!b_underlay)
		b_underlay = new(src)
		b_underlay.icon_state = "blue"

	r_underlay.alpha = light_color[1]
	g_underlay.alpha = light_color[2]
	b_underlay.alpha = light_color[3]

//DEBUG ONLY
/turf/proc/set_color(var/hex_color)
	var/list/rgb_color = ReadRGB(hex_color)

	light_color[1] = rgb_color[1]
	light_color[2] = rgb_color[2]
	light_color[3] = rgb_color[3]

	update_color()


/turf/ChangeTurf(path)
	if(!path || (!use_preloader && path == type)) //Sucks this is here but it would cause problems otherwise.
		return ..()

	for(var/obj/effect/decal/cleanable/decal in src.contents)
		qdel(decal)

	if(light)
		qdel(light)

	var/old_lumcount = lighting_lumcount - initial(lighting_lumcount)
	var/oldbaseturf = baseturf
	var/old_starlight = starlight

	var/atom/movable/light_color/r = r_underlay
	var/atom/movable/light_color/g = g_underlay
	var/atom/movable/light_color/b = b_underlay

	var/list/our_lights //reset affecting_lights if needed
	if(opacity != initial(path:opacity) && old_lumcount)
		UpdateAffectingLights()

	if(affecting_lights)
		our_lights = affecting_lights.Copy()

	. = ..() //At this point the turf has changed

	affecting_lights = our_lights

	lighting_changed = 1 //Don't add ourself to SSlighting.changed_turfs
	update_lumcount(old_lumcount, LIGHTING_REGULAR)
	starlight = old_starlight
	baseturf = oldbaseturf
	lighting_object = locate() in src

	r_underlay = r
	g_underlay = g
	b_underlay = b

	init_lighting()

	for(var/turf/open/space/S in RANGE_TURFS(1,src)) //RANGE_TURFS is in code\__HELPERS\game.dm
		S.update_starlight()

/turf/proc/update_lumcount(amount, mode)
	switch(mode)
		if(LIGHTING_REGULAR)
			lighting_lumcount += amount
		if(LIGHTING_STARLIGHT)
			if(amount > starlight)
				lighting_lumcount -= starlight
				starlight = amount
				lighting_lumcount += amount
			else if(amount && amount == -starlight)
				lighting_lumcount -= starlight
				starlight = 0
				for(var/thing in affecting_lights)
					var/datum/light_source/LS = thing
					if(LS.mode == LIGHTING_STARLIGHT)
						var/starlight_test = LS.effect[src]
						if(starlight < starlight_test)
							starlight = starlight_test
				lighting_lumcount += starlight

	if(!lighting_changed)
		SSlighting.changed_turfs += src
		lighting_changed = 1

/turf/open/space/update_lumcount(amount, mode) //Keep track in case the turf becomes a floor at some point, but don't process.
	lighting_changed = TRUE
	..()
	lighting_changed = FALSE

/turf/proc/init_lighting()
	var/area/A = loc

	set_color("#000")

	update_color()

	if(!IS_DYNAMIC_LIGHTING(A))
		if(lighting_changed)
			lighting_changed = 0
		if(lighting_object)
			lighting_object.PutOut()
	else
		if(!lighting_object)
			lighting_object = new (src)
		redraw_lighting(1)
		for(var/turf/open/space/T in RANGE_TURFS(1,src))
			T.update_starlight()


/turf/open/space/init_lighting()
	if(lighting_changed)
		lighting_changed = 0
	if(lighting_object)
		lighting_object.PutOut()

/turf/proc/redraw_lighting(instantly = 0)
	if(lighting_object)
		var/newalpha
		if(lighting_lumcount <= 0)
			newalpha = 255
		else
			if(lighting_lumcount < LIGHTING_CAP)
				var/num = Clamp(lighting_lumcount * LIGHTING_CAP_FRAC, 0, 255)
				newalpha = 255-num
			else //if(lighting_lumcount >= LIGHTING_CAP)
				newalpha = 0
		if(newalpha >= LIGHTING_DARKEST_VISIBLE_ALPHA)
			newalpha = 255
		if(lighting_object.alpha != newalpha)
			if(instantly || abs(lighting_object.alpha - newalpha) < LIGHTING_MIN_ALPHA_DELTA_TO_ANIMATE)
				lighting_object.alpha = newalpha
			else
				animate(lighting_object, alpha = newalpha, time = LIGHTING_ANIMATE_TIME)
			if(newalpha >= LIGHTING_DARKEST_VISIBLE_ALPHA)
				luminosity = 0
				lighting_object.luminosity = 0
			else
				luminosity = 1
				lighting_object.luminosity = 1
	recalculate_color()
	lighting_changed = 0

/turf/proc/get_lumcount()
	. = LIGHTING_CAP
	var/area/A = src.loc
	if(IS_DYNAMIC_LIGHTING(A))
		. = src.lighting_lumcount

/area
	var/dynamic_lighting = DYNAMIC_LIGHTING_ENABLED	//Turn this flag off to make the area fullbright

/area/New()
	. = ..()
	if(dynamic_lighting != DYNAMIC_LIGHTING_ENABLED)
		luminosity = 1

/area/proc/set_dynamic_lighting()
	if (dynamic_lighting == DYNAMIC_LIGHTING_DISABLED)
		dynamic_lighting = DYNAMIC_LIGHTING_ENABLED
	luminosity = 0
	for(var/turf/T in src.contents)
		T.init_lighting()
		T.update_lumcount(0)

//set the changed status of all lights which could have possibly lit this atom.
//We don't need to worry about lights which lit us but moved away, since they will have change status set already
//This proc can cause lots of lights to be updated. :(
/atom/proc/UpdateAffectingLights()

/atom/movable/UpdateAffectingLights()
	if(isturf(loc))
		loc.UpdateAffectingLights()

/turf/UpdateAffectingLights()
	if(affecting_lights)
		for(var/datum/light_source/thing in affecting_lights)
			if (!thing.changed)
				thing.changed()			//force it to update at next process()


#define LIGHTING_MAX_LUMINOSITY_STATIC	8	//Maximum luminosity to reduce lag.
#define LIGHTING_MAX_LUMINOSITY_MOBILE	7	//Moving objects have a lower max luminosity since these update more often. (lag reduction)
#define LIGHTING_MAX_LUMINOSITY_MOB		6
#define LIGHTING_MAX_LUMINOSITY_TURF	8	//turfs are static too, why was this 1?!

//caps luminosity effects max-range based on what type the light's owner is.
/atom/proc/get_light_range(radius)
	return min(radius, LIGHTING_MAX_LUMINOSITY_STATIC)

/atom/movable/get_light_range(radius)
	return min(radius, LIGHTING_MAX_LUMINOSITY_MOBILE)

/mob/get_light_range(radius)
	return min(radius, LIGHTING_MAX_LUMINOSITY_MOB)

/obj/machinery/light/get_light_range(radius)
	return min(radius, LIGHTING_MAX_LUMINOSITY_STATIC)

/turf/get_light_range(radius)
	return min(radius, LIGHTING_MAX_LUMINOSITY_TURF)

#undef LIGHTING_MAX_LUMINOSITY_STATIC
#undef LIGHTING_MAX_LUMINOSITY_MOBILE
#undef LIGHTING_MAX_LUMINOSITY_MOB
#undef LIGHTING_MAX_LUMINOSITY_TURF
