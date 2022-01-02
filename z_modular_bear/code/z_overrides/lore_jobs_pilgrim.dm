//oh god this may cock things up terribly in the future...maybe comment out originals in pilgrims.dm before turning this on? concenr is double-spawns because of equip var
//  either way, make sure all of ihe lore descriptions are done before you make huge comments/uncomments, because this is for lore overwrites, and you better be sure about that fucking lore

/*
Pilgrim Fate System
*/

//yeah this might be the most retarded way of doing it but it works - plz no bully Matt

//mob/living/carbon/human/proc/penitentclass(var/mob/living/carbon/human/M)



// PILGRIM. TODO: oh

/datum/job/penitent
	title = "Villager"
	department_flag = PIL
	social_class = SOCIAL_CLASS_MIN
	total_positions = INFINITY
	spawn_positions = INFINITY
	supervisors = "the House and the Fleet"
	selection_color = "#848484"
	outfit_type = /decl/hierarchy/outfit/job/penitent
	latejoin_at_spawnpoints = TRUE
	announced = FALSE


	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = IMPERIUM
		..()
		H.add_stats(rand(6,11), rand(7,12), rand(8,12), rand (8,11)) //they suck and are supposed to suck
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.bladder = -INFINITY // jank bearstation way of removing bathroom stuff
		H.bowels = -INFINITY// jank bearstation way of removing bathroom stuff
		H.assign_random_quirk()
		H.witchblood()
		H.verbs += list(
		/mob/living/carbon/human/proc/khorne,
		/mob/living/carbon/human/proc/nurgle,
		/mob/living/carbon/human/proc/slaanesh,
		/mob/living/carbon/human/proc/tzeentch)
		to_chat(H, "<span class='notice'><b><font size=3>You are a native of Biblio, one of the few that survived the twelve-hour Conflict between your world and the First Fleet. Go to your pilgrim tab and select your fate. </font></b></span>")


		H.verbs += list(
			/mob/living/carbon/human/proc/penitentclass,
		)

