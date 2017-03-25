/turf/proc/updateMineralOverlays()
	if(!rockTurfEdgeCache || !rockTurfEdgeCache.len)
		rockTurfEdgeCache = list()
		rockTurfEdgeCache.len = 4
		rockTurfEdgeCache[NORTH_EDGING] = new/image('icons/fallout/turfs/mining.dmi', "rock_side_n", layer = 6)
		rockTurfEdgeCache[SOUTH_EDGING] = new/image('icons/fallout/turfs/mining.dmi', "rock_side_s", layer = 6)
		rockTurfEdgeCache[EAST_EDGING] = new/image('icons/fallout/turfs/mining.dmi', "rock_side_e", layer = 6)
		rockTurfEdgeCache[WEST_EDGING] = new/image('icons/fallout/turfs/mining.dmi', "rock_side_w", layer = 6)
	for(var/image/I in rockTurfEdgeCache)
		src.overlays -= I
	if(istype(get_step(src, NORTH), /turf/closed/mineral))
		src.overlays += rockTurfEdgeCache[NORTH_EDGING]
	if(istype(get_step(src, SOUTH), /turf/closed/mineral))
		src.overlays += rockTurfEdgeCache[SOUTH_EDGING]
	if(istype(get_step(src, EAST), /turf/closed/mineral))
		src.overlays += rockTurfEdgeCache[EAST_EDGING]
	if(istype(get_step(src, WEST), /turf/closed/mineral))
		src.overlays += rockTurfEdgeCache[WEST_EDGING]

/turf/closed/updateMineralOverlays()
	return

/turf/closed/mineral/updateMineralOverlays()
	return

/turf/proc/fullUpdateJunctionOverlays()
	for (var/turf/t in range(1,src))
		t.updateMineralOverlays()
		t.updateDesertOverlays()
/turf/proc/updateDesertOverlays()
	if(!desertTurfEdgeCache || !desertTurfEdgeCache.len)
		generate_desert_overlays_cache()
	for(var/image/I in desertTurfEdgeCache)
		src.overlays -= I
	if(istype(src, /turf/open/indestructible/ground/desert))
		return

	var/adjacencies = get_adjacencies(/turf/open/indestructible/ground/desert)

	if((adjacencies & N_NORTH) && (adjacencies & N_WEST))
		src.overlays |= desertTurfEdgeCache["1-f"]
	else
		if(adjacencies & N_NORTH)
			if(adjacencies & N_NORTHWEST)
				src.overlays |= desertTurfEdgeCache["1-nw"]
			else
				src.overlays |= desertTurfEdgeCache["1-n"]
		else if(adjacencies & N_WEST)
			if(adjacencies & N_NORTHWEST)
				src.overlays |= desertTurfEdgeCache["1-wn"]
			else
				src.overlays |= desertTurfEdgeCache["1-w"]

	if((adjacencies & N_NORTH) && (adjacencies & N_EAST))
		src.overlays |= desertTurfEdgeCache["2-f"]
	else
		if(adjacencies & N_NORTH)
			if(adjacencies & N_NORTHEAST)
				src.overlays |= desertTurfEdgeCache["2-ne"]
			else
				src.overlays |= desertTurfEdgeCache["2-n"]
		else if(adjacencies & N_EAST)
			if(adjacencies & N_NORTHEAST)
				src.overlays |= desertTurfEdgeCache["2-en"]
			else
				src.overlays |= desertTurfEdgeCache["2-e"]

	if((adjacencies & N_SOUTH) && (adjacencies & N_WEST))
		src.overlays |= desertTurfEdgeCache["3-f"]
	else
		if(adjacencies & N_SOUTH)
			if(adjacencies & N_SOUTHWEST)
				src.overlays |= desertTurfEdgeCache["3-sw"]
			else
				src.overlays |= desertTurfEdgeCache["3-s"]
		else if(adjacencies & N_WEST)
			if(adjacencies & N_SOUTHWEST)
				src.overlays |= desertTurfEdgeCache["3-ws"]
			else
				src.overlays |= desertTurfEdgeCache["3-w"]


	if((adjacencies & N_SOUTH) && (adjacencies & N_EAST))
		src.overlays |= desertTurfEdgeCache["4-f"]
	else
		if(adjacencies & N_SOUTH)
			if(adjacencies & N_SOUTHEAST)
				src.overlays |= desertTurfEdgeCache["4-se"]
			else
				src.overlays |= desertTurfEdgeCache["4-s"]
		else if(adjacencies & N_EAST)
			if(adjacencies & N_SOUTHEAST)
				src.overlays |= desertTurfEdgeCache["4-es"]
			else
				src.overlays |= desertTurfEdgeCache["4-e"]

