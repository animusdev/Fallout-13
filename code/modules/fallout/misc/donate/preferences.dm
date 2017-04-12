/datum/preferences/proc/ShowCharacterSetup(mob/user)
	if(!user || !user.client)
		return
	if(update_preview)
		update_preview_icon()
		update_preview = 0
		CHECK_TICK
		user << browse_rsc(preview_icon, "previewicon.png")
		CHECK_TICK
	if(parent)
		parent.update_donate_data()
	CHECK_TICK
	if(!choiced_faction)
		choiced_faction = get_faction_datum("none")

	var/saves_data
	if(path)
		var/savefile/S = new /savefile(path)
		if(S)
			saves_data += "<center>"
			var/name
			for(var/i=1, i<=max_save_slots, i++)
				S.cd = "/character[i]"
				S["real_name"] >> name
				if(!name)
					name = "Character[i]"
					//if(i!=1) dat += " | "
				saves_data += "<a href='?_src_=prefs;preference=changeslot;num=[i];' [i == default_slot ? "class='linkOn'" : ""]>[name]</a> "
			saves_data += "</center>"
	CHECK_TICK
	var/factions_data
	if(parent && parent.allowed_factions)
		for(var/i = choiced_faction_index to choiced_faction_index + 3)
			if(i > parent.allowed_factions.len)
				break
			var/datum/f13_faction/faction = parent.allowed_factions[i]
			factions_data += "<a href='?_src_=prefs;preference=faction;task=input;faction_id=[faction.id];' data-tooltip=\"[faction.full_name]\"  class='tooltip[faction == choiced_faction ? " linkOn" : ""]'>[faction.name]</a>"
	if(!factions_data)
		factions_data = "No available factions"
	CHECK_TICK
	var/jobs_data
	if(parent && parent.allowed_factions)
		for(var/datum/job/j in SSjob.occupations)
			if(j.faction == choiced_faction.id)
				var/available = parent.mob.IsJobAvailable(null, j)
				if(available)
					var/job_class = "disabled_job"
					var/prefUpperLevel = 3
					if(GetJobDepartment(j, 1) & j.flag)
						job_class = "high_job"
						prefUpperLevel = 4
					else if(GetJobDepartment(j, 2) & j.flag)
						job_class = "middle_job"
						prefUpperLevel = 1
					else if(GetJobDepartment(j, 3) & j.flag)
						job_class = "low_job"
						prefUpperLevel = 2

					jobs_data += "<a class=\"l70 [job_class][j.flag == choiced_job_flag && j.department_flag == choiced_department_flag? " linkOn" : ""] tooltip\" data-tooltip=\"Role description\" href='?_src_=prefs;preference=job_equip;task=input;job_key=[j.flag];level=[prefUpperLevel];rank=[j.title];department_key=[j.department_flag];'>[j.title]</a>"
				else
					jobs_data += "<span class=\"170 linkOff\">[j.title]</span>"
	if(!jobs_data)
		jobs_data = "<span class=\"170\">No available roles</span>"
	CHECK_TICK

	var/list/data = list(
	"[saves_data]",
	"[be_random_name ? "Yes" : "No"]",
	"[real_name]",

	"[gender == MALE ? "Male" : "Female"]",
	"[age]",
	"[be_random_body ? "Yes" : "No"]",
	"[pref_species ? pref_species.name : "Human"]",
	"[skin_tone]",
	"[factions_data]",
	"[choiced_faction.id]",
	"[choiced_faction.full_name]",
	"[choiced_faction.description]",
	"helm",
	"armor",
	"uniform",
	"shoes",
	"[jobs_data]",
	"gloves",
	"pocket_1",
	"weapon",
	"pocket_2",
	"[hair_style]",
	"#[hair_color]",
	"[facial_hair_style]",
	"#[facial_hair_color]",
	"#[eye_color]",



	)
	CHECK_TICK

	var/html = text("<center>\
	<a href='?_src_=prefs;preference=tab;tab=0' class='linkOn'>Character Settings</a> <a href='?_src_=prefs;preference=tab;tab=1' >Game Preferences</a>\
	</center>\
	<HR>\
	<center>\
	[]\
	</center>\
	<div class=\"first_block\">\
		<h2>Identity</h2>\
		<table width='100%'>\
			<tr>\
				<td width='75%' valign='top'>\
					<a href='?_src_=prefs;preference=name;task=random'>Random Name</a>\
					<a href='?_src_=prefs;preference=name'>Always Random Name: []</a>\
					<br>\
					<b>Name:</b>\
					<a href='?_src_=prefs;preference=name;task=input'>[]</a>\
					<br>\
					<b>Gender:</b> \
					<a href='?_src_=prefs;preference=gender'>[]</a>\
					<br>\
					<b>Age:</b> \
					<a href='?_src_=prefs;preference=age;task=input'>[]</a>\
					<br>\
				</td>	\
				<!--<td valign='center'>\
					<div class='statusDisplay'><center><img src=\"img/person.png\" width=160 height=96></center></div>\
				</td-->\
			</tr>\
		</table>\
	</div>\
	<div class=\"second_block\">\
		<h2>Body</h2>\
		<table>\
			<tr>\
				<td>\
					<a href='?_src_=prefs;preference=all;task=random'>Random Body</a>\
				</td>\
				<td>\
					<a href='?_src_=prefs;preference=all'>Always Random Body: []</a><br>\
				</td>\
			</tr>\
			<tr>\
				<td>\
					<b>Species:</b>\
				</td>\
				<td>\
					<b>Skin Tone</b>\
				</td>\
			</tr>\
			<tr>\
				<td>\
					<a href='?_src_=prefs;preference=species;task=input'>[]</a>\
				</td>\
				<td>\
					<a href='?_src_=prefs;preference=s_tone;task=input'>[]</a>\
				</td>\
			</tr>\
			\
		</table>\
	</div>\
	<div class=\"third_block\">\
		<div class=\"third_block_39\">\
			<h3>Choose your faction</h3><br>\
			<div class=\"a_block\">\
				[]\
			</div>\
			\
			<div class=\"left_block_table\">\
				<a href='?_src_=prefs;task=faction_previous'>&lt;</a> \
				<a href='?_src_=prefs;task=faction_next'>&gt;</a>\
				<div class=\"frame\">\
					<div class=\"wrap_frame\">\
						<center>\
							<div class=\"leg_img\">\
								<img src=\"[].png\" alt=\"logo\">\
							</div>\
						</center>\
						<b><center>[]</center></b>\
						[]\
					</div>\
					\
				</div>\
			</div>\
			<div class=\"right_block_frame\">\
				<div class=\"right_block_frame_item\">\
					<h3>Headgear</h3>\
					<a href='?_src_=prefs;preference=helmet;task=input;gear=head;'>[]</a><br>\
					<a href='?_src_=prefs;preference=previous_helmet;task=input'>&lt;</a> \
					<a href='?_src_=prefs;preference=next_helmet;task=input'>&gt;</a>\
				</div>\
				<div class=\"right_block_frame_item\">\
					<h3>Armor</h3>\
					<a href='?_src_=prefs;preference=armor;task=input'>[]</a><br>\
					<a href='?_src_=prefs;preference=previous_armor;task=input'>&lt;</a> \
					<a href='?_src_=prefs;preference=next_armor;task=input'>&gt;</a>\
				</div>\
				<div class=\"right_block_frame_item\">\
					<h3>Uniform</h3>\
					<a href='?_src_=prefs;preference=uniform;task=input'>[]</a><br>\
					<a href='?_src_=prefs;preference=previous_uniform;task=input'>&lt;</a> \
					<a href='?_src_=prefs;preference=next_uniform;task=input'>&gt;</a>\
				</div>\
				<div class=\"right_block_frame_item\">\
					<h3>Shoes</h3>\
					<a href='?_src_=prefs;preference=shoes;task=input'>[]</a><br>\
					<a href='?_src_=prefs;preference=previous_shoes;task=input'>&lt;</a> \
					<a href='?_src_=prefs;preference=next_shoes;task=input'>&gt;</a>\
				</div>\
			</div>\
		</div><!--1 блок 39-->\
		<div class=\"third_block_39 job\">\
		<h3>Choose your role</h3><br>\
			<div class=\"job_p\">\
				[]\
			</div>\
			<div class=\"middle_img\">\
				<img src=\"previewicon.png\" width=\"160\" height=\"96\" alt=\"player-preview\">\
			</div>\
			<div class=\"middle_text\">\
				<div class=\"left_mid\">\
					<div class=\"mid_item\">\
						<h3>Gloves</h3>\
						<a href='?_src_=prefs;preference=gloves;task=input'>[]</a><br>\
						<a href='?_src_=prefs;preference=previous_gloves;task=input'>&lt;</a> \
						<a href='?_src_=prefs;preference=next_gloves;task=input'>&gt;</a>\
					</div>\
					<div class=\"mid_item\">\
						<h3>Pocket 1</h3>\
						<a href='?_src_=prefs;preference=pocket_1;task=input'>[]</a><br>\
						<a href='?_src_=prefs;preference=previous_pocket_1;task=input'>&lt;</a> \
						<a href='?_src_=prefs;preference=next_pocket_1;task=input'>&gt;</a>\
					</div>\
				</div>\
				<div class=\"right_mid\">\
					<div class=\"mid_item\">\
						<h3>Weapon</h3>\
						<a href='?_src_=prefs;preference=weapon;task=input'>[]</a><br>\
						<a href='?_src_=prefs;preference=previous_weapon;task=input'>&lt;</a> \
						<a href='?_src_=prefs;preference=next_weapon;task=input'>&gt;</a>\
					</div>\
					<div class=\"mid_item\">\
						<h3>Pocket 2</h3>\
						<a href='?_src_=prefs;preference=pocket_2;task=input'>[]</a><br>\
						<a href='?_src_=prefs;preference=previous_pocket_2;task=input'>&lt;</a> \
						<a href='?_src_=prefs;preference=next_pocket_2;task=input'>&gt;</a>\
					</div>\
				</div>\
				</div>\
			</div>\
			\
		</div>\
		<div class=\"right_block\">\
					<table>\
					<tr>\
						<td valign='top' width='21%'>\
							<h3>Hair Style</h3>\
							<a href='?_src_=prefs;preference=hair_style;task=input'>[]</a><br>\
							<a href='?_src_=prefs;preference=previous_hair_style;task=input'>&lt;</a> \
							<a href='?_src_=prefs;preference=next_hair_style;task=input'>&gt;</a><br>\
							<span style='border:1px solid #161616; background-color: [];'>&nbsp;&nbsp;&nbsp;</span> \
							<a href='?_src_=prefs;preference=hair;task=input'>Change</a><br>\
						</td>\
					</tr>\
				</table>\
				<table>\
					<tr>\
						<td valign='top' width='21%'>\
							<h3>Facial Hair Style</h3>\
							<a href='?_src_=prefs;preference=facial_hair_style;task=input'>[]</a><br>\
							<a href='?_src_=prefs;preference=previous_facehair_style;task=input'>&lt;</a> <a href='?_src_=prefs;preference=next_facehair_style;task=input'>&gt;</a><br><span style='border: 1px solid #161616; background-color: [];'>&nbsp;&nbsp;&nbsp;</span>\
							<a href='?_src_=prefs;preference=facial;task=input'>Change</a><br>\
						</td>\
					</tr>\
				</table>\
				<table>\
					<tr>\
						<td valign='top' width='21%'>\
							<h3>Eye Color</h3>\
							<span style='border: 1px solid #161616; background-color: [];'>&nbsp;&nbsp;&nbsp;</span> \
							<a href='?_src_=prefs;preference=eyes;task=input'>Change</a><br>\
						</td>\
					</tr>\
				</table>\
				</div>\
				<div class=\"clearBoth g\" ></div>\
				<hr><center>\
				<a href='?_src_=prefs;preference=load'>Undo</a>\
				<a href='?_src_=prefs;preference=save'>Save Setup</a>\
				<a href='?_src_=prefs;preference=reset_all'>Reset Setup</a>\
				</center>", 						 data[1], data[2], data[3], data[4],
													 data[5], data[6], data[7], data[8],
													 data[9], data[10], data[11], data[12],
													 data[13], data[14], data[15], data[16],
													 data[17], data[18], data[19], data[20],
													 data[21], data[22], data[23], data[24],
													 data[25], data[26])
	CHECK_TICK
	var/datum/browser/popup = new(user, "preferences", "<div align='center'>Character Setup</div>", 640, 750)
	popup.set_content(html)
	popup.open(0)
	return 1