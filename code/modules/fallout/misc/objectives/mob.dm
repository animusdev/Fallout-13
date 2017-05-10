/mob/proc/show_objectives(var/mob/user)
	var/datum/f13_faction/F = get_faction_datum(social_faction)

	if(!mind)
		return
	if(!mind.objective || !F.objective)
		to_chat(user, "<span class='danger'>No objectives!</span>")
		return
	var/objective_completed_ind = "<font color='#ff0000'>&#10008;</font>"
	if(mind.objective.parent.check_complete(mind.objective))
		objective_completed_ind = "<font color='#00ff00'>&#10004;</font>"

	var/objective_completed_fac = "<font color='#ff0000'>&#10008;</font>"
	if(F.objective.parent.check_complete(F.objective))
		objective_completed_fac = "<font color='#00ff00'>&#10004;</font>"

	var/html = {"
	<table>
		<tr>
			<td>
				[objective_completed_fac] Faction Objective:
			</td>
			<td>
				<b>[F.objective.parent.name]</b><br>
				<i>[FormatText(F.objective.parent.desc, F.objective.data)]</i><br>
				[FormatText(F.objective.data["custom_desc"],F.objective.data)]
			</td>
		</tr>
		<tr>
			<td>
				[objective_completed_ind] Role Objective:
			</td>
			<td>
				<b>[mind.objective.parent.name]</b><br>
				<i>[FormatText(mind.objective.parent.desc, mind.objective.data)]</i><br>
				[FormatText(mind.objective.data["custom_desc"],mind.objective.data)]
			</td>
		</tr>
	</table>
	"}
	var/datum/browser/popup = new(user, "objectives", "<div align='center'>Objectives</div>", 500, 200)
	popup.set_content(html)
	popup.open(0)

/mob/verb/see_objectives()
	set name = "Objectives"
	set category = "IC"
	show_objectives(src)