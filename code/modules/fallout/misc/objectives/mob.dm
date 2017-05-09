/mob/proc/show_objectives(var/mob/user)
	if(!mind || !mind.objective)
		return
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
				Role Objective:
			</td>
			<td>
				<b>[mind.objective.name]<b><br>
				<i>[mind.objective.desc]</i>
			</td>
		</tr>
	</table>
	"}
	var/datum/browser/popup = new(user, "objectives", "<div align='center'>Objectives</div>", 640, 350)
	popup.set_content(html)
	popup.open(0)

/mob/verb/see_objectives()
	set name = "Objectives"
	set category = "IC"
	show_objectives(src)