// this makes me sick to my stomach. physically.
/mob/living/carbon/human/proc/penitentclass()
	set name = "Select your class"
	set category = "Pilgrim"
	set desc = "Choose your new profession on this strange world."
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't choose a class when you're dead.</span>")
		return
	src.verbs -= list(/mob/living/carbon/human/proc/penitentclass)

	var/mob/living/carbon/human/U = src
	var/fates = list() //lists all possible fates

	fates += list("Merchant","Bounty Hunter","Penitent","Laborer","Musician","Stalker","Scum","Miner") //adds a fate randomly to essentially give rng pick
	fates += pick("Laborer","Musician","Witch",) //adds a fate randomly to essentially give rng pick
	fates += pick("Stalker","Scum","Miner",) //adds a fate randomly to essentially give rng pick

	mind.store_memory("[fates]") //should stop people from closing client and rerolling fates


	var/classchoice = input("Choose your fate", "Available fates") as anything in fates


	switch(classchoice)
		if("Laborer")
			equip_to_slot_or_del(new /obj/item/clothing/suit/sherpa, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/clothing/head/ushanka2, slot_head)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/warfare, slot_back)
			equip_to_slot_or_del(new /obj/item/device/flashlight/lantern, slot_belt)
			equip_to_slot_or_del(new /obj/item/torch/self_lit, slot_l_hand)
			equip_to_slot_or_del(new /obj/item/thrones/bundle/t6, slot_in_backpack)
			to_chat(U,"<span class='notice'>You were a laborer before the Conflict. You were, and still are, one of the lucky ones- after your old government's defeat, you were re-employed by the House Nobility, the small rag-tag power that survived the invasion. You didn't get the land the Fleet stole back, but...at least you can, theoretically, get paid.<b><font size=3>")
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,
			)
		if("Penitent")
			equip_to_slot_or_del(new /obj/item/clothing/suit/raggedrobe, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/clothing/head/plebhood, slot_head)
			equip_to_slot_or_del(new /obj/item/torch/self_lit, slot_l_hand)
			equip_to_slot_or_del(new /obj/item/thrones/bundle/t5, slot_r_store)
			to_chat(U, "<span class='notice'><b><font size=3>You are a penitent, under watch of the Fleet. Before the Conflict, you were a worshipper of the old Gods, and fought against the Fleet's cultural control. Now, after the death of the nature goddess Eurydale, the world is covered in ash and snow, the very land weeping at her demise.</font></b></span>")
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,
			)
		if("Bounty Hunter")
			U.add_stats(rand(10,14), rand(10,14), rand(10,14), rand (8,12)) //veteran hunter
			U.add_skills(rand(5,8),rand(5,8),rand(1,3),0,0)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/warfare, slot_back)
			equip_to_slot_or_del(new /obj/item/clothing/suit/armor/bountyhunter2, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/clothing/head/bountyhead, slot_head)
			equip_to_slot_or_del(new /obj/item/gun/energy/las/lasgun, slot_l_hand)
			equip_to_slot_or_del(new /obj/item/cell/lasgun, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/cell/lasgun, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/handcuffs, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/torch/self_lit, slot_r_hand)
			equip_to_slot_or_del(new /obj/item/thrones/bundle/t2, slot_in_backpack)
			to_chat(U,"<span class='notice'><b><font size=3>You're one of the few crazy enough to toe the line between civillian and criminal in the Fleet's eyes. Your entire life is a tightrope act; you need to put food on the table by cashing in bounties with the Fleet or Nobility, but you need to make sure nobody quite sees how you do it, lest they charge you for disturbing the peace, .</font></b></span>")
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,)
		if("Merchant")
			equip_to_slot_or_del(new /obj/item/clothing/head/smokingcap, slot_head)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/warfare, slot_back)
			equip_to_slot_or_del(new /obj/item/clothing/suit/merchant, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/torch/self_lit, slot_l_hand)
			equip_to_slot_or_del(new /obj/item/thrones/bundle/t6, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/thrones/bundle/t10, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/thrones/ewallet/meal, slot_in_backpack)
			to_chat(U,"<span class='notice'>You're a merchant under the employ of the House Nobility, and it's not the type of employment you can exactly quit. Stuck between being extorted by the House, and taxed by the Fleet, you've struggled to make ends meet. Work with the village and the outpost to organize trade and enrich yourself.<b><font size=3>")
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,
			)
		if("Musician")
			equip_to_slot_or_del(new /obj/item/device/violin, slot_l_hand)
			equip_to_slot_or_del(new /obj/item/clothing/suit/musician, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/clothing/head/musichat, slot_head)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/warfare, slot_back)
			equip_to_slot_or_del(new /obj/item/torch/self_lit, slot_r_hand)
			equip_to_slot_or_del(new /obj/item/thrones/bundle/t6, slot_in_backpack)

			to_chat(U,"<span class='notice'><b><font size=3>A wandering bard, you find yourself moving from tavern to tavern entertaining the masses for a few coins a time. ...Good luck with that one, buddy. </font></b></span>")
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,)
		if("Miner")
			U.add_stats(rand(10,13),rand(8,12),rand(10,12),8)
			equip_to_slot_or_del(new /obj/item/clothing/gloves/thick, slot_gloves)
			equip_to_slot_or_del(new /obj/item/storage/newore, slot_belt)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/satchel_eng, slot_back)
			equip_to_slot_or_del(new /obj/item/pickaxe/newpick, slot_l_hand)
			equip_to_slot_or_del(new /obj/item/clothing/suit/miner, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/torch/self_lit, slot_l_hand)
			equip_to_slot_or_del(new /obj/item/thrones/bundle/t5, slot_in_backpack)
			to_chat(U,"<span class='notice'><b><font size=3>You're a laborer directly employed by the House Nobility. You get access to their outpost at the northwest corner of the town. It's dangerous work, but...hey, at least you can cook whatever's trying to kill you down there, right...?.</font></b></span>")
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,)

		if("Stalker")
			U.add_skills(rand(1,3),rand(5,8),0,0,0)
			equip_to_slot_or_del(new /obj/item/storage/belt/stalker, slot_belt)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/warfare, slot_back)
			equip_to_slot_or_del(new /obj/item/material/knife/butch, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/clothing/suit/chokha, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/gun/projectile/shotgun/pump/boltaction/shitty, slot_r_hand)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/brifle_handful, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/brifle_handful, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/thrones/bundle/t6, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/clothing/head/pillbox, slot_head)
			equip_to_slot_or_del(new /obj/item/torch/self_lit, slot_l_hand)
			to_chat(U,"<span class='notice'><b><font size=3>You're a hunter that captures or kills game, and either brings it back to town to sell or use it to feed yourself.</font></b></span>")
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,)
			if (prob(5))
				to_chat(U,"<span class='danger'><b><font size=2>Today, you are hunting the most dangerous game. You feel a dark craving in you stir...and you can feel your hunger gnawing inside of you. You feel like you'll never eat again unless you can eat...people.</font></b></span>")

		if("Scum")
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/warfare, slot_back)
			equip_to_slot_or_del(new /obj/item/clothing/suit/scum, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/clothing/head/scum, slot_head)
			equip_to_slot_or_del(new /obj/item/storage/fancy/cigarettes/dromedaryco, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/storage/fancy/cigarettes/dromedaryco, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/storage/pill_bottle/happy, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/storage/pill_bottle/happy, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/storage/pill_bottle/zoom, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/thrones/bundle/t10, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/flame/lighter/zippo, slot_l_store)
			equip_to_slot_or_del(new /obj/item/torch/self_lit, slot_l_hand)
			equip_to_slot_or_del(new /obj/item/weapon/knuckleduster, slot_r_hand)
			to_chat(U,"<span class='notice'><b><font size=3>Always on the run, always moving from scheme to scheme. You'll do whatever it takes for a coin or two. Scamming, gambling, drug dealing...though your businesses have become more lucrative under the Fleet's restrictive new laws and the chaos the Conflict caused.</font></b></span>")
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,)
			if (prob(20))
				to_chat(U,"<span class='notice'><b><font size=2>Additionally...you've come across a lucky windfall, recently. Through theft, or your connections, or maybe even dumb luck, you found a key to the nobility's mansion and vault. All you need is a plan, maybe a crew or a disguise, and you'll be set to pull off the greatest heist of your life... (Your key should be in your backpack. If it isn't, tell Bear!)</font></b></span>")
				var/obj/item/card/id/nobility/IN = new
				equip_to_slot_or_del(IN, slot_r_store)

