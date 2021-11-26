/datum/reagent/tramadol/healingdraught
	name = "Healing Draught"
	description = "Paracausal healing in a bottle. Numbs pain and is surprisingly sweet. Won't fix your insides."
	taste_description = "overpowering honey-like sweetness"
	taste_mult = 5
	reagent_state = REAGENT_LIQUID
	color = "#e23636"
	overdose = REAGENTS_OVERDOSE
	scannable = 0
	flags = IGNORE_MOB_SIZE
	pain_power = 80 //magnitide of painkilling effect
	effective_dose = 0.5 //how many units it need to process to reach max power

/datum/reagent/healingdraught/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien != IS_DIONA)
		M.heal_organ_damage(10,10 * removed, 0)


/obj/item/reagent_containers/glass/jar/healingdraught
	icon_state = "ethanol"
	content = "healing draught"
	color = "grey"
	New()
		..()
		reagents.add_reagent(/datum/reagent/healingdraught, rand(volume/2,volume))