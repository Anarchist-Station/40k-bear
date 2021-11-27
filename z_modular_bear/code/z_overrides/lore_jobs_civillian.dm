//Food && these jobs are outpost support staff

// WITCH TIME BABYYYYYYY

/datum/job/bartender
	title = "Witch"
	department_flag = PIL
	social_class = SOCIAL_CLASS_MIN
	total_positions = 1
	spawn_positions = 1
	latejoin_at_spawnpoints = TRUE
	open_when_dead = 1
	supervisors = "Every Imperial Citizen"
	selection_color = "#337C81"
	access = null
	minimal_access = null
	outfit_type = /decl/hierarchy/outfit/job/service/bartender
	announced = FALSE
	auto_rifle_skill = 1
	semi_rifle_skill = 1
	sniper_skill = 1
	shotgun_skill = 1
	lmg_skill = 1
	smg_skill = 1
	melee_skill = 5
	ranged_skill = 3
	medical_skill = 5
	engineering_skill = 2
	surgery_skill = 1

	equip(var/mob/living/carbon/human/H)
		H.add_stats(rand(7,8), rand(8,13), rand(12,15), rand(18,20)) //smart, physically fragile
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.warfare_faction = IMPERIUM
		H.bladder = -INFINITY
		H.bowels = -INFINITY
		to_chat(H, "<span class='notice'><b><font size=3>You are a witch, one of the few in the world who still remember the old ways of magic. You are... (pick your flavor in the 'witch' tab!).</font></b></span>")

		H.verbs += list(
			/mob/living/carbon/human/proc/witchclass,
		)


/mob/living/carbon/human/proc/witchclass()
	set name = "School"
	set category = "Pilgrim"
	set desc = "Remember what school of magic you specialized in."
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How are you seeing this?! Ping Bear immediately!</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't choose a class when you're dead.</span>")
		return
	src.verbs -= list(/mob/living/carbon/human/proc/witchclass)

	var/mob/living/carbon/human/U = src
	var/fates = list() //lists all possible fates
	fates += pick("Blood Witch", "Alchemist", "Arcanist",) //adds a fate randomly to essentially give rng pick
	mind.store_memory("[fates]") //should stop people from closing client and rerolling fates

	var/classchoice = input("Choose your fate", "Available fates") as anything in fates


	switch(classchoice)
		if("Blood Witch")
			U.add_spell(new /spell/radiant_aura/light)
			U.add_spell(new /spell/noclothes)
			U.add_spell(new /spell/targeted/projectile/blooddrain)
			U.add_spell(new /spell/targeted/dark_heal)
			U.add_spell(new /spell/messa_shroud)
			equip_to_slot_or_del(new /obj/item/material/sword/chaosknife/lament, slot_l_hand)
			U.add_skills(rand(3,5),0,0,0,3)
			to_chat(U, "<span class='notice'><b><font size=3>You are a Blood Witch, someone who, even before the Conflict, was an outcast to society. You specialize in sacrificial rites and rituals. Unlike others who practice the arcane, you are not afraid to...get your hands dirty, so to speak, either with suturing wounds or using violence. Your source of power is your signature weapon in your hand. Use it to kill those who are beneath you.</font></b></span>")
		if("Alchemist")
			U.add_spell(new /spell/aoe_turf/conjure/grove/sanctuary)
			U.add_spell(new /spell/targeted/equip_item/seed)
			U.add_spell(new /spell/targeted/heal_target)
			U.add_spell(new /spell/aoe_turf/disable_tech)
			U.add_spell(new /spell/noclothes)
			equip_to_slot_or_del(new /obj/item/material/sword/chaosknife/lament, slot_l_hand)
			equip_to_slot_or_del(new /obj/item/material/sword/chaosknife/lament, slot_l_hand)
			to_chat(U, "<span class='notice'><b><font size=3>You are an alchemist, and what one might consider a...'druidess', of sorts. Although you do not explicitly commune with nature, you use your magic to mix potions and create plants that are advantageous to creating draughts of healing.</font></b></span>")
		if("Arcanist")
			U.add_spell(new /spell/noclothes)
			U.add_spell(new /spell/targeted/ethereal_jaunt)
			U.add_spell(new /spell/targeted/projectile/magic_missile)
			U.add_spell(new /spell/targeted/projectile/dumbfire/fireball)
			U.add_spell(new /spell/aoe_turf/knock)
			U.add_spell(new /spell/targeted/projectile/dumbfire/stuncuff)
			U.add_spell(new /spell/targeted/swap)
			to_chat(U, "<span class='notice'><b><font size=3>You are an Arcanist, a sorceress, a peak master of wizardry, master of all arcane. Your mastery of spells is unmatched, by natural talent or by years of study. Though you are not the physically strongest person, you more than make up for it with your fearsome arsenal. </font></b></span>")







// Cook

/datum/job/chef
	title = "Cook"
	department = "Service"
	department_flag = CIV
	total_positions = 1
	spawn_positions = 1
	open_when_dead = 1
	latejoin_at_spawnpoints = TRUE
	supervisors = "the Governor, anyone higher in ranking"
	selection_color = "#337C81"
	access = list(access_hydroponics, access_bar, access_kitchen, access_maint_tunnels)
	minimal_access = list(access_kitchen)
	announced = FALSE
