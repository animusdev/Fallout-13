
	//The mob should have a gender you want before running this proc. Will run fine without H
/datum/preferences/proc/random_character(gender_override)
	if(gender_override)
		gender = gender_override
	else
		gender = pick(MALE,FEMALE)
	underwear = null
	undershirt = null
	socks = null
	skin_tone = random_skin_tone()
	hair_style = random_hair_style(gender)
	facial_hair_style = random_facial_hair_style(gender)
	hair_color = random_short_color()
	facial_hair_color = hair_color
	eye_color = random_eye_color()
	if(!pref_species)
		var/rando_race = pick(config.roundstart_races)
		pref_species = new rando_race()
	backbag = 1
	features = random_features()
	age = rand(AGE_MIN,AGE_MAX)

/datum/preferences/proc/update_preview_icon()
	// Silicons only need a very basic preview since there is no customization for them.
	if(job_engsec_high)
		switch(job_engsec_high)
			if(AI)
				preview_icon = icon('icons/mob/AI.dmi', "AI", SOUTH)
				preview_icon.Scale(64, 64)
				return
			if(CYBORG)
				preview_icon = icon('icons/mob/robots.dmi', "robot", SOUTH)
				preview_icon.Scale(64, 64)
				return

	copy_to(mannequin)
	CHECK_TICK
	if(selected_job)
		var/datum/outfit/O = GetOutfit(selected_job.type)
		mannequin.job = selected_job.title
		selected_job.equip(mannequin, TRUE, override_outfit = O)

	CHECK_TICK
	preview_icon = icon('icons/effects/effects.dmi', "nothing")
	preview_icon.Scale(48+32, 16+32)
	CHECK_TICK
	mannequin.setDir(NORTH)

	var/icon/stamp = getFlatIcon(mannequin)
	CHECK_TICK
	preview_icon.Blend(stamp, ICON_OVERLAY, 25, 17)
	CHECK_TICK
	mannequin.setDir(WEST)
	stamp = getFlatIcon(mannequin)
	CHECK_TICK
	preview_icon.Blend(stamp, ICON_OVERLAY, 1, 9)
	CHECK_TICK
	mannequin.setDir(SOUTH)
	stamp = getFlatIcon(mannequin)
	CHECK_TICK
	preview_icon.Blend(stamp, ICON_OVERLAY, 49, 1)
	CHECK_TICK
	preview_icon.Scale(preview_icon.Width() * 2, preview_icon.Height() * 2) // Scaling here to prevent blurring in the browser.
	CHECK_TICK
	for (var/obj/item/I in mannequin.get_equipped_items())
		mannequin.unEquip(I, TRUE)
		PlaceInPool(I, FALSE)
	for (var/obj/item/I in mannequin.held_items)
		mannequin.unEquip(I, TRUE)
		PlaceInPool(I, FALSE)