/*
		if("Witch") //oh shit what do i do with this now??
			U.add_skills(0,0,rand(5,9),0,rand(5,9))
			equip_to_slot_or_del(new /obj/item/clothing/mask/gas/prac_mask, slot_wear_mask)
			equip_to_slot_or_del(new /obj/item/clothing/suit/prac_arpon, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/warfare, slot_back)
			equip_to_slot_or_del(new /obj/item/storage/firstaid/adv, slot_l_hand)
			equip_to_slot_or_del(new /obj/item/storage/belt/medical/full, slot_belt)
			equip_to_slot_or_del(new /obj/item/clothing/gloves/prac_gloves, slot_gloves)
			equip_to_slot_or_del(new /obj/item/torch/self_lit, slot_l_hand)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/twenty, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/spellbook)
			U.add_spell(new /spell/radiant_aura/light)
			U.add_spell(new /spell/noclothes)
			to_chat(U,"<span class='notice'><b><font size=3>You are an unchained Arcanist. ..literally. After the Conflict, those in the great House Arcane were arrested and taken away, somewhere, for study. They simply vanished, one day, almost without a trace. Though the majority of those who carry a true magical spark are gone, you are one of the few that remain. You must keep your magic secret, however. The Fleet may not take too kindly to you...</font></b></span>")
			var/obj/item/card/id/ring/disgracedmedicae/W = new

			W.icon_state = "medicae_ring"
			W.assignment = "Scholar"
			W.registered_name = real_name
			W.update_label()
			equip_to_slot_or_del(W, slot_wear_id)
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,)
*/


