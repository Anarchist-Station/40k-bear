

// Rogue Trader

var/datum/announcement/minor/captain_announcement = new(do_newscast = 1)

/datum/job/captain
	title = "Fleet Governor"
	department = "Rogue Trader"
	head_position = 1
	department_flag = COM|CIV
	social_class = SOCIAL_CLASS_MAX
	total_positions = 1
	spawn_positions = 1
	open_when_dead = 0
	supervisors = "Fleet Command or the Admiral, wherever they are"
	selection_color = "#011c77"
	req_admin_notify = 1
	access = list() 			//See get_access()
	minimal_access = list() 	//See get_access()
	minimal_player_age = 25
	economic_modifier = 20
	announced = FALSE
	latejoin_at_spawnpoints = TRUE
	ideal_character_age = 40
	outfit_type = /decl/hierarchy/outfit/job/captain
	auto_rifle_skill = 5
	semi_rifle_skill = 5
	sniper_skill = 5
	shotgun_skill = 5
	lmg_skill = 5
	smg_skill = 5
	melee_skill = 5
	ranged_skill = 6
	medical_skill = 4
	engineering_skill = 3
	surgery_skill = 2

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Governor [current_name]")
		H.add_stats(rand(12,18), rand(12,18), rand(12,18), rand(12,18))
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.bladder = -INFINITY // jank bearstation way of removing bathroom stuff
		H.bowels = -INFINITY// jank bearstation way of removing bathroom stuff
		H.warfare_faction = IMPERIUM
		H.verbs += list(/mob/living/carbon/human/proc/hire,)
		to_chat(H, "<span class='notice'><b><font size=3>You are an administrator-governor, and have been assigned to preside over this world while the First Fleet continues its two-century-long offensive across the galaxy. Messages from the Fleet come rarely, and even rarer still are resupplies. You aren't entirely alone- you have a small group of local recruits with dubious loyalties and, maybe, one or two good men. Keep your outpost functioning until the Fleet returns- if it ever does. </font></b></span>")

// Seneschal

/datum/job/hop
	title = "Attendant"
	head_position = 1
	department_flag = COM|CIV
	social_class = SOCIAL_CLASS_HIGH
	total_positions = 1
	spawn_positions = 1
	open_when_dead = 0
	supervisors = "the Governor"
	selection_color = "#00494e"
	req_admin_notify = 1
	minimal_player_age = 25
	economic_modifier = 10
	ideal_character_age = 50
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	auto_rifle_skill = 3
	semi_rifle_skill = 3
	sniper_skill = 3
	shotgun_skill = 3
	lmg_skill = 3
	smg_skill = 3
	melee_skill = 3
	ranged_skill = 4
	medical_skill = 5
	engineering_skill = 0
	surgery_skill = 2

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_stats(rand(10,12), rand(10,14), rand(10,13), rand(13,18))
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.bladder = -INFINITY // jank bearstation way of removing bathroom stuff
		H.bowels = -INFINITY// jank bearstation way of removing bathroom stuff
		H.warfare_faction = IMPERIUM
		to_chat(H, "<span class='notice'><b><font size=3>You are the attendant to the Fleet Governor. You are to handle their issues when they are not present. If the Governer becomes incapacitated then you assume command. While they are alive organize his affairs and coordinate trade with the surrounding settlements. You are also responsible for the vault and exchanging currency from it.</font></b></span>")
	access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers,
			            access_medical, access_engine, access_change_ids, access_ai_upload, access_eva, access_heads,
			            access_all_personal_lockers, access_maint_tunnels, access_bar, access_janitor, access_construction, access_morgue,
			            access_crematorium, access_kitchen, access_cargo, access_cargo_bot, access_mailsorting, access_qm, access_hydroponics, access_lawyer,
			            access_chapel_office, access_library, access_research, access_mining, access_heads_vault, access_mining_station,
			            access_hop, access_RC_announce, access_keycard_auth, access_gateway, access_treasury,)
	minimal_access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers,
			            access_medical, access_engine, access_change_ids, access_ai_upload, access_eva, access_heads,
			            access_all_personal_lockers, access_maint_tunnels, access_bar, access_janitor, access_construction, access_morgue,
			            access_crematorium, access_kitchen, access_cargo, access_cargo_bot, access_mailsorting, access_qm, access_hydroponics, access_lawyer,
			            access_chapel_office, access_library, access_research, access_mining, access_heads_vault, access_mining_station,
			            access_hop, access_RC_announce, access_keycard_auth, access_gateway, access_treasury)
	outfit_type = /decl/hierarchy/outfit/job/hop

/mob/living/carbon/human/proc/hire(var/mob/living/carbon/human/M in view(src))
	set category = "Rogue Trader"
	set name = "Hire Mercenary"
	set desc = "Finally! Some recognition!"
	if(!client)
		to_chat(src, "<span class='notice'>Thats not a person.</span>")
		return

	var/list/options = list(
		"Hire on",
		"Cancel",
		)

	var/theoptions = input("Would you like to hire [M]?", "Hiring Menu") as null|anything in options
	if (isnull(theoptions))																	//You chose poorly
		return
	if(!Adjacent(M))																			//How close are we?
		to_chat(src, "<span class='notice'>Get a little closer.</span>")
		return

	switch(theoptions)
		if ("Cancel")
			return	//do nothing

		if ("Hire on")
			for(var/obj/item/card/id/W in M.contents)
				M.unEquip(W)
				visible_message(("<span class='alert'>[src] snatches [W] and tosses it on the ground.</span>"))

			var/obj/item/card/id/dog_tag/guardsman/W = new
			W.access = list(access_security, access_sec_doors, access_brig, access_maint_tunnels, access_morgue)
			W.assignment = "Hired Mercenary"
			W.registered_name = M.real_name
			W.update_label()
			M.equip_to_slot_or_del(W, slot_wear_id)
			M.regenerate_icons()
			M.mind.special_role = "Mercenary"
			src.mind.special_role = "Mercenary"
			M.warfare_faction = IMPERIUM
			M.AddInfectionImages()
			src.AddInfectionImages()
			visible_message("<span class='alert'>[src] slaps a new ID onto [M].</span>")
			src.say("Welcome to my service.")
		else
			return


// decl for outfits so access doesn't get messed up
/decl/hierarchy/outfit/job/hop
	name = OUTFIT_JOB_NAME("Attendant")

/decl/hierarchy/outfit/job/captain
	name = OUTFIT_JOB_NAME("Fleet Governor")

