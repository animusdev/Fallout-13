/mob/proc/show_objectives(var/mob/user)
	if(!mind || !mind.objective)
		return
	var/objective_completed = "<font color='#ff0000'>&#10008;</font>"
	if(mind.objective.parent.check_complete(mind.objective))
		objective_completed = "<font color='#00ff00'>&#10004;</font>"
	var/html = {"
	<table>
		<tr>
			<td>
				Faction Objective:
			</td>
			<td>

			</td>
		</tr>
		<tr>
			<td>
				[objective_completed] Role Objective:
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