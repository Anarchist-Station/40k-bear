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
	supervisors = "nobody"
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
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.warfare_faction = IMPERIUM
		to_chat(H, "<span class='notice'><b><font size=3>You are a witch, one of the few in the world who still remember the old ways of magic. You are... (pick your flavor in the 'witch' tab!).</font></b></span>")


		H.verbs += list(
			/mob/living/carbon/human/proc/witchclass,
		)


/mob/living/carbon/human/proc/witchclass()
	set name = "School"
	set category = "Witch"
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

	fates += list("Blood Witch", "Alchemist", "Arcanist") //subclasses.

	mind.store_memory("[fates]") //ALSO DOESN'T WORK WITHOUT THIS LOL

	var/classchoice = input("Choose your fate", "Available fates") as anything in fates


	switch(classchoice)
		if("Blood Witch")
			U.add_spell(new /spell/radiant_aura/light)
			U.add_spell(new /spell/noclothes)
			U.add_spell(new /spell/targeted/projectile/blooddrain)
			U.add_spell(new /spell/targeted/dark_heal)
			U.add_spell(new /spell/messa_shroud)
			equip_to_slot_or_del(new /obj/item/material/sword/chaosknife/lament, slot_l_hand)
			equip_to_slot_or_del(new /obj/item/clothing/under/darkwitch, slot_w_uniform)
			equip_to_slot_or_del(new /obj/item/storage/belt/medical/alchemist, slot_belt)
			equip_to_slot_or_del(new /obj/item/clothing/suit/prac_arpon, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/warfare/kroot, slot_back)
			equip_to_slot_or_del(new /obj/item/clothing/mask/gas/prac_mask, slot_wear_mask)
			equip_to_slot_or_del(new /obj/item/clothing/shoes/sandal, slot_shoes)
			U.add_skills(rand(5,7),rand(1,2),rand(1,3),rand(1,3),6) //average cqc, low ranged, competent doctor but not foolproof
			U.add_stats(rand(6,8),rand(12,18),rand(8,10),rand(14,17)) //physically weak, but good dex, low endurance, semi-high int
			to_chat(U, "<span class='notice'><b><font size=3>You are a Blood Witch, someone who, even before the Conflict, was an outcast to society. You specialize in sacrificial rites and rituals. Unlike others who practice the arcane, you are not afraid to...get your hands dirty, so to speak, either with suturing wounds or using violence. Your source of power is your signature weapon in your hand. Use it to kill those who are beneath you.</font></b></span>")
		if("Alchemist")
			U.add_spell(new /spell/aoe_turf/conjure/grove/sanctuary)
			U.add_spell(new /spell/radiant_aura/light)
			U.add_spell(new /spell/targeted/equip_item/seed)
			U.add_spell(new /spell/aoe_turf/disable_tech)
			U.add_spell(new /spell/noclothes)
			equip_to_slot_or_del(new /obj/item/clothing/shoes/sandal, slot_shoes)
			equip_to_slot_or_del(new /obj/item/reagent_containers/glass/jar/healingdraught, slot_l_hand)
			equip_to_slot_or_del(new /obj/item/gun/launcher/crossbow, slot_r_hand)
			equip_to_slot_or_del(new /obj/item/clothing/under/villagegarb, slot_w_uniform)
			equip_to_slot_or_del(new /obj/item/storage/belt/medical/alchemist, slot_belt)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/quiver, slot_back)
			equip_to_slot_or_del(new /obj/item/clothing/suit/storage/toggle/labcoat/alchemist, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/device/flashlight/lantern, slot_r_store)
			equip_to_slot_or_del(new /obj/item/clothing/under/villagegarb, slot_w_uniform)
			U.add_skills(rand(4,7),rand(4,6),rand(4,7),rand(1,3),6)
			U.add_stats(rand(6,8),rand(8,10),rand(12,18),rand(14,17))
			to_chat(U, "<span class='notice'><b><font size=3>You are an alchemist, and what one might consider a...'doctor', of sorts. Although you are not explicitly trained in opening people up, you use your magic to mix potions and create plants that are advantageous to creating draughts of healing. You are well-versed in using your crossbow to defend yourself.</font></b></span>")
		if("Arcanist")
			U.add_spell(new /spell/noclothes)
			U.add_spell(new /spell/targeted/ethereal_jaunt)
			U.add_spell(new /spell/radiant_aura/light)
			U.add_spell(new /spell/targeted/projectile/magic_missile)
			U.add_spell(new /spell/targeted/projectile/dumbfire/fireball)
			U.add_spell(new /spell/aoe_turf/knock)
			U.add_spell(new /spell/targeted/projectile/dumbfire/stuncuff)
			U.add_spell(new /spell/targeted/swap)
			equip_to_slot_or_del(new /obj/item/clothing/under/rank/medical/scrubs/black, slot_w_uniform) //placeholder, need fancy wizard robes, ya'll
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/warfare/kroot, slot_back)
			equip_to_slot_or_del(new /obj/item/clothing/shoes/sandal, slot_shoes)
			equip_to_slot_or_del(new /obj/item/clothing/suit/storage/toggle/labcoat/alchemist, slot_wear_suit) //placeholder, need fancy wizard robes, ya'll
			U.add_skills(rand(0,1),rand(1,2),rand(1,4),rand(1,3),7)
			U.add_stats(rand(5,7), rand(8,10), rand(8,12), rand(16,20)) //incredibly smart, physically fragile to compensate for her powerful spell abilities
			to_chat(U, "<span class='notice'><b><font size=3>You are an Arcanist, a warlock, a peak master of wizardry, master of all arcane. Your mastery of spells is unmatched, by natural talent or by years of study. Though you are not the physically strongest person, you more than make up for it with your fearsome arsenal. You are also quite skilled in medicine from your studies, and can stand in for a doctor, should the need arise.</font></b></span>")






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
		H.add_skills(rand(4,6),rand(1,3),0,0,0)
		H.assign_random_quirk()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.warfare_faction = IMPERIUM
		H.verbs += list(
		/mob/living/carbon/human/proc/khorne,
		/mob/living/carbon/human/proc/nurgle,
		/mob/living/carbon/human/proc/slaanesh,
		/mob/living/carbon/human/proc/tzeentch)
		to_chat(H, "<span class='notice'><b><font size=3>You are a newly recruited Conscript, your training recently complete you were assigned kitchen duties. You are safer and warmer inside than the other Conscripts in the village serving as a policing force, but your job is no easier- you have to feed an army that bombed your home into an ash-filled, year-round winter..</font></b></span>")
		if (prob(10))
			to_chat(H, "<span class='notice'><b><font size=3>You managed to smuggle in a trinket to remind you of home. It's extremely valuable to you. Keep it safe. (You'll find it on the ground underneath you, sorry.)</font></b></span>")
			new /obj/item/coin/iron(H.loc)