/datum/job/innkeeper
	title = "Innkeeper"
	department_flag = PIL
	social_class = SOCIAL_CLASS_MED
	total_positions = 1
	spawn_positions = 1
	open_when_dead = 1
	supervisors = "Money"
	selection_color = "#848484"
	access = list(access_bar)
	minimal_access = list(access_bar)
	outfit_type = /decl/hierarchy/outfit/job/innkeeper
	latejoin_at_spawnpoints = TRUE
	announced = FALSE

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = IMPERIUM
		..()
		H.add_stats(rand(9,12), rand(7,12), rand(8,12), rand (8,11))
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.assign_random_quirk()
		H.verbs += list(
		/mob/living/carbon/human/proc/khorne,
		/mob/living/carbon/human/proc/nurgle,
		/mob/living/carbon/human/proc/slaanesh,
		/mob/living/carbon/human/proc/tzeentch)
		to_chat(H, "<span class='notice'><b><font size=3>You are the owner of a sizeable bar and inn, one of the last in the county. Thanks to some deals, you managed to pick up some fancy Fleet equipment that helps you mix drinks and cook food. You need the help, considering it's almost impossible to grow anything with all this snow....</font></b></span>")


/datum/job/merchant  //meh lol
	title = "House Noble"
	department_flag = PIL
	social_class = SOCIAL_CLASS_MAX
	total_positions = 1 //need to finish you friend.
	spawn_positions = 1
	open_when_dead = 1
	supervisors = "Money"
	selection_color = "#848484"
	access = list(access_bar,)
	minimal_access = list(access_bar)
	outfit_type = /decl/hierarchy/outfit/job/merchant
	latejoin_at_spawnpoints = TRUE
	announced = FALSE

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = IMPERIUM
		..()
		H.add_stats(rand(10,14), rand(10,14), rand(10,12), rand (9,11)) //they suck and are supposed to suck
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.assign_random_quirk()
		H.verbs += list(
		/mob/living/carbon/human/proc/khorne,
		/mob/living/carbon/human/proc/nurgle,
		/mob/living/carbon/human/proc/slaanesh,
		/mob/living/carbon/human/proc/tzeentch)
		to_chat(H, "<span class='notice'><b><font size=3>You are one of the last nobles on Biblio-32c that survived the Conflict. In a manner of twelve hours, your old life was erased by laser blasts from the sky, huge columns of fire that wiped out all traces of who you were. You life in relative squalor compared to what you used to live in, but it is still better than what the peasants are living in. Your goals often run against the Fleet's, trying to reduce their influence over what is rightly your land by birthright.</font></b></span>")