//	alt_titles = list("Cook")
	outfit_type = /decl/hierarchy/outfit/job/service/chef

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Conscript. [current_name]")
		H.add_stats(rand(8,12), rand(10,12), rand(10,12), rand(8,11)) //highly trained and skilled
		H.add_skills(rand(1,3),rand(1,3),0,0,0)
		H.assign_random_quirk()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.bladder = -INFINITY // jank bearstation way of removing bathroom stuff
		H.bowels = -INFINITY// jank bearstation way of removing bathroom stuff
		H.warfare_faction = IMPERIUM
		H.verbs += list(
		/mob/living/carbon/human/proc/khorne,
		/mob/living/carbon/human/proc/nurgle,
		/mob/living/carbon/human/proc/slaanesh,
		/mob/living/carbon/human/proc/tzeentch)
		H.add_spell(new /spell/radiant_aura/light)
		H.add_spell(new /spell/noclothes)
		to_chat(H, "<span class='notice'><b><font size=3>You are a newly recruited Conscript, your training recently complete you were assigned kitchen duties. You are safer and warmer inside than the other Conscripts in the village serving as a policing force, but your job is no easier- you have to feed an army that bombed your home into an ash-filled, year-round winter..</font></b></span>")
		if (prob(10))
			to_chat(H, "<span class='notice'><b><font size=3>You managed to smuggle in a trinket to remind you of home. It's extremely valuable to you. Keep it safe. (You'll find it on the ground underneath you, sorry.)</font></b></span>")
			new /obj/item/coin/iron(H.loc)

// Farmer

/datum/job/hydro
	title = "Hydroponics Associate"
	department = "Service"
	department_flag = CIV
	total_positions = 2
	spawn_positions = 1
	supervisors = "the Attendant, cruel entropy"
	selection_color = "#848484"
	latejoin_at_spawnpoints = TRUE
	access = list(access_hydroponics, access_bar, access_kitchen,access_maint_tunnels, access_grox)
	minimal_access = list(access_hydroponics, access_maint_tunnels, access_kitchen, access_grox)
//	alt_titles = list("Hydroponicist")
	outfit_type = /decl/hierarchy/outfit/job/service/gardener
	announced = FALSE
	auto_rifle_skill = 3
	semi_rifle_skill = 3
	sniper_skill = 3
	shotgun_skill = 3
	lmg_skill = 3
	smg_skill = 3
	melee_skill = 4
	ranged_skill = 3
	medical_skill = 3
	engineering_skill = 0
	surgery_skill = 0

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("[current_name]")
		H.add_stats(rand(13,15), rand(10,13), rand(12,15), rand(8,13))
		H.assign_random_quirk()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.bladder = -INFINITY // jank bearstation way of removing bathroom stuff
		H.bowels = -INFINITY// jank bearstation way of removing bathroom stuff
		H.warfare_faction = IMPERIUM
		H.verbs += list(
		/mob/living/carbon/human/proc/khorne,
		/mob/living/carbon/human/proc/nurgle,
		/mob/living/carbon/human/proc/slaanesh,
		/mob/living/carbon/human/proc/tzeentch)
		to_chat(H, "<span class='notice'><b><font size=3>The most important job in the outpost. You are tasked with growing food on a planet that has not seen a clear sky in seven years. Try your best to do...anything, with what you're given, not that you want to be here, anyway.</font></b></span>")

/decl/hierarchy/outfit/job/service/gardener


// Janitor Servitor

/datum/job/janitor
	title = "Janitor Servitor"
	department = "Service"
	department_flag = CIV
	total_positions = 0
	spawn_positions = 0
	open_when_dead = 1
	latejoin_at_spawnpoints = TRUE
	social_class = SOCIAL_CLASS_MIN
	supervisors = "Every Imperial Citizen"
	selection_color = "#337C81"
	access = list(access_janitor, access_maint_tunnels, access_engine, access_research, access_medical)
	minimal_access = list(access_janitor, access_maint_tunnels, access_engine, access_research, access_medical)
	//alt_titles = list("Custodian","Sanitation Technician")
	outfit_type = /decl/hierarchy/outfit/job/service/janitor
	announced = FALSE
	auto_rifle_skill = 1
	semi_rifle_skill = 1
	sniper_skill = 1
	shotgun_skill = 1
	lmg_skill = 1
	smg_skill = 1
	melee_skill = 4
	ranged_skill = 1
	medical_skill = 4
	engineering_skill = 2
	surgery_skill = 1

	equip(var/mob/living/carbon/human/H)
		var/servitor_number = rand(1,1000)
		var/servitor_name = "daan"
		..()
		H.fully_replace_character_name("[servitor_name] [servitor_number]")
		H.add_stats(rand(10,10), rand(8,11), rand(16,17), rand(8,10)) //extremely simple minded
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.warfare_faction = IMPERIUM
		H.bladder = 0
		H.bowels = 0 //until someone tells me that servitors eat and shit this shall be it
		H.thirst = INFINITY
		H.nutrition = INFINITY
		to_chat(H, "<span class='notice'><b><font size=3>You are a servitor, specifically one designed for cleaning and maintaining the outpost. You are to obey Imperial citizens and serve their every need. You are nearly mindless and will follow any order given to you by a superior.</font></b></span>")





/decl/hierarchy/outfit/job/witch
	name = OUTFIT_JOB_NAME("Witch")
	uniform = /obj/item/clothing/under/rank/consort/adept
	head = /obj/item/clothing/head/commissar/adept
	mask = /obj/item/clothing/mask/gas/prac_mask
	shoes = /obj/item/clothing/shoes/sandal
	gloves = null
	back = /obj/item/storage/backpack/satchel/warfare
	neck = /obj/item/reagent_containers/food/drinks/canteen
	id_type = /obj/item/card/id/ring/administrator
	belt = /obj/item/device/flashlight/lantern
	pda_slot = null
	backpack_contents = list(
	/obj/item/stack/thrones = 2,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/twenty = 1,
	)