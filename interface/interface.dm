//Please use mob or src (not usr) in these procs. This way they can be called in the same fashion as procs.

/client/verb/discord()
	set name = "Discord"
	set desc = "Visit the discord."
	set hidden = 1
	if(config.discordurl)
		if(alert("This will open the discord in your browser. Are you sure?",,"Yes","No")=="No")
			return
		src << link(config.discordurl)
	else
		src << "<span class='danger'>The wiki URL is not set in the server configuration.</span>"
	return

/client/verb/wiki()
	set name = "Wiki"
	set desc = "Visit the wiki."
	set hidden = 1
	if(config.wikiurl)
		if(alert("This will open the wiki in your browser. Are you sure?",,"Yes","No")=="No")
			return
		src << link(config.wikiurl)
	else
		src << "<span class='danger'>The wiki URL is not set in the server configuration.</span>"
	return

/client/verb/vk()
	set name = "VK"
	set desc = "Visit the VK."
	set hidden = 1
	if(config.forumurl)
		if(alert("This will open the forum in your browser. Are you sure?",,"Yes","No")=="No")
			return
		src << link(config.forumurl)
	else
		src << "<span class='danger'>The forum URL is not set in the server configuration.</span>"
	return

/client/verb/rules()
	set name = "Rules"
	set desc = "Show Server Rules."
	set hidden = 1
	src << browse('html/rules.html', "size=320x160;window=rules")
	return
/*
/client/verb/github()
	set name = "Bug Tracker"
	set desc = "Tell us about bugs"
	set hidden = 1
	if(config.githuburl)
		if(alert("This will open the Github repository in your browser. Are you sure?",,"Yes","No")=="No")
			return
		src << link(config.githuburl)
	else
		src << "<span class='danger'>The Github URL is not set in the server configuration.</span>"
	return
*/
/client/verb/reportissue()
	set name = "Report issue"
	set desc = "Report an issue"
	set hidden = 1
	if(config.githuburl)
		if(alert("This will open the BitBucket issue reporter in your browser. Are you sure?",,"Yes","No")=="No")
			return
		src << link("[config.githuburl]")
	else
		src << "<span class='danger'>The BitBucket URL is not set in the server configuration.</span>"
	return

/client/verb/hotkeys_help()
	set name = "hotkeys-help"
	set category = "OOC"

	var/adminhotkeys = {"<font color='purple'>
Admin:
\tF5 = admin chat (asay)
\tF6 = player-panel
\tF7 = admin-pm
\tF8 = Invisimin
\tF9 = aghost
\tF11 = buildmode
</font>"}

	mob.hotkey_help()

	if(holder)
		src << adminhotkeys


/mob/proc/hotkey_help()
	var/hotkey_mode = {"<font color='purple'>
Hotkey-Mode: (hotkey-mode must be on)
\tTAB = toggle hotkey-mode
\ta = left
\ts = down
\td = right
\tw = up
\tq = drop
\te = equip
\tr = throw
\tm = me
\tt = say
\to = OOC
\tb = resist
\tx = swap-hand
\tz = activate held object (or y)
\tf = cycle-intents-left
\tg = cycle-intents-right
\t1 = help-intent
\t2 = disarm-intent
\t3 = grab-intent
\t4 = harm-intent
</font>"}

	var/other = {"<font color='purple'>
Any-Mode: (hotkey doesn't need to be on)
\tF1 = admin help (ahelp)
\tF2 = OOC
\tF3 = say
\tF4 = emote (me)
\tCtrl+a = left
\tCtrl+s = down
\tCtrl+d = right
\tCtrl+w = up
\tCtrl+q = drop
\tCtrl+e = equip
\tCtrl+r = throw
\tCtrl+b = resist
\tCtrl+O = OOC
\tCtrl+x = swap-hand
\tCtrl+z = activate held object (or Ctrl+y)
\tCtrl+f = cycle-intents-left
\tCtrl+g = cycle-intents-right
\tCtrl+1 = help-intent
\tCtrl+2 = disarm-intent
\tCtrl+3 = grab-intent
\tCtrl+4 = harm-intent
\tDEL = pull
\tINS = cycle-intents-right
\tHOME = drop
\tPGUP = swap-hand
\tPGDN = activate held object
\tEND = throw
</font>"}

	src << hotkey_mode
	src << other

/mob/living/silicon/robot/hotkey_help()
	var/hotkey_mode = {"<font color='purple'>
Hotkey-Mode: (hotkey-mode must be on)
\tTAB = toggle hotkey-mode
\ta = left
\ts = down
\td = right
\tw = up
\tq = unequip active module
\tt = say
\to = OOC
\tx = cycle active modules
\tb = resist
\tz = activate held object (or y)
\tf = cycle-intents-left
\tg = cycle-intents-right
\t1 = activate module 1
\t2 = activate module 2
\t3 = activate module 3
\t4 = toggle intents
</font>"}

	var/other = {"<font color='purple'>
Any-Mode: (hotkey doesn't need to be on)
\tCtrl+a = left
\tCtrl+s = down
\tCtrl+d = right
\tCtrl+w = up
\tCtrl+q = unequip active module
\tCtrl+x = cycle active modules
\tCtrl+b = resist
\tCtrl+o = OOC
\tCtrl+z = activate held object (or Ctrl+y)
\tCtrl+f = cycle-intents-left
\tCtrl+g = cycle-intents-right
\tCtrl+1 = activate module 1
\tCtrl+2 = activate module 2
\tCtrl+3 = activate module 3
\tCtrl+4 = toggle intents
\tDEL = pull
\tINS = toggle intents
\tPGUP = cycle active modules
\tPGDN = activate held object
</font>"}

	src << hotkey_mode
	src << other

// Needed to circumvent a bug where .winset does not work when used on the window.on-size event in skins.
// Used by /datum/html_interface/nanotrasen (code/modules/html_interface/nanotrasen/nanotrasen.dm)
/client/verb/_swinset(var/x as text)
	set name = ".swinset"
	set hidden = 1
	winset(src, null, x)
