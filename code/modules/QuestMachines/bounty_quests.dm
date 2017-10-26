/*
	Quest contain information about items needs to complete them.
	And reward in caps
*/
/datum/bounty_quest
	var/name = "Default Quest Name"
	var/desc = "Default Quest Description"
	var/employer = "Default Employer"

	/* This items needs to complete this quest */
	var/list/target_items = list()

	/* How many caps will spawned after quest complete */
	var/caps_reward = 10

	/* Will show to player, when quest is complete */
	var/end_message = "*beep* Sended. Caps Recieved."

	var/need_message = "Need some items"

	var/employer_icon_folder = "icons/bounty_employers/"

	var/employer_icon = "employer_00.png"

/datum/bounty_quest/proc/ItsATarget(var/target)
	for(var/target_type in target_items)
		if(istype(target, target_type))
			return 1
	return 0

/datum/bounty_quest/proc/GetIconWithPath()
	return text2path("[employer_icon_folder][employer_icon]")

/datum/bounty_quest/faction/wasteland/qst_0
	name = "�������� � ��� ����������"
	desc = "������� ��� ��� ������! � ��� ������ � ������������ ��������! ����... �� �����... � ����� � ��� ���������� ��� �������� � �� �������� �� 5 ��� �����, ����� ��� �������."
	employer = "������ ������"
	employer_icon = "employer_00.png"
	need_message = "5 �����"
	end_message = "�������! ���������� �������! ���������� ��� ���� ������."
	target_items = list(/mob/living/simple_animal/hostile/ghoul = 5)
	caps_reward = 226

/datum/bounty_quest/faction/wasteland/qst_1
	employer = "����������� ��������� �������"
	need_message = "����� � ���������� - 1 ��."
	target_items = list(/obj/structure/reagent_dispensers/barrel/dangerous = 1)
	caps_reward = 100

/datum/bounty_quest/faction/wasteland/qst_2
	employer = "������� �������"
	need_message = "����� - 2 ��."
	target_items = list(/mob/living/simple_animal/hostile/molerat = 2)
	caps_reward = 60

/datum/bounty_quest/faction/wasteland/qst_3
	employer = "������ ������"
	need_message = "���� - 1 ��."
	target_items = list(/mob/living/simple_animal/hostile/ghoul = 1)
	caps_reward = 51

/datum/bounty_quest/faction/wasteland/qst_4
	employer = "���"
	need_message = "������������ ����� - 3 ��."
	target_items = list(/obj/item/organ/tongue = 3)
	caps_reward = 127

/datum/bounty_quest/faction/wasteland/qst_5
	employer = "������ ��������"
	need_message = "������ ������ - 1 ��."
	target_items = list(/mob/living/simple_animal/hostile/deathclaw = 1)
	caps_reward = 304

/datum/bounty_quest/faction/wasteland/qst_6
	employer = "����� ������� ��������"
	need_message = "����� �������� - 5 ��."
	target_items = list(/obj/item/stack/sheet/animalhide = 5)
	caps_reward = 103

/datum/bounty_quest/faction/wasteland/qst_7
	employer = "ERP-75"
	need_message = "������������ ���� - 5 ��."
	target_items = list(/mob/living/carbon/human = 5)
	caps_reward = 324

/datum/bounty_quest/faction/wasteland/qst_8
	employer = "������ ��������"
	need_message = "������ ������ - 2 ��."
	target_items = list(/mob/living/simple_animal/hostile/deathclaw = 2)
	caps_reward = 712

/datum/bounty_quest/faction/wasteland/qst_9
	employer = "����� �����"
	need_message = "����� ������ - 20 ��."
	target_items = list(/obj/item/weapon/paper = 20)
	caps_reward = 78

/datum/bounty_quest/faction/wasteland/qst_10
	employer = "�������"
	need_message = "�������� - 10 ��."
	target_items = list(/obj/item/weapon/reagent_containers/food/snacks/grown/corn = 10)
	caps_reward = 59

/datum/bounty_quest/faction/wasteland/qst_11
	employer = "�������"
	need_message = "�������� - 30 ��."
	target_items = list(/obj/item/weapon/reagent_containers/food/snacks/grown/corn = 30)
	caps_reward = 204

/datum/bounty_quest/faction/wasteland/qst_12
	employer = "�������"
	need_message = "�������� - 10 ��."
	target_items = list(/obj/item/weapon/reagent_containers/food/snacks/grown/carrot = 10)
	caps_reward = 75

/datum/bounty_quest/faction/wasteland/qst_13
	employer = "�������"
	need_message = "�������� - 30 ��."
	target_items = list(/obj/item/weapon/reagent_containers/food/snacks/grown/carrot = 30)
	caps_reward = 302

/datum/bounty_quest/faction/wasteland/qst_14
	employer = "����� ���� ������"
	need_message = "���� �������� - 10 ��."
	target_items = list(/obj/item/weapon/reagent_containers/food/snacks/grown/cannabis = 10)
	caps_reward = 302

/datum/bounty_quest/faction/wasteland/qst_15
	employer = "����� ���� ������"
	need_message = "���� �������� - 30 ��."
	target_items = list(/obj/item/weapon/reagent_containers/food/snacks/grown/cannabis = 30)
	caps_reward = 1203

/datum/bounty_quest/faction/wasteland/qst_16
	employer = "����� ���� ������"
	need_message = "���� ������ - 10 ��."
	target_items = list(/obj/item/weapon/reagent_containers/food/snacks/grown/tobacco = 10)
	caps_reward = 167

/datum/bounty_quest/faction/wasteland/qst_17
	employer = "�����������"
	need_message = "���� - 3 ��."
	target_items = list(/mob/living/simple_animal/hostile/wolf = 3)
	caps_reward = 164

/datum/bounty_quest/faction/wasteland/qst_18
	employer = "���������"
	need_message = "������� ������ - 10 ��."
	target_items = list(/obj/item/weapon/shard = 10)
	caps_reward = 91

/datum/bounty_quest/faction/wasteland/qst_19
	employer = "����� ������"
	need_message = "��������� - 2 ��."
	target_items = list(/mob/living/simple_animal/hostile/rad_scorpion/black  = 2)
	caps_reward = 152