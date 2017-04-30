/proc/priority_announce(text, title = "", sound = 'sound/f13music/quest.ogg', type)
	if(!text)
		return

	var/announcement

	if(type == "Priority")
		announcement += "<h1 class='alert'>Emergency Broadcast</h1>"
		if (title && length(title) > 0)
			announcement += "<br><h2 class='alert'>[html_encode_ru(title)]</h2>"
	else if(type == "Captain")
		announcement += "<h1 class='alert'>President's speech:</h1>"
		news_network.SubmitArticle(text, "President", "Wasteland Chronicle", null)

	else
		announcement += "<h1 class='alert'>[command_name()]</h1>"
		if (title && length(title) > 0)
			announcement += "<br><h2 class='alert'>[html_encode_ru(title)]</h2>"
		if(title == "")
			news_network.SubmitArticle(text, "radio broadcast stenography", "Wasteland Chronicle", null)
		else
			news_network.SubmitArticle(title + "<br><br>" + text, "radio broadcast stenography", "Wasteland Chronicle", null)

	announcement += "<br><span class='alert'>[html_encode_ru(text)]</span><br>"
	announcement += "<br>"

	for(var/mob/M in player_list)
		if(!isnewplayer(M) && !M.ear_deaf)
			to_chat(M, announcement)
			if(M.client.prefs.toggles & SOUND_ANNOUNCEMENTS)
				to_chat(M, sound(sound))

/proc/print_command_report(text = "", title = "radio broadcast stenography")
	for (var/obj/machinery/computer/communications/C in machines)
		if(!(C.stat & (BROKEN|NOPOWER)) && C.z == ZLEVEL_STATION)
			var/obj/item/weapon/paper/P = new /obj/item/weapon/paper( C.loc )
			P.name = "paper- '[title]'"
			P.info = text
			C.messagetitle.Add("[title]")
			C.messagetext.Add(text)
			P.update_icon()

/proc/minor_announce(message, title = "Attention:", alert)
	if(!message)
		return

	for(var/mob/M in player_list)
		if(!isnewplayer(M) && !M.ear_deaf)
			to_chat(M, "<b><font size = 3><font color = red>[title]</font color><BR>[message]</font size></b><BR>")
			if(M.client.prefs.toggles & SOUND_ANNOUNCEMENTS)
				if(alert)
					to_chat(M, sound('sound/misc/notice1.ogg'))
				else
					to_chat(M, sound('sound/misc/notice2.ogg'))