/datum/job/administrator  //so that the inn always has someone working
	title = "Mayor"
	department_flag = PIL|COM
	social_class = SOCIAL_CLASS_HIGH //better off than your average gross pilgrim
	total_positions = 1
	spawn_positions = 1
	head_position = 1
	open_when_dead = 1
	supervisors = "the Fleet and House Nobility"
	selection_color = "#515151"
	access = list(access_bar, access_maint_tunnels, access_clinic, access_administratum, access_change_ids, access_keycard_auth,)
	minimal_access = list(access_bar, access_maint_tunnels, access_clinic, access_administratum, access_change_ids, access_keycard_auth,)
	outfit_type = /decl/hierarchy/outfit/job/administrator
	latejoin_at_spawnpoints = TRUE
	announced = FALSE

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = IMPERIUM
		..()
		H.add_stats(rand(10,12), rand(9,12), rand(10,12), rand (12,15)) //a lil better fed than others.
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.assign_random_quirk()
		H.verbs += list(
		/mob/living/carbon/human/proc/khorne,
		/mob/living/carbon/human/proc/nurgle,
		/mob/living/carbon/human/proc/slaanesh,
		/mob/living/carbon/human/proc/tzeentch)
		to_chat(H, "<span class='notice'><b><font size=3>You are the mayor of your town, and you walk a tightrope job. You are expected to be the liaison between the village and the Fleet outpost, while serving the interests of the House Nobility. You technically have authorization to order both House Knights and Fleet Conscripts, but it's unlikely they'll listen to you. The memories of the Conflict are still fresh and violent in your mind, so though you're not a fan of the Fleet, you know you can't exactly fight them. Do the best you can.</font></b></span>")


//loadouts below here
/decl/hierarchy/outfit/job/penitent
	name = OUTFIT_JOB_NAME("Pilgrim")
	uniform = /obj/item/clothing/under/rank/penitent
	neck = /obj/item/reagent_containers/food/drinks/canteen
	shoes = /obj/item/clothing/shoes/prac_boots
	l_ear = null
	r_ear = null
	id_type = null
	gloves = null
	pda_slot = null


/decl/hierarchy/outfit/job/innkeeper
	name = OUTFIT_JOB_NAME("Innkeeper")
	uniform = /obj/item/clothing/under/syndicate
	suit = /obj/item/clothing/suit/innapron
	id_type = /obj/item/card/id/pilgrim/innkeeper
	pda_type = /obj/item/device/pda/penitent
	back = /obj/item/storage/backpack/satchel/warfare
	neck = /obj/item/reagent_containers/food/drinks/canteen
	head = /obj/item/clothing/head/bardhat
	l_ear = null
	r_ear = null
	pda_slot = null
	shoes = /obj/item/clothing/shoes/vigilante
	suit_store = /obj/item/gun/projectile/shotgun/pump/shitty
	backpack_contents = list(
	/obj/item/ammo_magazine/handful/shotgun/shotgun_handful = 2,
	/obj/item/storage/box/beanbags = 1,
	/obj/item/thrones/bundle/t14 = 1,
	)

/decl/hierarchy/outfit/job/merchant
	name = OUTFIT_JOB_NAME("House Noble")
	suit = /obj/item/clothing/suit/merchant
	pda_type = /obj/item/device/pda/penitent
	back = /obj/item/storage/backpack/satchel/warfare
	neck = /obj/item/reagent_containers/food/drinks/canteen
	head = /obj/item/clothing/head/smokingcap
	id_type = /obj/item/card/id/ring/nobility
	l_ear = null
	r_ear = /obj/item/device/radio/headset/red_team
	pda_slot = null
	shoes = /obj/item/clothing/shoes/laceup
	suit_store = null
	backpack_contents = list(
	/obj/item/thrones/bundle/t10 = 1,
	/obj/item/thrones/bundle/t6 = 2,
	/obj/item/card/id/stockades = 1,
	/obj/item/card/id/nobility = 1
	)


//Administrator
/decl/hierarchy/outfit/job/administrator
	name = OUTFIT_JOB_NAME("Administrator")
	uniform = /obj/item/clothing/under/rank/consort/adept
	head = /obj/item/clothing/head/commissar/adept
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/thick/swat/combat/warfare
	back = /obj/item/storage/backpack/satchel/warfare
	neck = /obj/item/reagent_containers/food/drinks/canteen
	id_type = /obj/item/card/id/ring/administrator
	l_ear = /obj/item/device/radio/headset/red_team/sl_delta
	belt = /obj/item/device/flashlight/lantern
	pda_slot = null
	backpack_contents = list(
	/obj/item/thrones/bundle/t5 = 1
	)
	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR

