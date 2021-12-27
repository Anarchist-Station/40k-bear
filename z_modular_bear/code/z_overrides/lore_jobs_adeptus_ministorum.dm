//Due to how large this one is it gets its own file. Sister of Battle and all her stuff including items, excluding weapons those are in mattguns.dm, is also located here.

//Confessor


/datum/job/chaplain
	title = "High Priestess"
	department = "Ministorum"
	department_flag = CIV|COM
	total_positions = 1
	spawn_positions = 1
	open_when_dead = 1
	social_class = SOCIAL_CLASS_HIGH
	latejoin_at_spawnpoints = TRUE
	supervisors = "the House Nobility, and the Gods of Biblio"
	selection_color = "#FCFBFA"
	access = list(access_heads, access_morgue, access_chapel_office, access_crematorium, access_maint_tunnels, access_sob)
	minimal_access = list(access_heads, access_morgue, access_chapel_office, access_crematorium, access_sob)
	announced = FALSE
//	alt_titles = list("Counselor")
	outfit_type = /decl/hierarchy/outfit/job/chaplain
	auto_rifle_skill = 2
	semi_rifle_skill = 2
	sniper_skill = 2
	shotgun_skill = 2
	lmg_skill = 2
	smg_skill = 2
	melee_skill = 4
	ranged_skill = 2
	medical_skill = 8
	engineering_skill = 0
	surgery_skill = 8


	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Priestess [current_name]")
		H.add_stats(rand(10,13), rand(10,13), rand(10,12), rand(12,16)) //frail and holy
		H.get_idcard()?.access = list(access_heads, access_security, access_sec_doors, access_brig, access_forensics_lockers, access_all_personal_lockers, access_maint_tunnels, access_sob,)
		H.warfare_language_shit(LANGUAGE_HIGH_GOTHIC)
		H.warfare_faction = IMPERIUM
		H.gender = FEMALE
		H.add_spell(new /spell/radiant_aura/light)
		H.add_spell(new /spell/targeted/heal_target)
		H.add_spell(new /spell/targeted/heal_target/sacrifice)
		H.add_spell(new /spell/noclothes)

		to_chat(H, "<span class='notice'><b><font size=3>You are the Head Priestess: healer, and the Godhead-Speaker, a devout follower of the Old Gods that exhonerates their worship and shuns the false idol of the Fleet's Insignia. You are able to find more information about the Gods in the books in your office and are encouraged to hold sermons in their name. Beyond spiritual matters, your church also has a medical area that you may tend to the wounded with. You have also been blessed with insight into the anatomy of people, so you are able to heal them and perform surgery, although you should leave this to your Head Aide. Although the worship of the Old Gods has been forbidden, surely, the Fleet dare not attack a holy place.</font></b></span>")



	equip(var/mob/living/carbon/human/H, var/alt_title, var/ask_questions = TRUE)
		. = ..()
		if(!.)
			return
		if(!ask_questions)
			return

		var/obj/item/storage/bible/B = locate(/obj/item/storage/bible) in H
		if(!B)
			return

		spawn(0)
			var/religion_name = "the olden Gods"
			var/new_religion = sanitize(input(H, "You are a holy priest of the Olden Gods. Your resolve is clear.", "Name change", religion_name), MAX_NAME_LEN)

			if (!new_religion)
				new_religion = religion_name
			switch(lowertext(new_religion))
				if("imperium")
					B.SetName("Uplifting Primer")
				else
					B.SetName("The Holy Book of [new_religion]")
			feedback_set_details("religion_name","[new_religion]")

		spawn(1)
			var/deity_name = "Eurydale"
			var/new_deity = sanitize(input(H, "Would you like to change your deity? Default is Eurydale", "Name change", deity_name), MAX_NAME_LEN)

			if ((length(new_deity) == 0) || (new_deity == "Allfather") )
				new_deity = deity_name
			B.deity_name = new_deity

			var/accepted = 0
			var/outoftime = 0
			spawn(200) // 20 seconds to choose
				outoftime = 1
			var/new_book_style = "Bible"

			while(!accepted)
				if(!B) break // prevents possible runtime errors
				new_book_style = input(H,"Which bible style would you like?") in list("Bible", "Koran", "Scrapbook", "Creeper", "White Bible", "Holy Light", "Athiest", "Tome", "The King in Yellow", "Ithaqua", "Scientology", "the bible melts", "Necronomicon")
				switch(new_book_style)
					if("Koran")
						B.icon_state = "koran"
						B.item_state = "koran"
					if("Scrapbook")
						B.icon_state = "scrapbook"
						B.item_state = "scrapbook"
					if("Creeper")
						B.icon_state = "creeper"
						B.item_state = "syringe_kit"
					if("White Bible")
						B.icon_state = "white"
						B.item_state = "syringe_kit"
					if("Holy Light")
						B.icon_state = "holylight"
						B.item_state = "syringe_kit"
					if("Athiest")
						B.icon_state = "athiest"
						B.item_state = "syringe_kit"
					if("Tome")
						B.icon_state = "tome"
						B.item_state = "syringe_kit"
					if("The King in Yellow")
						B.icon_state = "kingyellow"
						B.item_state = "kingyellow"
					if("Ithaqua")
						B.icon_state = "ithaqua"
						B.item_state = "ithaqua"
					if("Scientology")
						B.icon_state = "scientology"
						B.item_state = "scientology"
					if("the bible melts")
						B.icon_state = "melted"
						B.item_state = "melted"
					if("Necronomicon")
						B.icon_state = "necronomicon"
						B.item_state = "necronomicon"
					else
						B.icon_state = "bible"
						B.item_state = "bible"

				H.update_inv_l_hand() // so that it updates the bible's item_state in his hand

				switch(input(H,"Look at your bible - is this what you want?") in list("Yes","No"))
					if("Yes")
						accepted = 1
					if("No")
						if(outoftime)
							to_chat(H, "Welp, out of time, buddy. You're stuck. Next time choose faster.")
							accepted = 1

			if(ticker)
				ticker.Bible_icon_state = B.icon_state
				ticker.Bible_item_state = B.item_state
				ticker.Bible_name = B.name
				ticker.Bible_deity_name = B.deity_name
			feedback_set_details("religion_deity","[new_deity]")
			feedback_set_details("religion_book","[new_book_style]")
		return 1

