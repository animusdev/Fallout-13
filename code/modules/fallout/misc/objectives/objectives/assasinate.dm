/datum/f13_objective/assassinate
	name = "Assassinate"
	desc = "Dis motherfucker killed your father"
	difficulty = 0

	assignto(datum/mind/M, var/list/data = list())
		data["target"] = pick(ticker.minds)
		data["custom_desc"] = "Your target: <b>[data["target"]]</b>"
		..()