// Acolytes

/datum/job/acolyte
	title = "Fleet Agent"
	department_flag = INQ
	social_class = SOCIAL_CLASS_HIGH
	total_positions = 2
	spawn_positions = 2
	latejoin_at_spawnpoints = TRUE
	open_when_dead = 0
	supervisors = "the Principal Agent, and Fleet Admirality"
	selection_color = "#FF3A3A"
	economic_modifier = 7
	minimal_player_age = 18
	outfit_type = /decl/hierarchy/outfit/job/acolyte
//	alt_titles = list(
//		"Internal Affairs Agent" = /decl/hierarchy/outfit/job/acolyte/malleus
//		)
	announced = FALSE
	auto_rifle_skill = 5
	semi_rifle_skill = 5
	sniper_skill = 5
	shotgun_skill = 5
	lmg_skill = 5
	smg_skill = 5
	melee_skill = 5
	ranged_skill = 5
	medical_skill = 3
	engineering_skill = 0
	surgery_skill = 4

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Agent [current_name]")
		H.add_stats(rand(14,18), rand(14,18), rand(14,18), rand(14,18)) //highly trained and skilled
		H.assign_random_quirk()
		H.witchblood()
		H.set_trait(new/datum/trait/death_tolerant())
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.warfare_language_shit(LANGUAGE_HIGH_GOTHIC )
		H.warfare_faction = IMPERIUM
		H.get_idcard()?.access = get_all_accesses()
		to_chat(H, "<span class='notice'><b><font size=3>You are a Fleet Agent, a special kind of Fleet soldier specializing in investigation and internal affairs. Your task is to assist the Principal Agent in their duties, wherever that may take them. Fleet Agents are alowed a remarkable amount of freedom- as long as you are serving the Fleet, you are free to do as you please, within reason.</font></b></span>")

/datum/job/acolyte/equip(var/mob/living/carbon/human/H)
	. = ..()
	if(.)
		H.implant_loyalty(H)

// Inquisitors

/datum/job/inquisitor
	title = "Fleet Principal Agent"
	department_flag = INQ|COM
	social_class = SOCIAL_CLASS_MAX
	total_positions = 1
	spawn_positions = 1
	head_position = 1
	supervisors = "nobody except the Fleet Admirality directly"
	selection_color = "#fd0707"
	req_admin_notify = 1
	latejoin_at_spawnpoints = TRUE
	economic_modifier = 7
	minimal_player_age = 21
	open_when_dead = 0
	outfit_type = /decl/hierarchy/outfit/job/inquisitor
//	alt_titles = list(
//		"Internal Affairs Officer" = /decl/hierarchy/outfit/job/inquisitor/malleus
//		)
	announced = FALSE
	auto_rifle_skill = 7
	semi_rifle_skill = 7
	sniper_skill = 7
	shotgun_skill = 7
	lmg_skill = 7
	smg_skill = 7
	melee_skill = 8
	ranged_skill = 7
	medical_skill = 4
	engineering_skill = 1
	surgery_skill = 4

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Principal Agent [current_name]")
		H.add_stats(rand(16,18), rand(16,18), rand(16,18), rand(16,18)) //highly trained and skilled
		H.assign_random_quirk()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.warfare_language_shit(LANGUAGE_HIGH_GOTHIC )
		H.set_trait(new/datum/trait/death_tolerant())
		H.bladder = -INFINITY // jank bearstation way of removing bathroom stuff
		H.bowels = -INFINITY// jank bearstation way of removing bathroom stuff
		H.warfare_faction = IMPERIUM
		H.witchblood()
		H.verbs += list(/mob/living/carbon/human/proc/declareheretic,)
		to_chat(H, "<span class='notice'><b><font size=3>You are a Principal Fleet Agent, an internal affairs specialist. You operate under a loose set of duties, a rarity in the Fleet- you're allowed to go anywhere, do anything, as long as what you're doing is beneficial to the Admirality and war effort. Your 'proper' duties include auditing Fleet installations, responding to mutinies, espionage, and counter-espionage. You theoretically have authority over almost all Fleet members.</font></b></span>")
/datum/job/inquisitor/equip(var/mob/living/carbon/human/H)
	. = ..()
	if(.)
		H.implant_loyalty(H)

//Verb

/mob/living/carbon/human/proc/declareheretic(var/mob/living/carbon/human/M)
	set category = "Inquisitor"
	set name = "Declare Enemy"
	set desc="Declare a member of the installation an enemy of the Fleet!"
	if(M.stat==DEAD)
		return
	if(!M.canmove || M.stat || M.restrained())
		to_chat(M, "You cannot declare an enemy if you're tied up!")	//user is tied up
		return

	var/message = input("Name of the heretic", "Declare heretic", null, null) as message
	message = sanitize(message, 500, extra = 0)
	if(message)
		message = replacetext(message, "\n", "<br>") // required since we're putting it in a <p> tag
		to_world("<span class=danger><b>[src.real_name] declares the following an enemy of the Fleet::</b><p style='text-indent: 50px'>[message]</p></span>")
		log_admin("Announce: [key_name(usr)] : [message]")


/decl/hierarchy/outfit/job/acolyte
	name = OUTFIT_JOB_NAME("Fleet Agent")

/decl/hierarchy/outfit/job/inquisitor
	name = OUTFIT_JOB_NAME("Fleet Principal Agent")