/obj/item/melee/whip/censer
	name = "gold-copper censer"
	desc = "A censer made out of an odd copper-gold material that's warm to the touch, even when unlit. Glows faintly. There are certain runes carved into it. Channels magic to bless warriors and the weapons they hold."
	attack_verb = list("flogged", "whipped", "lashed", "disciplined")
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "censer"
	item_state = "censer"
	w_class = ITEM_SIZE_SMALL

//this blesses humans, pretty straight forward
/obj/item/melee/whip/censer/attack(mob/living/carbon/M as mob, mob/living/carbon/human/user as mob) //very quick and simple blessing system, using attack incase I ever wanna make the censer need to be filled with stuff
	if (istype(M, /mob/living/carbon/human))
		if(M.isblessed == 1) //check this first
			to_chat(user, "<span class='warning'>[M] has already been blessed!</span>")
			return 1
		else
			M.STAT_LEVEL(dex) += 1
			M.STAT_LEVEL(str) += 1
			M.isblessed = 1
			usr.say("Allfather emta a' [M] et manis.")
			visible_message("[M] inhales the holy incense and is blessed!")


//this blesses guns
/obj/item/melee/whip/censer/attackby(var/obj/item/gun/O, var/mob/user)
	if(O.isblessed == 1)
		to_chat(user, "<span class='warning'>[O] has already been blessed!</span>")
		return 1
	else
		O.name = "blessed [O.name]"
		O.accuracy += 1
		O.armor_penetration += 1
		O.isblessed = 1
		playsound(src, 'sound/voice/blessing.ogg', 70, 0, 1)
//		usr.say("Netha al em'no kor do.")
		visible_message("[O] is bathed in righteous incense as the Priestess chants a short litany, you can sense a change in the weapon just by touching it.")