/turf/closed/updateDesertOverlays()
	return

/turf/open/indestructible/ground/desert/updateDesertOverlays()
	return

/turf/proc/get_adjacencies(turf_type)

	. = 0
	var/turf/T

	T = get_step(src, NORTH)
	if(T.type == turf_type)
		. |= N_NORTH
	T = get_step(src, EAST)
	if(T.type == turf_type)
		. |= N_EAST
	T = get_step(src, WEST)
	if(T.type == turf_type)
		. |= N_WEST
	T = get_step(src, SOUTH)
	if(T.type == turf_type)
		. |= N_SOUTH
	T = get_step(src, NORTHWEST)
	if(T.type == turf_type)
		. |= N_NORTHWEST
	T = get_step(src, NORTHEAST)
	if(T.type == turf_type)
		. |= N_NORTHEAST
	T = get_step(src, SOUTHWEST)
	if(T.type == turf_type)
		. |= N_SOUTHWEST
	T = get_step(src, SOUTHEAST)
	if(T.type == turf_type)
		. |= N_SOUTHEAST

proc/generate_desert_overlays_cache()
	desertTurfEdgeCache = list()
	desertTurfEdgeCache.len = 20
	desertTurfEdgeCache["1-f"] = new/image('icons/fallout/turfs/ground_smooth.dmi', "1-f", layer = TURF_LAYER)
	desertTurfEdgeCache["1-nw"] = new/image('icons/fallout/turfs/ground_smooth.dmi', "1-nw", layer = TURF_LAYER)
	desertTurfEdgeCache["1-n"] = new/image('icons/fallout/turfs/ground_smooth.dmi', "1-n", layer = TURF_LAYER)
	desertTurfEdgeCache["1-w"] = new/image('icons/fallout/turfs/ground_smooth.dmi', "1-w", layer = TURF_LAYER)
	desertTurfEdgeCache["1-wn"] = new/image('icons/fallout/turfs/ground_smooth.dmi', "1-wn", layer = TURF_LAYER)

	desertTurfEdgeCache["2-f"] = new/image('icons/fallout/turfs/ground_smooth.dmi', "2-f", layer = TURF_LAYER)
	desertTurfEdgeCache["2-ne"] = new/image('icons/fallout/turfs/ground_smooth.dmi', "2-ne", layer = TURF_LAYER)
	desertTurfEdgeCache["2-n"] = new/image('icons/fallout/turfs/ground_smooth.dmi', "2-n", layer = TURF_LAYER)
	desertTurfEdgeCache["2-e"] = new/image('icons/fallout/turfs/ground_smooth.dmi', "2-e", layer = TURF_LAYER)
	desertTurfEdgeCache["2-en"] = new/image('icons/fallout/turfs/ground_smooth.dmi', "2-en", layer = TURF_LAYER)

	desertTurfEdgeCache["3-f"] = new/image('icons/fallout/turfs/ground_smooth.dmi', "3-f", layer = TURF_LAYER)
	desertTurfEdgeCache["3-sw"] = new/image('icons/fallout/turfs/ground_smooth.dmi', "3-sw", layer = TURF_LAYER)
	desertTurfEdgeCache["3-s"] = new/image('icons/fallout/turfs/ground_smooth.dmi', "3-s", layer = TURF_LAYER)
	desertTurfEdgeCache["3-w"] = new/image('icons/fallout/turfs/ground_smooth.dmi', "3-w", layer = TURF_LAYER)
	desertTurfEdgeCache["3-ws"] = new/image('icons/fallout/turfs/ground_smooth.dmi', "3-ws", layer = TURF_LAYER)

	desertTurfEdgeCache["4-f"] = new/image('icons/fallout/turfs/ground_smooth.dmi', "4-f", layer = TURF_LAYER)
	desertTurfEdgeCache["4-se"] = new/image('icons/fallout/turfs/ground_smooth.dmi', "4-se", layer = TURF_LAYER)
	desertTurfEdgeCache["4-s"] = new/image('icons/fallout/turfs/ground_smooth.dmi', "4-s", layer = TURF_LAYER)
	desertTurfEdgeCache["4-e"] = new/image('icons/fallout/turfs/ground_smooth.dmi', "4-e", layer = TURF_LAYER)
	desertTurfEdgeCache["4-es"] = new/image('icons/fallout/turfs/ground_smooth.dmi', "4-es", layer = TURF_LAYER)