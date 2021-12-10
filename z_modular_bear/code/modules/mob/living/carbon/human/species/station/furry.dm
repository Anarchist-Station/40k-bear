// This is where all the important furry stuff is

//defines and stuff, unsorted

#define SPECIES_UNATHI			"Unathi"
#define SPECIES_SKRELL			"Skrell"
#define SPECIES_TESHARI			"Teshari"
#define SPECIES_TAJ				"Tajara"
#define SPECIES_PROMETHEAN		"Promethean"
#define SPECIES_DIONA			"Diona"
#define SPECIES_VOX				"Vox"
#define SPECIES_CARNIFEX		"Carnifex"

// Monkey and alien monkeys.
#define SPECIES_MONKEY			"Monkey"
#define SPECIES_MONKEY_TAJ		"Farwa"
#define SPECIES_MONKEY_SKRELL	"Neaera"
#define SPECIES_MONKEY_UNATHI	"Stok"

//species defines
#define SPECIES_AKULA			"Akula"
#define SPECIES_ALRAUNE			"Alraune"
#define SPECIES_NEVREAN			"Nevrean"
#define SPECIES_PROTEAN			"Protean"
#define SPECIES_RAPALA			"Rapala"
#define SPECIES_SERGAL			"Sergal"
#define SPECIES_VASILISSAN		"Vasilissan"
#define SPECIES_VULPKANIN		"Vulpkanin"
#define SPECIES_XENOCHIMERA		"Xenochimera"
#define SPECIES_XENOHYBRID		"Xenomorph Hybrid"
#define SPECIES_ZORREN_FLAT		"Flatland Zorren"
#define SPECIES_ZORREN_HIGH		"Zorren" //Occulus Edit - Removing Flatlander Zorren, making Highlander the default sprite.
#define SPECIES_CUSTOM			"Custom Species"
#define SPECIES_PHORONMAN		"Phoronoid"
#define SPECIES_MOTH			"Mothperson"

/datum/unarmed_attack/claws
	attack_verb = list("scratched", "clawed", "slashed")
	attack_noun = list("claws")
	eye_attack_text = "claws"
	eye_attack_text_victim = "sharp claws"
	attack_sound = 'sound/weapons/slice.ogg'
	miss_sound = 'sound/weapons/slashmiss.ogg'
	sharp = TRUE
	edge = TRUE

/datum/unarmed_attack/claws/show_attack(var/mob/living/carbon/human/user, var/mob/living/carbon/human/target, var/zone, var/attack_damage)
	var/obj/item/organ/external/affecting = target.get_organ(zone)

	attack_damage = CLAMP(attack_damage, 1, 5)

	if(target == user)
		user.visible_message(SPAN_DANGER("[user] [pick(attack_verb)] \himself in the [affecting.name]!"))
		return 0

	switch(zone)
		if(BP_HEAD, BP_MOUTH, BP_EYES)
			// ----- HEAD ----- //
			switch(attack_damage)
				if(1 to 2)
					user.visible_message(SPAN_DANGER("[user] scratched [target] across \his cheek!"))
				if(3 to 4)
					user.visible_message("<span class='danger'>[user] [pick(attack_verb)] [target]'s [pick(BP_HEAD, "neck")]!</span>") //'with spread claws' sounds a little bit odd, just enough that conciseness is better here I think
				if(5)
					user.visible_message(pick(
						SPAN_DANGER("[user] rakes \his [pick(attack_noun)] across [target]'s face!"),
						SPAN_DANGER("[user] tears \his [pick(attack_noun)] into [target]'s face!"),
						))
		else
			// ----- BODY ----- //
			switch(attack_damage)
				if(1 to 2)	user.visible_message(SPAN_DANGER("[user] scratched [target]'s [affecting.name]!"))
				if(3 to 4)	user.visible_message("<span class='danger'>[user] [pick(attack_verb)] [pick("", "", "the side of")] [target]'s [affecting.name]!</span>")
				if(5)		user.visible_message("<span class='danger'>[user] tears \his [pick(attack_noun)] [pick("deep into", "into", "across")] [target]'s [affecting.name]!</span>")

