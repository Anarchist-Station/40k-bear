// Acolytes

/datum/job/acolyte
	title = "Acolyte"
	department_flag = INQ
	social_class = SOCIAL_CLASS_HIGH
	total_positions = 3
	spawn_positions = 3
	latejoin_at_spawnpoints = TRUE
	open_when_dead = 0
	supervisors = "The Golden Throne, the Ministorum, the Inquisition."
	selection_color = "#FF3A3A"
	economic_modifier = 7
	minimal_player_age = 18
	outfit_type = /decl/hierarchy/outfit/job/acolyte
	alt_titles = list(
		"Acolyte Of Ordo Malleus" = /decl/hierarchy/outfit/job/acolyte/malleus
		)
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
		H.fully_replace_character_name("[current_name]")
		H.add_stats(rand(14,18), rand(14,18), rand(14,18), rand(14,18)) //highly trained and skilled
		H.assign_random_quirk()
		H.witchblood()
		H.set_trait(new/datum/trait/death_tolerant())
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.warfare_language_shit(LANGUAGE_HIGH_GOTHIC )
		H.warfare_faction = IMPERIUM
		H.get_idcard()?.access = get_all_accesses()
		to_chat(H, "<span class='notice'><b><font size=3>You are an inquisitor-in-training, referred as Acolyte, Your task is to assist the Throne Agent, Lord Inquisitor in investigating, neutralising and erasing traces of heresy, chaos, xenos and daemons.</font></b></span>")

/datum/job/acolyte/equip(var/mob/living/carbon/human/H)
	. = ..()
	if(.)
		H.implant_loyalty(H)

// Inquisitors

/datum/job/inquisitor
	title = "Inquisitor"
	department_flag = INQ|COM
	social_class = SOCIAL_CLASS_MAX
	total_positions = 1
	spawn_positions = 1
	head_position = 1
	supervisors = "The Golden Throne, the Inquisition, Lord Inquisitor Rorkan and the masters of the Ordos Helican."
	selection_color = "#fd0707"
	req_admin_notify = 1
	latejoin_at_spawnpoints = TRUE
	economic_modifier = 7
	minimal_player_age = 21
	open_when_dead = 0
	outfit_type = /decl/hierarchy/outfit/job/inquisitor
	alt_titles = list(
		"Inquisitor Of Ordo Malleus" = /decl/hierarchy/outfit/job/inquisitor/malleus
		)
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
		H.fully_replace_character_name("Inquisitor [current_name]")
		H.add_stats(rand(16,18), rand(16,18), rand(16,18), rand(16,18)) //highly trained and skilled
		H.assign_random_quirk()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.warfare_language_shit(LANGUAGE_HIGH_GOTHIC )
		H.set_trait(new/datum/trait/death_tolerant())
		H.warfare_faction = IMPERIUM
		H.witchblood()
		H.verbs += list(/mob/living/carbon/human/proc/declareheretic,)
		to_chat(H, "<span class='notice'><b><font size=3>You are a Throne Agent, Loyal servant of the Imperium. As full-fledged Inquisitor. Your task is to seek and destroy enemies of the Imperium, whether they're daemons, Chaos, Xenos or Heretics. The Emperor Protects.</font></b></span>")
/datum/job/inquisitor/equip(var/mob/living/carbon/human/H)
	. = ..()
	if(.)
		H.implant_loyalty(H)

//Verb

/mob/living/carbon/human/proc/declareheretic(var/mob/living/carbon/human/M)
	set category = "Inquisitor"
	set name = "Declare Heretic"
	set desc="Declare a member of the crew a heretic!"
	if(M.stat==DEAD)
		return
	if(!M.canmove || M.stat || M.restrained())
		to_chat(M, "You cannot declare a heretic if you're tied up!")	//user is tied up
		return

	var/message = input("Name of the heretic", "Declare heretic", null, null) as message
	message = sanitize(message, 500, extra = 0)
	if(message)
		message = replacetext(message, "\n", "<br>") // required since we're putting it in a <p> tag
		to_world("<span class=danger><b>[src.real_name] declares the following as heretic(s):</b><p style='text-indent: 50px'>[message]</p></span>")
		log_admin("Announce: [key_name(usr)] : [message]")
