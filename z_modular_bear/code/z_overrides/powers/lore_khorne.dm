/////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////Begin Khorne////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////
//required defines first
/mob/living/carbon/human
	var/sacrifice_cd = 0


/mob/living/carbon/human/proc/khorne() //this is so bad. thank god there's no atmos so the server can be dedicated to computing this shitty fucking proc
	set category = "Ruinous Powers"
	set name = "The Path of the Allfather"
	set desc = "Sieze the day. Kill your enemies."
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't choose a path when you're dead.</span>")
		return
	if(!src.canmove || src.stat || src.restrained())
		to_chat(src, "You cannot call upon Khorne while restrained!")	//user is tied up
		return
	if(decay > 0)
		to_chat(src, "You are already sworn to Nurgle!")	//usr has already selected another path!
		return
	if(lust > 0)
		to_chat(src, "You are already sworn to Slaanesh!")	//usr has already selected another path!
		return
	if(intrigue > 0)
		to_chat(src, "You are already sworn to Tzeentch!")	//usr has already selected another path!
		return
	switch(src.rage)
		if(0)
			if(istype(src.l_hand, /obj/item/reagent_containers/food/snacks/meat/grox))
				qdel(usr.l_hand)
				to_chat(src, "You devour the tainted meat, a burning rage fills your gut and awakens you to a grim reality. <font color='#720202'>You have taken the first step proving your willingness to kill in the name of the Allfather.</font> You are not yet visibly corrupted but avoid detailed investigation.")
				playsound(usr, 'sound/effects/updated.ogg', 80, 0, -1)
				src.update_inv_l_hand()
				src.rage++
			else if(istype(src.r_hand, /obj/item/reagent_containers/food/snacks/meat/grox))
				qdel(usr.r_hand)
				to_chat(src, "You devour the tainted meat, a burning rage fills your gut and awakens you to a grim reality. <font color='#720202'>You have taken the first step proving your willingness to kill in the name of the Allfather.</font> You are not yet visibly corrupted but avoid detailed investigation.")
				playsound(usr, 'sound/effects/updated.ogg', 80, 0, -1)
				src.update_inv_r_hand()
				src.rage++
			else
				to_chat(src, "You feel the need to prove yourself. The Allfather demands his servants be willing to kill and sacrifice in his name. Sacrifice a food-thing grox and harvest their meat.")
				return
		if(1)
			to_chat(src, "You feel a wave of heat run down your body. Your stance feels more solid, body more capable. Your wounds suddenly...do not feel so bad.")
			STAT_LEVEL(str)+=5
			src.adjustBruteLoss(-30)
			src.adjustFireLoss(-30)
			src.rage++
			src.verbs -= list(/mob/living/carbon/human/proc/nurgle, /mob/living/carbon/human/proc/slaanesh, /mob/living/carbon/human/proc/tzeentch)
			src.mind.special_role = "Khorne Cultist"
			src.faction = "Khorne"
			AddInfectionImages()
		if(2)
			src.verbs += /mob/living/carbon/human/proc/khornerune
			to_chat(src, "Hatred, rage and fury like you've never known consume your mind and block out your every thought. Flashes of a symbol appear in your mind. You feel compelled to draw it.")
			src.rage++
			GLOB.khorne_cult++
		if(3)
			var/obj/effect/decal/cleanable/khorne/T = locate() in src.loc
			if(T)
				src.rage++
				playsound(usr, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "This... is it. That symbol. Just the sight of it quickens your heart and pumps adrenaline through your veins. <font color='#720202'>You can hear His voice more clearly now. He is displeased with how...basic it is, but it will do. He has a task for you.</font>")
				src.verbs += /mob/living/carbon/human/proc/bludforbludguy
			else
				to_chat(src, "I must draw his symbol and stand upon it!")
				return
		if(4)
			var/obj/effect/decal/cleanable/khorne/T = locate() in src.loc
			var/obj/item/stack/material/plasteel/Y = locate() in T.loc
			if(T && Y)
				to_chat(src, "<font color='#cf3441'>You have done well. Observe these machines. Look at how lifeless their bodies truly are.</font> The plasteel vanishes in front of you. <font color='#720202'> Think upon how little pity you felt for killing this thing. What seperates it from your fellows? Nothing. Now, you will learn to kill without emotion, as well.</font> You feel your heart harden. You are no longer affected by dead bodies or killing.")
				src.set_trait(new/datum/trait/death_tolerant) //no more getting spooked by dead bodies
				src.rage++
				playsound(usr, 'sound/effects/updated.ogg', 80, 0, -1)
				qdel(Y)
			else if(!Y)
				to_chat(src, "His voice strengthens. You can hear him clearer. <font color='#cf3441'>Child,</font> the voice in your mind rumbles, deep as the mountains themselves, <font color='#cf3441'>I have a task for you to prove your worth. Find one of the machines that have taken the place of warriors, and destroy it. Take its blown-apart metal shell and bring it to me. I will reward you. Take my blessing for this task.</font>")
				return

/mob/living/carbon/human/proc/bludforbludguy()
	set name = "This is NOTHING!"
	set category = "Ruinous Powers"
	set desc = "Ignore your wounds! Fight on! Ow, your skull! Owie!"

	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Bear immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't choose a path when you're dead.</span>")
		return
	if(!src.canmove || src.stat || src.restrained())
		to_chat(src, "You can't consume while you're tied!")	//user is tied up
		return

	if(src.khorne_cd == 0)
		src.say("El'nath Allfather at'meunto!")
		to_chat(src, "<span class='notice'>You feel your wounds knitting and a dull pain in your head.</span>")
		src.adjustBruteLoss(-30)
		src.adjustFireLoss(-30)
		src.adjustToxLoss(-30)
		src.adjustBrainLoss(15)
		src.khorne_cd = 1
		sleep(500)
		src.khorne_cd = 0
	else
		to_chat(src, "You cannot yell again so soon!")
		return

/mob/living/carbon/human/proc/rageout()
	set name = "Meat to Brawn"
	set category = "Ruinous Powers"
	set desc = "Slightly increase your strength, consuming a delicious slab o' meat."
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How are you seeing this?! Ping Bear immediately!!</span>")
		return
	if(!src.canmove || src.stat || src.restrained())
		to_chat(src, "You can't consume while you're tied!")	//user is tied up
		return

	if(src.sacrifice_cd == 0)
		if(istype(src.l_hand, /obj/item/reagent_containers/food/snacks/meat/))
			qdel(usr.l_hand)
			to_chat(src, "You feel stronger!")
			src.emote("ravenously consumes the meat in their hands!")
			src.update_inv_l_hand()
			STAT_LEVEL(str)+=1
			src.sacrifice_cd = 1
			sleep(100)
			src.sacrifice_cd = 0
		else if(istype(src.r_hand, /obj/item/reagent_containers/food/snacks/meat/))
			qdel(usr.r_hand)
			to_chat(src, "You feel stronger!")
			src.update_inv_r_hand()
			STAT_LEVEL(str)+=1
			src.sacrifice_cd = 1
			sleep(100)
			src.sacrifice_cd = 0