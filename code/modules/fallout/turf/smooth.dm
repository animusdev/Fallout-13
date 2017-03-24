/turf/proc/updateMineralOverlays()
	if(!rockTurfEdgeCache || !rockTurfEdgeCache.len)
		rockTurfEdgeCache = list()
		rockTurfEdgeCache.len = 4
		rockTurfEdgeCache[NORTH_EDGING] = image('icons/fallout/turfs/mining.dmi', "rock_side_n", layer = 6)
		rockTurfEdgeCache[SOUTH_EDGING] = image('icons/fallout/turfs/mining.dmi', "rock_side_s", layer = 6)
		rockTurfEdgeCache[EAST_EDGING] = image('icons/fallout/turfs/mining.dmi', "rock_side_e", layer = 6)
		rockTurfEdgeCache[WEST_EDGING] = image('icons/fallout/turfs/mining.dmi', "rock_side_w", layer = 6)
	if(istype(get_step(src, NORTH), /turf/closed/mineral))
		src.overlays += rockTurfEdgeCache[NORTH_EDGING]
	if(istype(get_step(src, SOUTH), /turf/closed/mineral))
		src.overlays += rockTurfEdgeCache[SOUTH_EDGING]
	if(istype(get_step(src, EAST), /turf/closed/mineral))
		src.overlays += rockTurfEdgeCache[EAST_EDGING]
	if(istype(get_step(src, WEST), /turf/closed/mineral))
		src.overlays += rockTurfEdgeCache[WEST_EDGING]
		src.overlays.Cut()

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
		desertTurfEdgeCache = list()
		desertTurfEdgeCache.len = 4
		desertTurfEdgeCache[NORTH_EDGING] = image('icons/fallout/turfs/ground.dmi', "wasteland_side_n", layer = TURF_LAYER)
		desertTurfEdgeCache[SOUTH_EDGING] = image('icons/fallout/turfs/ground.dmi', "wasteland_side_s", layer = TURF_LAYER)
		desertTurfEdgeCache[EAST_EDGING] = image('icons/fallout/turfs/ground.dmi', "wasteland_side_e", layer = TURF_LAYER)
		desertTurfEdgeCache[WEST_EDGING] = image('icons/fallout/turfs/ground.dmi', "wasteland_side_w", layer = TURF_LAYER)
	if(istype(src, /turf/open/indestructible/ground/desert))
		src.overlays -= desertTurfEdgeCache[NORTH_EDGING]
		src.overlays -= desertTurfEdgeCache[SOUTH_EDGING]
		src.overlays -= desertTurfEdgeCache[EAST_EDGING]
		src.overlays -= desertTurfEdgeCache[WEST_EDGING]
		return
	if(istype(get_step(src, NORTH), /turf/open/indestructible/ground/desert))
		src.overlays |= desertTurfEdgeCache[NORTH_EDGING]
	if(istype(get_step(src, SOUTH), /turf/open/indestructible/ground/desert))
		src.overlays |= desertTurfEdgeCache[SOUTH_EDGING]
	if(istype(get_step(src, EAST), /turf/open/indestructible/ground/desert))
		src.overlays |= desertTurfEdgeCache[EAST_EDGING]
	if(istype(get_step(src, WEST), /turf/open/indestructible/ground/desert))
		src.overlays |= desertTurfEdgeCache[WEST_EDGING]

/turf/closed/updateDesertOverlays()
	return

/turf/open/indestructible/ground/desert/updateDesertOverlays()
	return