//this blesses swords
/obj/item/melee/whip/censer/attackby(var/obj/item/material/sword/O, var/mob/user)
	if(O.isblessed == 1)
		to_chat(user, "<span class='warning'>[O] has already been blessed!</span>")
		return 1
	else
		O.name = "blessed [O.name]"
		O.sharpness += 5
		O.block_chance += 5
		O.isblessed = 1
		playsound(src, 'sound/voice/blessing.ogg', 70, 0, 1)
//		usr.say("Il alem alsa, Eurydale el matela")
		visible_message("[O] is bathed in righteous incense as the Priestess chants a short litany, you can sense a change in the weapon just by touching it.")



//Chaplain outfit

/decl/hierarchy/outfit/job/chaplain
	name = OUTFIT_JOB_NAME("High Priestess")
	uniform = /obj/item/clothing/under/skirt_c/dress/eggshell
	neck = /obj/item/reagent_containers/food/drinks/canteen
	id_type = /obj/item/card/id/civilian/chaplain
	pda_type = null
	pda_slot = null
	l_ear = /obj/item/device/radio/headset/red_team
	r_ear = null
	l_pocket = /obj/item/storage/box/ifak
	belt = /obj/item/device/flashlight/lantern
	back = /obj/item/storage/backpack/satchel/warfare
	suit = /obj/item/clothing/suit/ministorumrobes
	suit_store = null
	l_hand = /obj/item/staff/ministorumstaff
	r_hand = /obj/item/melee/whip/censer
	backpack_contents = list(
	/obj/item/reagent_containers/food/snacks/warfare/rat = 1,
	/obj/item/thrones/bundle/t12 = 1,
	)



// Adepta Sororitas

// Battle Sister

/datum/job/sisterofbattle
	title = "Knight"
	department = "Ministorum"
	department_flag = CIV
	total_positions = 2
	spawn_positions = 2
	open_when_dead = 1
	social_class = SOCIAL_CLASS_HIGH
	latejoin_at_spawnpoints = TRUE
	supervisors = "the Adepta Sororitas and the Ministorum Confessor"
	selection_color = "#FCFBFA"
	announced = FALSE
	outfit_type = /decl/hierarchy/outfit/job/sisterofbattle
	auto_rifle_skill = 9
	semi_rifle_skill = 9
	sniper_skill = 9
	shotgun_skill = 9
	lmg_skill = 9
	smg_skill = 9
	melee_skill = 9
	ranged_skill = 7
	medical_skill = 4
	engineering_skill = 0
	surgery_skill = 1
	req_admin_notify = 1

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.set_trait(new/datum/trait/death_tolerant)
		H.set_quirk(new/datum/quirk/dead_inside) // stand proud, battle-friend..
		H.add_stats(rand(14,18), rand(12,16), rand(12,18), rand(8,12))
		H.get_idcard()?.access = get_all_accesses()
		H.get_equipped_item(slot_s_store)
		H.warfare_faction = IMPERIUM
//		H.gender = FEMALE
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.f_style = "shaved"
		to_chat(H, "<span class='notice'><b><font size=3>You are a Knight that responds to and works for the House Nobility. You have the keys to the stockades and your barracks. You were alive during the bloody Conflict, barely able to fight against the lasers that descended from the sky and shattered your world, covering it in dakrness and snow. One of the few survivors, you continue your 'fight' against the Fleet, wherever it may be. You aren't just a person-at-arms- you're also expected to carry out whatever duties are expected of you, including subterfuge or espionage. Though the House Nobiltiy squabble amongst themselves, your orders are clear- you must keep them safe and take their orders.</font></b></span>")
		if (H.gender == FEMALE)
			H.fully_replace_character_name("Dame [current_name]")
		if (H.gender == MALE)
			H.fully_replace_character_name("Ser [current_name]")
		if (prob(15))
			to_chat(H, "<span class='notice'><b><font size=2>You have recieved a credible threat about the safety of the Nobility from the villagers. Be extra weary and ensure their safety.</font></b></span>")
		else if (prob(100))
			to_chat(H, "<span class='notice'><b><font size=2>Your mind is relatively at ease. Nothing in particular bothers you at this moment.</font></b></span>")