// merchant. i'm sorry.

/datum/job/hydro
	title = "Merchant"
	department = "Service"
	department_flag = CIV
	total_positions = 1
	spawn_positions = 1
	supervisors = "your own greed"
	selection_color = "#848484"
	latejoin_at_spawnpoints = TRUE
	access = list(access_hydroponics, access_bar, access_kitchen,access_maint_tunnels, access_grox)
	minimal_access = list(access_hydroponics, access_maint_tunnels, access_kitchen, access_grox)
//	alt_titles = list("Hydroponicist")
	outfit_type = /decl/hierarchy/outfit/job/townmerchant
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
		H.add_skills(rand(4,6),rand(1,3),rand(1,3),rand(1,3),rand(1,3))
		H.assign_random_quirk()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.warfare_faction = IMPERIUM
		H.verbs += list(
		/mob/living/carbon/human/proc/khorne,
		/mob/living/carbon/human/proc/nurgle,
		/mob/living/carbon/human/proc/slaanesh,
		/mob/living/carbon/human/proc/tzeentch)
		to_chat(H,"<span class='notice'>You're a merchant under your own employ. It's been...difficult making ends meet, lately, but you've managed to get by. Even after the world ends, the wheel of commerce continues turning. Import and export goods, buy and sell, make your profits.<b><font size=3>")

/decl/hierarchy/outfit/job/townmerchant
	name = OUTFIT_JOB_NAME("Merchant")
	suit = /obj/item/clothing/suit/merchant
	uniform = /obj/item/clothing/under/rank/consort/adept
	pda_type = /obj/item/device/pda/penitent
	back = /obj/item/storage/backpack/satchel/warfare
	neck = /obj/item/reagent_containers/food/drinks/canteen
	head = /obj/item/clothing/head/smokingcap
	id_type = null
	l_pocket = /obj/item/storage/box/ifak
	l_ear = null
	r_ear = /obj/item/device/radio/headset/red_team
	pda_slot = null
	shoes = /obj/item/clothing/shoes/laceup
	suit_store = null
	backpack_contents = list(
	/obj/item/thrones/bundle/t10 = 2,
	/obj/item/card/id/shop = 1
	)


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
	uniform = null
	head = null
	mask = null
	shoes = null
	gloves = null
	back = /obj/item/storage/backpack/satchel/warfare
	neck = /obj/item/reagent_containers/food/drinks/canteen
	id_type = /obj/item/card/id/ring/administrator
	belt = /obj/item/device/flashlight/lantern
	pda_slot = null
	backpack_contents = list(
	/obj/item/thrones/bundle/t2 = 1
	)