/datum/species
	limb_blend = ICON_MULTIPLY	//just to properly setup all the skin color stuff to use greyscaled sprites






///////////////////////////
//The actual species datums
///////////////////////////

/datum/species/unathi
	name = SPECIES_UNATHI
	name_plural = "Unathi"
	icobase = 'z_modular_bear/icons/mob/human_races/r_lizard_vr.dmi'		//Eclipse edit.
	deform = 'z_modular_bear/icons/mob/human_races/r_def_lizard_vr.dmi'		//Eclipse edit.
	tail = "sogtail"
	//tail_animation = 'icons/mob/species/unathi/tail_vr.dmi'		//Eclipse edit.
	tail_blend = ICON_MULTIPLY								//Eclipse edit.
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/sharp)
	primitive_form = SPECIES_MONKEY_UNATHI
	darksight = 3
//	ambiguous_genders = TRUE
	gluttonous = 1
	slowdown = 0.15
	total_health = 125
	brute_mod = 0.90	//syzygy edit
	burn_mod = 0.90		//also edit
	//color_mult = 1
//	metabolic_rate = 0.85
//	item_slowdown_mod = 0.25
	mob_size = MOB_LARGE
	blood_volume = 840
//	bloodloss_rate = 0.75
	num_alternate_languages = 3
	secondary_langs = list(LANGUAGE_UNATHI)
	name_language = LANGUAGE_UNATHI
//	species_language = LANGUAGE_UNATHI
//	health_hud_intensity = 2.5
	spawn_flags = SPECIES_CAN_JOIN

	min_age = 18
	max_age = 260

//	economic_modifier = 7

	blurb = "A reptilian species locally known as 'Kobolds'. They come in a variety of shapes and sizes \
	Most Kobolds feverently worship the Allfather, and it is the one thing all of their subspecies share in common.\
	There are some lizard-like creatures that serve aboard the Fleet, which are seperate and distinct from the Kobolds of Biblio. \
	(WIP)"

	cold_level_1 = 280 //Default 260 - Lower is better
	cold_level_2 = 220 //Default 200
	cold_level_3 = 130 //Default 120

	heat_level_1 = 420 //Default 360 - Higher is better
	heat_level_2 = 480 //Default 400
	heat_level_3 = 1100 //Default 1000

/*	breath_cold_level_1 = 260	//Default 240 - Lower is better
	breath_cold_level_2 = 200	//Default 180
	breath_cold_level_3 = 120	//Default 100
	breath_heat_level_1 = 450	//Default 380 - Higher is better
	breath_heat_level_2 = 530	//Default 450
	breath_heat_level_3 = 1400	//Default 1250
	minimum_breath_pressure = 18	//Bigger, means they need more air
*/
	body_temperature = T20C

//	spawn_flags = CAN_JOIN
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR

	flesh_color = "#34AF10"
	blood_color = "#f24b2e"		//syzygy edit
	base_color = "#066000"

//	reagent_tag = IS_UNATHI

//	move_trail = /obj/effect/decal/cleanable/blood/tracks/claw
/*
	has_limbs = list(
		BP_TORSO =  list("path" = /obj/item/organ/external/chest/unathi),
		BP_GROIN =  list("path" = /obj/item/organ/external/groin/unathi),
		BP_HEAD =   list("path" = /obj/item/organ/external/head/unathi),
		BP_L_ARM =  list("path" = /obj/item/organ/external/arm),
		BP_R_ARM =  list("path" = /obj/item/organ/external/arm/right),
		BP_L_LEG =  list("path" = /obj/item/organ/external/leg),
		BP_R_LEG =  list("path" = /obj/item/organ/external/leg/right),
		BP_L_HAND = list("path" = /obj/item/organ/external/hand),
		BP_R_HAND = list("path" = /obj/item/organ/external/hand/right),
		BP_L_FOOT = list("path" = /obj/item/organ/external/foot),
		BP_R_FOOT = list("path" = /obj/item/organ/external/foot/right)
		)
	//No kidneys or appendix
	has_organ = list(
		O_HEART =    /obj/item/organ/internal/heart/unathi,
		O_LUNGS =    /obj/item/organ/internal/lungs/unathi,
		O_LIVER =    /obj/item/organ/internal/liver/unathi,
		O_BRAIN =    /obj/item/organ/internal/brain/unathi,
		O_EYES =     /obj/item/organ/internal/eyes,
		)
*/

	heat_discomfort_level = 295
	heat_discomfort_strings = list(
		"You feel soothingly warm.",
		"You feel the heat sink into your bones.",
		"You feel warm enough to take a nap."
		)

	cold_discomfort_level = 292
	cold_discomfort_strings = list(
		"You feel chilly.",
		"You feel sluggish and cold.",
		"Your scales bristle against the cold."
		)
/*
	descriptors = list(
		/datum/mob_descriptor/height = 2,
		/datum/mob_descriptor/build = 2
		)*/

/datum/species/unathi/equip_survival_gear(var/mob/living/carbon/human/H)
	..()
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/sandal(H),slot_shoes)

/datum/species/tajaran
	name = SPECIES_TAJ
	name_plural = "Tajaran"
	icobase = 'z_modular_bear/icons/mob/human_races/r_tajaran_vr.dmi'
	deform = 'z_modular_bear/icons/mob/human_races/r_def_tajaran_vr.dmi'
	tail = "tajtail"
	//tail_animation = 'icons/mob/species/tajaran/tail.dmi'
	tail_blend = ICON_MULTIPLY								//Eclipse edit.
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/sharp)
	darksight = 8
	slowdown = -0.15
//	snow_movement = -1		//Ignores half of light snow
	brute_mod = 1.10
	burn_mod =  1.10
	flash_mod = 1.1
//	metabolic_rate = 1.1
	gluttonous = 1
	num_alternate_languages = 3
	secondary_langs = list(LANGUAGE_SIIK, LANGUAGE_AKHANI)
	name_language = LANGUAGE_SIIK
//	species_language = LANGUAGE_SIIK
//	health_hud_intensity = 2.5
	spawn_flags = SPECIES_CAN_JOIN

	min_age = 18
	max_age = 80

//	economic_modifier = 7

	blurb = "Hailing from the kingdom of Merelar from a far-away tundra. Tajaran are a hardy species of feline-like \
	bipedal sapients that easily stand below-freezing temperatures and adapt quickly to humid ones. The Tajaran are surprisingly \
	hardy in this new world, and have, if anything, grown in size as they move south towards 'warmer' temperatures, away from the \
	now-unlivable far north."
	body_temperature = 293.15	//this actualy fixes itchy fur spam

	cold_level_1 = 200 //Default 260
	cold_level_2 = 140 //Default 200
	cold_level_3 = 80  //Default 120



	heat_level_1 = 330 //Default 360
	heat_level_2 = 380 //Default 400
	heat_level_3 = 800 //Default 1000
	/*
	breath_cold_level_1 = 180	//Default 240 - Lower is better
	breath_cold_level_2 = 100	//Default 180
	breath_cold_level_3 = 60	//Default 100
	breath_heat_level_1 = 360	//Default 380 - Higher is better
	breath_heat_level_2 = 430	//Default 450
	breath_heat_level_3 = 1000	//Default 1250
*/
	primitive_form = SPECIES_MONKEY_TAJ

//	spawn_flags = CAN_JOIN
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR

	flesh_color = "#AFA59E"
	base_color = "#333333"

//	reagent_tag = IS_TAJARA

//	move_trail = /obj/effect/decal/cleanable/blood/tracks/paw

	heat_discomfort_level = 303		// Occulus edit - this does nothing for itchy fur spam, see body temp above
	heat_discomfort_strings = list(
		"Your fur prickles in the heat.",
		"You feel uncomfortably warm.",
		"Your overheated skin itches."
		)

	cold_discomfort_level = 275
/*
	has_organ = list(    //No appendix.
		O_HEART =    /obj/item/organ/internal/heart,
		O_LUNGS =    /obj/item/organ/internal/lungs,
		O_VOICE = 		/obj/item/organ/internal/voicebox,
		O_LIVER =    /obj/item/organ/internal/liver,
		O_KIDNEYS =  /obj/item/organ/internal/kidneys,
		O_BRAIN =    /obj/item/organ/internal/brain,
		O_EYES =     /obj/item/organ/internal/eyes
		)
*/
/datum/species/tajaran/equip_survival_gear(var/mob/living/carbon/human/H)
	..()
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/sandal(H),slot_shoes)

/datum/species/skrell
	name = SPECIES_SKRELL
	name_plural = "Skrell"
	icobase = 'z_modular_bear/icons/mob/human_races/r_skrell_vr.dmi'
	deform = 'z_modular_bear/icons/mob/human_races/r_def_skrell_vr.dmi'
	primitive_form = SPECIES_MONKEY_SKRELL
	unarmed_types = list(/datum/unarmed_attack/punch)
	blurb = "The Skrell are a race of amphibious, cold-blooded humanoid aliens. They are one of the most common \
	races one will find in the Fleet, consisting of half of the available forces. Nobody is quite sure why this is the case. \
	 It is rumored that the Admiral, if he still lives, would have to be a Skrell for him to still be alive. Their \
	 now-defunct society is said to have held gender in a remarkably fluid regard. Nobody knows what this means, anymore. \
	 But...good for them?"
	num_alternate_languages = 4 //Let's give the smart frogs some love
	secondary_langs = list(LANGUAGE_SKRELLIAN, LANGUAGE_SCHECHI)
	name_language = LANGUAGE_SKRELLIAN
//	species_language = LANGUAGE_SKRELLIAN
//	assisted_langs = list(LANGUAGE_EAL, LANGUAGE_TERMINUS, LANGUAGE_ROOTLOCAL, LANGUAGE_ROOTGLOBAL, LANGUAGE_VOX)
//	health_hud_intensity = 2
	spawn_flags = SPECIES_CAN_JOIN

//	water_movement = -3

	min_age = 19
	max_age = 130

//	economic_modifier = 12

	darksight = 4
	flash_mod = 1.2
//	chemOD_mod = 0.9

//	bloodloss_rate = 1.5

//	ambiguous_genders = TRUE

//	spawn_flags = CAN_JOIN
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR

	flesh_color = "#8CD7A3"
	blood_color = "#1D2CBF"
	base_color = "#006666"

	cold_level_1 = 280 //Default 260 - Lower is better
	cold_level_2 = 220 //Default 200
	cold_level_3 = 130 //Default 120



	heat_level_1 = 420 //Default 360 - Higher is better
	heat_level_2 = 480 //Default 400
	heat_level_3 = 1100 //Default 1000
/*
	breath_cold_level_1 = 250	//Default 240 - Lower is better
	breath_cold_level_2 = 190	//Default 180
	breath_cold_level_3 = 120	//Default 100
	breath_heat_level_1 = 400	//Default 380 - Higher is better
	breath_heat_level_2 = 500	//Default 450
	breath_heat_level_3 = 1350	//Default 1250
	reagent_tag = IS_SKRELL*/

/*	has_limbs = list(
		BP_TORSO =  list("path" = /obj/item/organ/external/chest),
		BP_GROIN =  list("path" = /obj/item/organ/external/groin),
		BP_HEAD =   list("path" = /obj/item/organ/external/head/skrell),
		BP_L_ARM =  list("path" = /obj/item/organ/external/arm),
		BP_R_ARM =  list("path" = /obj/item/organ/external/arm/right),
		BP_L_LEG =  list("path" = /obj/item/organ/external/leg),
		BP_R_LEG =  list("path" = /obj/item/organ/external/leg/right),
		BP_L_HAND = list("path" = /obj/item/organ/external/hand),
		BP_R_HAND = list("path" = /obj/item/organ/external/hand/right),
		BP_L_FOOT = list("path" = /obj/item/organ/external/foot),
		BP_R_FOOT = list("path" = /obj/item/organ/external/foot/right)
		)
/datum/species/skrell/can_breathe_water()
	return TRUE*/

/datum/species/sergal
	name = SPECIES_SERGAL
	name_plural = "Sergals"
	icobase = 'z_modular_bear/icons/mob/human_races/r_sergal.dmi'
	deform = 'z_modular_bear/icons/mob/human_races/r_def_sergal.dmi'
	tail = "tail"
	//tail_animation = 'z_modular_bear/icons/mob/human_races/r_sergal.dmi'
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/sharp)
	//darksight = 8
	//slowdown = -0.5
	//brute_mod = 1.15
	//burn_mod =  1.15
	//gluttonous = 1
	num_alternate_languages = 3
//	secondary_langs = list(LANGUAGE_SAGARU)
//	name_language = LANGUAGE_SAGARU
	//color_mult = 1
	spawn_flags = SPECIES_CAN_JOIN

	min_age = 18
	max_age = 80

	blurb = "Hailing from the heavily alborereal nation of Talevia, or more commonly known as 'Tal'. Sergals were one of the races most affected \
	by the Conflict. In the ensuing winter, nearly all the lush forests and thick jungles that Sergals called home withered and died, leaving most of \
	them to move on or starve. Their tall bodies and dense muscles, with claws on their feet and hands, made for ideal mobility while moving in foliage. \
	Less so now."

	primitive_form = "Saru"

//	spawn_flags = CAN_JOIN
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR
//	//inherent_verbs = list(/mob/living/proc/shred_limb)

	flesh_color = "#AFA59E"
	base_color = "#777777"

//	reagent_tag = IS_SERGAL

	heat_discomfort_strings = list(
		"Your fur prickles in the heat.",
		"You feel uncomfortably warm.",
		"Your overheated skin itches."
		)

/*	has_limbs = list(
		BP_TORSO =  list("path" = /obj/item/organ/external/chest),
		BP_GROIN =  list("path" = /obj/item/organ/external/groin),
		BP_HEAD =   list("path" = /obj/item/organ/external/head/vr/sergal),
		BP_L_ARM =  list("path" = /obj/item/organ/external/arm),
		BP_R_ARM =  list("path" = /obj/item/organ/external/arm/right),
		BP_L_LEG =  list("path" = /obj/item/organ/external/leg),
		BP_R_LEG =  list("path" = /obj/item/organ/external/leg/right),
		BP_L_HAND = list("path" = /obj/item/organ/external/hand),
		BP_R_HAND = list("path" = /obj/item/organ/external/hand/right),
		BP_L_FOOT = list("path" = /obj/item/organ/external/foot),
		BP_R_FOOT = list("path" = /obj/item/organ/external/foot/right)
		)
*/
/datum/species/akula
	name = SPECIES_AKULA
	name_plural = "Akula"
	icobase = 'z_modular_bear/icons/mob/human_races/r_akula.dmi'
	deform = 'z_modular_bear/icons/mob/human_races/r_def_akula.dmi'
	tail = "tail"
	//tail_animation = 'z_modular_bear/icons/mob/human_races/r_akula.dmi'
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/sharp)
	//darksight = 8
	//slowdown = -0.5
	//brute_mod = 1.15
	//burn_mod =  1.15
	//gluttonous = 1
	num_alternate_languages = 3
	secondary_langs = list(LANGUAGE_SKRELLIAN)
	name_language = LANGUAGE_SKRELLIAN
//	assisted_langs = list(LANGUAGE_EAL, LANGUAGE_TERMINUS, LANGUAGE_SKRELLIANFAR, LANGUAGE_ROOTLOCAL, LANGUAGE_ROOTGLOBAL, LANGUAGE_VOX)	//Eclipse edit: Removes Skrellian from assisted languages as a patch
	//color_mult = 1
	//inherent_verbs = list(/mob/living/proc/shred_limb)
	spawn_flags = SPECIES_CAN_JOIN

	min_age = 18
	max_age = 80

	blurb = "Not an offical species, however it is here so it's sprite can be used for custom species." //Occulus edit

	primitive_form = "Sobaka"

//	spawn_flags = CAN_JOIN
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR

	flesh_color = "#AFA59E"
	base_color = "#777777"
	blood_color = "#1D2CBF"

//	reagent_tag = IS_AKULA
/*
/datum/species/akula/can_breathe_water()
	return TRUE // Surprise, SHERKS.
*/
/datum/species/nevrean
	name = SPECIES_NEVREAN
	name_plural = "Nevreans"
	icobase = 'z_modular_bear/icons/mob/human_races/r_nevrean.dmi'
	deform = 'z_modular_bear/icons/mob/human_races/r_def_nevrean.dmi'
	tail = "tail"
//	icobase_tail = 1
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/sharp)
	//darksight = 8
	//slowdown = -0.5
	//brute_mod = 1.15
	//burn_mod =  1.15
	//gluttonous = 1
	num_alternate_languages = 3
//	secondary_langs = list(LANGUAGE_BIRDSONG)
//	name_language = LANGUAGE_BIRDSONG
//	//color_mult = 1
	//inherent_verbs = list(/mob/living/proc/shred_limb,/mob/living/proc/flying_toggle,/mob/living/proc/start_wings_hovering)

	min_age = 18
	max_age = 80

	blurb = "A generally-nomadic species, Nevreans are an avian species that stand nearly a third shorter than most sapient species, known as extremely \
	bright and social creatures, they have taken to rapid advancement into the space age better than their neighbors. Nevreans themselves are omnivores with \
	lithe bodies and flightless, winged arms that work well in groups and have found themselves better in people-facing careers rather than physical due to their \
	colorful and 'pretty' nature. However this has given them a promiscuous stereotype, and...you know, the world is frozen. "

	primitive_form = "Sparra"

	spawn_flags = SPECIES_CAN_JOIN
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR

	flesh_color = "#AFA59E"
	base_color = "#333333"

//	reagent_tag = IS_SERGAL

	heat_discomfort_strings = list(
		"Your plumage prickles in the heat.",
		"You feel uncomfortably warm.",
		"Your overheated skin itches."
		)

/datum/species/hi_zoxxen
	name = SPECIES_ZORREN_HIGH
	name_plural = "Zorren"
	icobase = 'z_modular_bear/icons/mob/human_races/r_fox_vr.dmi'
	deform = 'z_modular_bear/icons/mob/human_races/r_def_fox.dmi'
	tail = "tail"
//	icobase_tail = 1
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/sharp)
	num_alternate_languages = 3
	secondary_langs = list()
//	assisted_langs = list(LANGUAGE_EAL, LANGUAGE_SKRELLIAN, LANGUAGE_SKRELLIANFAR, LANGUAGE_ROOTLOCAL, LANGUAGE_ROOTGLOBAL, LANGUAGE_VOX)	//Eclipse edit: Zorren can speak Terminus unassisted.

	min_age = 18
	max_age = 80

	blurb = "The fox-like Zorren are native to  Biblio, however there are two distinct varieties of Zorren one with large ears and shorter fur, \
	and the other with longer fur that is a bit more vibrant. The long-eared, short-furred Zorren have come to be known as Flatland Zorren as that \
	is where most of their settlements are located. The Flatland Zorren are somewhat tribal and shamanistic. \
	The other variety of Zorren are known as Highland Zorren as they frequently settle in hilly and/or \
	mountainous areas, they have a differing societal structure than the Flatland Zorren having a more feudal social structure, like the Flatland Zorren, \
	Though similar fox-like beings have been seen they are different than the Zorren."

	//primitive_form = "" //We don't have fox-monkey sprites.

	spawn_flags = SPECIES_CAN_JOIN
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR
	flesh_color = "#AFA59E"
	base_color = "#333333"
	blood_color = "#240bc4"
	//color_mult = 1

	heat_discomfort_strings = list(
		"Your fur prickles in the heat.",
		"You feel uncomfortably warm.",
		"Your overheated skin itches."
		)
	//inherent_verbs = list(/mob/living/proc/shred_limb)

/datum/species/fl_zorren
	name = SPECIES_ZORREN_FLAT
	name_plural = "Zorren"
	icobase = 'z_modular_bear/icons/mob/human_races/r_fennec_vr.dmi'
	deform = 'z_modular_bear/icons/mob/human_races/r_def_fennec.dmi'
	tail = "tail"
//	icobase_tail = 1
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/sharp)
	num_alternate_languages = 3
	secondary_langs = list()
//	assisted_langs = list(LANGUAGE_EAL, LANGUAGE_SKRELLIAN, LANGUAGE_SKRELLIANFAR, LANGUAGE_ROOTLOCAL, LANGUAGE_ROOTGLOBAL, LANGUAGE_VOX)	//Eclipse edit: Zorren can speak Terminus unassisted.

	min_age = 18
	max_age = 80

	blurb = "The fox-like Zorren are native to Biblio, however there are two distinct varieties of Zorren one with large ears and shorter fur, \
	and the other with longer fur that is a bit more vibrant. The long-eared, short-furred Zorren have come to be known as Flatland Zorren as that is \
	where most of their settlements are located. The Flatland Zorren are somewhat tribal and shamanistic as they have only recently started to be \
	hired by the Trans-Stellar Corporations. The other variety of Zorren are known as Highland Zorren as they frequently settle in hilly and/or \
	mountainous areas, they have a differing societal structure than the Flatland Zorren having a more feudal social structure, like the Flatland Zorren, \
	the Highland Zorren have also only recently been hired by the Trans-Stellar Corporations, but thanks to the different social structure they \
	seem to have adjusted better to their new lives. Though similar fox-like beings have been seen they are different than the Zorren."

	//primitive_form = "" //We don't have fennec-monkey sprites.
	spawn_flags = SPECIES_CAN_JOIN
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR

	flesh_color = "#AFA59E"
	base_color = "#333333"
	blood_color = "#240bc4"
	//color_mult = 1
	//inherent_verbs = list(/mob/living/proc/shred_limb)

	heat_discomfort_strings = list(
		"Your fur prickles in the heat.",
		"You feel uncomfortably warm.",
		"Your overheated skin itches."
		)


/datum/species/vulpkanin
	name = SPECIES_VULPKANIN
	name_plural = "Vulpkanin"
	icobase = 'z_modular_bear/icons/mob/human_races/r_vulpkanin.dmi'
	deform = 'z_modular_bear/icons/mob/human_races/r_vulpkanin.dmi'
//	path = /mob/living/carbon/human/vulpkanin
//	default_language = "Sol Common"
	secondary_langs = list(LANGUAGE_YUELDISCH)
	name_language = LANGUAGE_YUELDISCH
	primitive_form = "Wolpin"
	tail = "vulptail"
	//tail_animation = 'icons/mob/species/vulpkanin/tail.dmi' // probably need more than just one of each, but w/e
	tail_blend = ICON_MULTIPLY								//Eclipse edit.
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/sharp)
	darksight = 5 //worse than cats, but better than lizards. -- Poojawa
//	gluttonous = 1
	num_alternate_languages = 3
	//color_mult = 1
	//inherent_verbs = list(/mob/living/proc/shred_limb)

	blurb = "Vulpkanin is a name given to any general upright-standing canid race, of which there are a surprising amount. (wip)" //Occulus edit

	primitive_form = "Wolpin"

		/* ECLIPSE EDIT - Re-added and updated with new GOON CODE sounds. Check the License file for details.*/
/*	speech_sounds = list('sound/goonstation/voice/growl1.ogg','sound/goonstation/voice/growl2.ogg','sound/goonstation/voice/growl3.ogg')
	speech_chance = 20
	scream_verb = "howls"
	male_scream_sound = 'sound/goonstation/voice/howl.ogg'
	female_scream_sound = 'sound/goonstation/voice/howl.ogg'
*/


	spawn_flags = SPECIES_CAN_JOIN
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR

	flesh_color = "#966464"
	base_color = "#B43214"

	min_age = 18
	max_age = 80
