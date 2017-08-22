/datum/bounty_quest/faction/city/qst_0
	name = "Перебои с поставками"
	desc = "Прием! Прием! Мы в критическом положении. На наше поселение напали рейдеры, мы вынуждены были бежать. Теперь мы засели в этом чертовом ангаре без еды. Если вы отправите нам провиант, то мы отдадим вам все наши крышки! Пожалуйста, мы в критическом положении!"
	employer = "Поселенцы Чикаго"
	employer_icon = "employer_00.png"
	need_message = "50 едениц провианта (кукуруза, картошка и т.д.)"
	end_message = "Спасибо огромное! Теперь мы сможем пересидеть это все сытыми!"
	target_items = list(/obj/item/weapon/reagent_containers/food/snacks/grown = 50)
	caps_reward = 1500

/datum/bounty_quest/faction/city/qst_1
	name = "Эксперименты над крысами"
	desc = "Мы тут продолжаем изучать влияние радиции на животных. Данные из вашего района очень интересные. Отправте ка нам побольше крыс."
	employer = "Ученый совет"
	employer_icon = "employer_00.png"
	need_message = "15 радиокативных крыс."
	end_message = "То что надо! Держите крышки!"
	target_items = list(/mob/living/simple_animal/hostile/molerat = 15)
	caps_reward = 2000