//taking steps to reduce power-creep and normalize mob stats because no spess marines, less pop. will make balance changes in here for most things


// Zygote: guns and OP armor rarer- so they're slower, do more dmg, have less health, but because most ppl use melee, will be hard to avoid 'guarenteed' dmg



/mob/living/simple_animal/hostile/smalldemon/zygote //squishier, a bit slower
	name = "melted kobold"
	real_name = "melted kobold"
	desc = "A horrific mass of acid and flesh. Looks fragile, but its undulating limbs drip with a vile, acidic-smelling substance, and sharp bone spurs occasionally poke out of its skin. Used to be a kobold. Isn't, now."
	maxHealth = 100
	health = 100
	speed = 2

/mob/living/simple_animal/hostile/smalldemon/zygote/AttackingTarget()
	if(!Adjacent(target_mob))
		return
	custom_emote(1, pick( list("sloshes at [target_mob]", "tears [target_mob]") ) ) // attack emotes

	var/damage = rand(20,25) // Damage Value

	if(ishuman(target_mob))
		var/mob/living/carbon/human/H = target_mob
		var/dam_zone = pick(BP_CHEST)
		var/obj/item/organ/external/affecting = H.get_organ(ran_zone(dam_zone))
		H.apply_damage(damage, BRUTE, affecting, H.run_armor_check(affecting, "melee"), DAM_SHARP|DAM_EDGE) // damage type
		return H
	else if(isliving(target_mob))
		var/mob/living/L = target_mob
		L.adjustBruteLoss(damage)
		return L


/mob/living/simple_animal/hostile/smalldemon //TODO: replace this entirely with custom kabob sprites
	name = "warped kobold"
	real_name = "warped kobold"
	desc = "A tiny thing that had its scales transformed and warped into something horiffic. Quick, but fragile, and easily exhausted."
	speed = 1
	maxHealth = 50
	health = 50


/mob/living/simple_animal/hostile/smalldemon/AttackingTarget()
	if(!Adjacent(target_mob))
		return
	custom_emote(1, pick( list("slashes at [target_mob]", "bites [target_mob]") ) )

	var/damage = rand(10,20)

	if(ishuman(target_mob))
		var/mob/living/carbon/human/H = target_mob
		var/dam_zone = pick(BP_CHEST, BP_L_HAND, BP_R_HAND, BP_L_LEG, BP_R_LEG) // Body Part Targetting
		var/obj/item/organ/external/affecting = H.get_organ(ran_zone(dam_zone))
		H.apply_damage(damage, BRUTE, affecting, H.run_armor_check(affecting, "melee"), DAM_SHARP|DAM_EDGE)
		return H
	else if(isliving(target_mob))
		var/mob/living/L = target_mob
		L.adjustBruteLoss(damage)
		return L


// Bloodletter - same features, reduced stats
/mob/living/simple_animal/hostile/smalldemon/bloodletter
	name = "skinned orc"
	real_name = "skinned orc"
	desc = "An orc skinned to his flesh. It breathes in and out heavily, gazing at you with starving eyes and a desire to do exactly what happened to it...to you."
	icon = 'icons/mob/animal.dmi'
	icon_state = "khorne_daemon" // Average speed. High damage and HP.
	icon_living = "khorne_daemon"
	icon_dead = "khorne_daemon_dead_anim"
	maxHealth = 150
	health = 150

/mob/living/simple_animal/hostile/smalldemon/bloodletter/AttackingTarget()
	if(!Adjacent(target_mob))
		return
	custom_emote(1, pick( list("slices at [target_mob]", "tears [target_mob]") ) ) // attack emotes

	var/damage = rand(35,45) // Damage Value

	if(ishuman(target_mob))
		var/mob/living/carbon/human/H = target_mob
		var/dam_zone = pick(BP_HEAD, BP_L_HAND, BP_R_HAND)
		var/obj/item/organ/external/affecting = H.get_organ(ran_zone(dam_zone))
		H.apply_damage(damage, BRUTE, affecting, H.run_armor_check(affecting, "melee"), DAM_SHARP|DAM_EDGE) // damage type
		return H
	else if(isliving(target_mob))
		var/mob/living/L = target_mob
		L.adjustBruteLoss(damage)
		return L
	faction = "Khorne"


/mob/living/simple_animal/hostile/smalldemon/bubblingmass
	name = "Grotesque Horror" // Slow. S L O W.
	real_name = "Grotesque Horror"
	desc = "This violet bubbling mass of flesh and meat crawls toward you. Incredibly slow. Devestatingly powerful."
	speak_emote = list("harks")
	emote_hear = list("growls")
	response_help  = "gnashes"
	response_disarm = "shoves"
	response_harm   = "mauls"
	attacktext = "crushes"
	maxHealth = 150
	health = 150
	see_in_dark = 6
	speed = 6
	faction = "Khorne"


/mob/living/simple_animal/hostile/smalldemon/bubblingmass/AttackingTarget()
	if(!Adjacent(target_mob))
		return
	custom_emote(1, pick( list("bites [target_mob]", "crushes [target_mob]") ) ) // attack emotes

	var/damage = rand(25,30) // Damage Value

	if(ishuman(target_mob))
		var/mob/living/carbon/human/H = target_mob
		var/dam_zone = pick(BP_CHEST)
		var/obj/item/organ/external/affecting = H.get_organ(ran_zone(dam_zone))
		H.apply_damage(damage, BRUTE, affecting, H.run_armor_check(affecting, "melee"), DAM_SHARP|DAM_EDGE) // damage type
		return H
	else if(isliving(target_mob))
		var/mob/living/L = target_mob
		L.adjustBruteLoss(damage)
		return L


/mob/living/simple_animal/hostile/smalldemon/fleshbeast
	name = "Flesh Beast"
	real_name = "Flesh Beast" // Average speed. Medium damage and HP.
	desc = "This violet mass of flesh and meat scatters toward you."
	icon = 'icons/mob/animal.dmi'
	icon_state = "loge"
	icon_living = "loge"
	icon_dead = "loge2"
	maxHealth = 150
	health = 150
	speak_emote = list("harks")
	emote_hear = list("growls")
	response_help  = "gnashes"
	response_disarm = "shoves"
	response_harm   = "mauls"
	attacktext = "bites"
	see_in_dark = 6

	speed = 10
	faction = "Nurgle"
	faction = "Slaanesh"
	faction = "Khorne"