//outfit

/decl/hierarchy/outfit/job/sisterofbattle
	name = OUTFIT_JOB_NAME("Knight")
	head = /obj/item/clothing/head/helmet/sentryhelm
	l_ear = /obj/item/device/radio/headset/red_team
	neck = /obj/item/reagent_containers/food/drinks/canteen
	pda_slot = null
	suit = /obj/item/clothing/suit/armor/bear
	uniform = /obj/item/clothing/under/guard/uniform/sisterofbattle
	back = /obj/item/storage/backpack/satchel/warfare/kroot
	gloves = /obj/item/clothing/gloves/sisterofbattle
	belt = /obj/item/melee/classic_baton/trench_club
	shoes = /obj/item/clothing/shoes/sisterofbattle
	id_type = /obj/item/card/id/dog_tag
	l_pocket = /obj/item/storage/box/ifak
	suit_store = /obj/item/melee/trench_axe
	backpack_contents = list(
	/obj/item/reagent_containers/food/snacks/warfare = 2,
	/obj/item/stack/thrones/ten = 1,
	/obj/item/stack/thrones2/ten = 1,
	/obj/item/stack/thrones3/ten = 2,
	/obj/item/card/id/stockades = 1,
	/obj/item/card/id/nobility = 1,
	)

// Orders Hospitaller

// Almoness Advance

/datum/job/cmo  // aaaa I DON'T KNOW WHAT TO DOOOOOOOOOOO!!!!!
	title = "Priest Aide"
	head_position = 1
	department = list("Ministorum", "Medical")
	department_flag = COM|MED
	total_positions = 0
	spawn_positions = 0
	supervisors = "the Head Priestess, the Old Gods"
	selection_color = "#633d63"
	req_admin_notify = 1
	economic_modifier = 10
	open_when_dead = FALSE
	social_class = SOCIAL_CLASS_HIGH
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	access = list(access_medical, access_medical_equip, access_morgue, access_genetics, access_heads,
			access_chemistry, access_virology, access_cmo, access_surgery, access_RC_announce,
			access_keycard_auth, access_sec_doors, access_psychiatrist, access_eva, access_maint_tunnels, access_external_airlocks, access_sob)
	minimal_access = list(access_medical, access_medical_equip, access_morgue, access_genetics, access_heads,
			access_chemistry, access_virology, access_cmo, access_surgery, access_RC_announce,
			access_keycard_auth, access_sec_doors, access_psychiatrist, access_eva, access_maint_tunnels, access_external_airlocks, access_sob)

	minimal_player_age = 14
	ideal_character_age = 50
	outfit_type = /decl/hierarchy/outfit/job/medical/cmo
	auto_rifle_skill = 5
	semi_rifle_skill = 5
	sniper_skill = 5
	shotgun_skill = 5
	lmg_skill = 5
	smg_skill = 5
	melee_skill = 6
	ranged_skill = 5
	medical_skill = 10
	engineering_skill = 1
	surgery_skill = 10

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Aide [current_name]")
		H.set_trait(new/datum/trait/death_tolerant())
		H.add_stats(rand(11,15), rand(11,15), rand(11,15), rand(12,16))
		H.get_idcard()?.access = get_all_accesses()
		H.get_equipped_item(slot_s_store)
		H.warfare_faction = IMPERIUM
		H.gender = FEMALE
		H.add_spell(new /spell/radiant_aura/light)
		H.add_spell(new /spell/targeted/heal_target)
		H.add_spell(new /spell/targeted/heal_target/sacrifice)
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
//		H.f_style = "shaved"
//		H.h_style = "Bob"

		to_chat(H, "<span class='notice'><b><font size=3>You are a Priestess' Aide- a doctor, and priest. You operate the sickbay in the church, as well as help the Head Priestess in her duties..</font></b></span>")

// Hospitaller Advance

/datum/job/doctor
	title = "Curia Advance"
	department = list("Ministorum", "Medical")
	department_flag = MED
	minimal_player_age = 3
	total_positions = 5
	spawn_positions = 3
	supervisors = "the Almoness Advance and the Orders Hospitaller"
	selection_color = "#967096"
	economic_modifier = 7
	social_class = SOCIAL_CLASS_HIGH
	open_when_dead = TRUE
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	access = list(access_medical, access_medical_equip, access_morgue, access_surgery, access_chemistry, access_virology, access_genetics, access_maint_tunnels, access_sob)
	minimal_access = list(access_medical, access_medical_equip, access_morgue, access_surgery, access_virology, access_maint_tunnels, access_sob)
	outfit_type = /decl/hierarchy/outfit/job/medical/doctor
	auto_rifle_skill = 4
	semi_rifle_skill = 4
	sniper_skill = 4
	shotgun_skill = 4
	lmg_skill = 4
	smg_skill = 4
	melee_skill = 5
	ranged_skill = 4
	medical_skill = 8
	engineering_skill = 0
	surgery_skill = 8

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Sister [current_name]")
		H.set_trait(new/datum/trait/death_tolerant())
		H.add_stats(rand(10,14), rand(10,14), rand(10,14), rand(12,15))
		H.get_idcard()?.access = get_all_accesses()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.bladder = -INFINITY // jank bearstation way of removing bathroom stuff
		H.bowels = -INFINITY// jank bearstation way of removing bathroom stuff
		H.get_equipped_item(slot_s_store)
		H.gender = FEMALE
		H.warfare_faction = IMPERIUM
		H.f_style = "shaved"
		H.h_style = "Bob"
		H.verbs += list(
		/mob/living/carbon/human/proc/khorne,
		/mob/living/carbon/human/proc/nurgle,
		/mob/living/carbon/human/proc/slaanesh,
		/mob/living/carbon/human/proc/tzeentch)

		to_chat(H, "<span class='notice'><b><font size=3>You are a junior sister of the Ordos Hospitaller, serving under the Sister Hospitaller to maintain the health and divinity of the garrison.</font></b></span>")

//Hospitaller

// chemist - radically different direction. serve as a 'village doctor'.

/datum/job/chemist
	title = "Village Doctor"
	department = "Medical"
	department_flag = MED
	social_class = SOCIAL_CLASS_MED
	minimal_player_age = 7
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Mayor, your conscience"
	selection_color = "#967096"
	economic_modifier = 5
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	access = list(access_medical, access_medical_equip, access_morgue, access_surgery, access_chemistry, access_virology, access_genetics,access_maint_tunnels)
	minimal_access = list(access_medical, access_medical_equip, access_chemistry,access_maint_tunnels,)
	outfit_type = /decl/hierarchy/outfit/job/medical/chemist
	auto_rifle_skill = 4
	semi_rifle_skill = 4
	sniper_skill = 4
	shotgun_skill = 4
	lmg_skill = 4
	smg_skill = 4
	melee_skill = 4
	ranged_skill = 4
	medical_skill = 8
	engineering_skill = 1
	surgery_skill = 7

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_stats(rand(9,13), rand(9,13), rand(9,13), rand(10,13))
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.bladder = -INFINITY // jank bearstation way of removing bathroom stuff
		H.bowels = -INFINITY// jank bearstation way of removing bathroom stuff
		H.warfare_faction = IMPERIUM
		H.verbs += list(
		/mob/living/carbon/human/proc/khorne,
		/mob/living/carbon/human/proc/nurgle,
		/mob/living/carbon/human/proc/slaanesh,
		/mob/living/carbon/human/proc/tzeentch)
		to_chat(H, "<span class='notice'><b><font size=3>You are the village doctor, a medicine-person for wounded townsfolk when the Church is full or the Fleet does not care. Getting advanced medical supplies has been difficult, especially since you are not seen as a 'real' doctor by the Fleet and are not part of the Church. Mix your concoctions and do your best...!.</font></b></span>")
