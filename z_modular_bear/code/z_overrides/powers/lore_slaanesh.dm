/////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////Begin Slaanesh//////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////
/mob/living/carbon/human/proc/slaanesh()
	set category = "Ruinous Powers"
	set name = "The Path of Asmodeus"
	set desc = "Embrace your hunger, your lust, your desire."
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't choose a path when you're dead.</span>") //notice I removed restraint requirement. A lil bdsm never stopped a slaaneshi boy
		return
	if(rage > 0)
		to_chat(src, "You are already sworn to Khorne!")	//usr has already selected another path!
		return
	if(decay > 0)
		to_chat(src, "You are already sworn to Nurgle!")	//usr has already selected another path!
		return
	if(intrigue > 0)
		to_chat(src, "You are already sworn to Tzeentch!")	//usr has already selected another path!
		return
	switch(src.lust)
		if(0)
			if(istype(src.l_hand, /obj/item/reagent_containers/pill/happy))
				qdel(usr.l_hand)
				to_chat(src, "You crack open the obscura instead of taking it orally, you snort the contents all at once. Sheer bliss courses through your neurons. Your mind has been opened to unfathomable depths of ecstasy. You feel xer call for more. You have taken the first step on the path of the Cloven Lust. You are not yet visibly corrupted but avoid detailed investigation. ")
				playsound(src, 'sound/effects/updated.ogg', 50, 0, -1)
				src.update_inv_l_hand()
				src.lust++
			else if(istype(src.r_hand, /obj/item/reagent_containers/pill/happy))
				qdel(usr.r_hand)
				to_chat(src, "You crack open the obscura instead of taking it orally, you snort the contents all at once. Sheer bliss courses through your neurons. Your mind has been opened to unfathomable depths of ecstasy. You feel xer call for more. You have taken the first step on the path of the Cloven Lust. You are not yet visibly corrupted but avoid detailed investigation. ")
				playsound(src, 'sound/effects/updated.ogg', 50, 0, -1)
				src.update_inv_r_hand()
				src.lust++
			else
				to_chat(src, "A soft giggle enters your mind. <font color='#ffb7c5'>Oh my, a new plaything wants in to my parlor?~ It's been so long! I would love to have you, darling, if you are witty enough to find us. Here is my first riddle- when you have the thing closest to pure bliss in your hands, think of me and what I would do.~</font>")
				return
		if(1)
			to_chat(src, "Your body is flooded with the knowledge of pleasure. The Cloven Lust's voice has trailed out into a tiny giggle and a whispered order. You are entranced by beauty, temptation, and the knowledge of things you should not know.")
			STAT_LEVEL(dex)+=1
			src.lust++
			src.verbs -= list(/mob/living/carbon/human/proc/nurgle, /mob/living/carbon/human/proc/khorne, /mob/living/carbon/human/proc/tzeentch)
			src.mind.special_role = "Slaanesh Cultist"
			AddInfectionImages()
			src.faction = "Slaanesh"
		if(2)
			src.verbs += /mob/living/carbon/human/proc/slaaneshrune
			to_chat(src, "Xer command is clear- xer symbol fills my mind, I see it when I close my eyes. I must find a place to draw it, too.")
			src.lust++
			GLOB.slaanesh_cult++
		if(3)
			var/obj/effect/decal/cleanable/slaanesh/T = locate() in src.loc
			if(T)
				src.lust++
				playsound(usr, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#ffb7c5'>Oh, darling, I'm so glad you could make it! Why don't you come on in?</font>")
			else
				to_chat(src, "I must draw xer symbol and stand upon it.")
				return
		if(4)
			if(src.w_uniform == null)
				playsound(usr, 'sound/effects/updated.ogg', 80, 0, -1)
				src.lust++
				to_chat(src, "The parlor door in your mind opens. You're welcomed to a table by Amodeus. Around you are folk dressed in colour and glamour <font color='#ffb7c5'>Oh, dear. How good to see you.</font> Xe looks even more beautiful than you could imagined- it's enough to take your breath away.<font color='#ffb7c5'>Tea? Coffee? Sugar?</font> Before you know what's happening, a soft-faced, androgynous man is already pouring you a drink. It smells incredible. Asmodeus purses xer lips and crosses xer legs. <font color='#ffb7c5'>Oh, but dear, you've come at <b>such</b> a bad time...</font>")
				new /obj/item/material/sword/skinning_knife(src.loc)
				return
			else
				to_chat(src, "You feel the parlor door remain firmly closed. <font color='#ffb7c5'>Oh, darling, but that outfit is so drab! Tell me...how would you dress to please me?~ </font>")
				return

		if(5)
			to_chat(src, "<font color='#ffb7c5'>Why...what with that winter outside, I've hardly any good food and drink to offer my guests. How awful!</font> Xe purses xer lips at you, smiling coyly. <font color='#ffb7c5'>Do me a favor, won't you, darling? Take my that knife and harvest yourself a mask from a dead body...</font> Xe lets out a soft giggle. <font color='#ffb7c5'> Oh, don't worry. I'm not asking you to kill anyone, am I, darling? ...Though I wouldn't object if you were that dedicated! Do build a tanning rack, you should be able to whittle one out of the logs strewn about this world. When you have the tanned hide, try my knife on it and carve yourself a new face so that the world may never find you...</font> ")
			src.lust++
			return
		if(6)
			for(var/obj/item/clothing/mask/masquerade/X in src.contents)
				if(X.slan == 1)
					playsound(usr, 'sound/effects/updated.ogg', 80, 0, -1)
					src.lust++
					to_chat(src, "<font color='#ffb7c5'> Brilliant! That looks marvelous. Darling..I think you will do great. Buut, you will need a toy of sorts, something to entertain my many guests!~</font>")
					STAT_LEVEL(dex) += 2
					return
			to_chat(src, "If it's a masquerade, I'll need a mask...")
			return
		if(7)
			to_chat(src, "<font color='#ffb7c5'>A lash should spice things up! Get some more tanned skin and a handle. How about an arm? That would certainly be macabre! Perfect for the theme! Wrap that hide around an arm, I'll take care of the rest.</font>")
			src.lust++
		if(8)
			for(var/obj/item/melee/whip/lashoftorment/X in src.contents)
				if(X.slan == 1)
					playsound(usr, 'sound/effects/updated.ogg', 80, 0, -1)
					src.lust++
					STAT_LEVEL(dex) += 1
					to_chat(src, "<font color='#ffb7c5'>Just a moment... How wonderful! That lash is an extension of myself, I can feed off of the suffering it brings. It's sure to be a hit! </font>")

			to_chat(src, "Tanned skin and an arm... Combine the two and I'll be one step closer to the party. How fun!")
		if(9)
			to_chat(src, "<font color='#800080'>A mask and a lash, kinky! You're nearly ready! You weren't planning on wearing those clothes though, were you? How drab? They are lacking in luster and elegance one would expect! Let's work on your threads, get some tanned hide, (sensing a theme?) and a few spools of cloth, put them together and let me go to work!</font>")
			src.lust++
		if(10)
			for(var/obj/item/clothing/suit/armor/slanclothing/X in src.contents)
				if(X.slan == 1)
					playsound(usr, 'sound/effects/updated.ogg', 80, 0, -1)
					STAT_LEVEL(str) += 1
					to_chat(src, "<font color='#800080'>Oh you look wonderful! Now you would fit right in!</font>")
					src.lust++


			to_chat(src, "More skin... I need more skin. I overheard some of the Tech-priests purchasing cloth from the munitorum earlier...")
		if(11)
			to_chat(src, "<font color='#800080'>You do know its proper to bring favors, yes? I'm not talking amasec or obscura, we indulge in something much sweeter... SUFFERING! Bring me, say, 100 units of suffering and we shall call that sufficient! (Check Ruinous Powers tab to pay your tithe!)</font>")
			src.verbs += list(/mob/living/carbon/human/proc/painpayment,)
		if(12)
			to_chat(src, "<font color='#800080'>A bit of bondage is nothing for my followers, grant me a taste of that succulent suffering and I shall make it so no chains can bind you.</font>")
			src.lust++
		if(13)
			to_chat(src, "<font color='#800080'>Now for one of my favorite party tricks, put on the mask and outfit and I will show it to you!</font>")
			src.lust++
		if(14)
			if(istype(wear_mask, /obj/item/clothing/mask/masquerade) && istype(wear_suit, /obj/item/clothing/suit/armor/slanclothing)) //hijacking this to give creepo noises
				playsound(usr, 'sound/effects/updated.ogg', 80, 0, -1)
				STAT_LEVEL(str) += 1
				STAT_LEVEL(dex) += 1
				to_chat(src, "<font color='#800080'>You feel it too, don't you? Stronger, more agile, more powerful. Will yourself to change and you can, offer me their suffering and in exchange you will feel nothing but the most intense of pleasures.</font>")
				src.verbs += /mob/living/carbon/human/proc/slannyarm
				src.lust++
			else
				to_chat(src, "I need to equip both my masquerade mask and macabre clothing!")
				return

////////////////////////////////////////////////
/////////////////Powers////////////////////////
//////////////////////////////////////////////
//Slaanesh pain payment
/mob/living/carbon/human/proc/painpayment()
	set category = "Ruinous Powers"
	set name = "Offer Suffering"
	set desc = "Embrace your hunger, your lust, your desire."
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't do this while you're dead.</span>") //notice I removed restraint requirement. A lil bdsm never stopped a slaaneshi boy
		return
	if(src.slanpain < 100)
		to_chat(src, "<span class='notice'>it's not enough! I need more suffering!</span>")
		return
	else
		to_chat(src, "<font color='#800080'>Delicious! Oh how wonderful, its rare to taste suffering this fresh, my guests will be overjoyed! You've done so well, I simply must reward you.</font>")
		src.verbs -= /mob/living/carbon/human/proc/painpayment
		src.verbs += /mob/living/carbon/human/proc/bdsmescape
		src.lust++
		src.slanpain -=100
		playsound(src, 'sound/effects/slanlaugh.ogg', 80, 0, -1)
		playsound(src, 'sound/effects/updated.ogg', 80, 0, -1)
		return

/mob/living/carbon/human/proc/bdsmescape()
	set category = "Ruinous Powers"
	set name = "Restraint Escape (20)"
	set desc = "Embrace your hunger, your lust, your desire."
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't do this while you're dead.</span>")
		return
	if(!src.restrained())
		to_chat(src, "<span class='notice'>You aren't restrained!</span>")
		return
	if(src.slanpain < 20)
		to_chat(src, "<span class='notice'>I don't have enough suffering to call upon my host!</span>")
		return
	else if((src.handcuffed) && (istype(src.handcuffed, /obj/item/handcuffs)))
		visible_message("[src] slips their bindings!")
		src.slanpain -=20
		src.handcuffed = null
		if(src.buckled && src.buckled.buckle_require_restraints)
			src.buckled.unbuckle_mob()
		src.update_inv_handcuffed()
		return

/mob/living/carbon/human/proc/slannyarm()
	set category = "Ruinous Powers"
	set name = "Mutate Arm (20)"
	set desc = "Embrace your hunger, your lust, your desire."
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't do this while you're dead.</span>")
		return
	if(src.is_toggled == 2)
		if(istype(usr.l_hand, /obj/item/material/sword/slanarm)) //Not the nicest way to do it, but eh
			visible_message("<span class='warning'>  [usr] speedily transforms their arm back to normal!</span>", "<span class='notice'>Your arm changes back to normal!</span>", "<span class='warning>What was that sound?</span>")
			qdel(usr.l_hand)
			update_icon()
			for(var/datum/species/X)
				X.slowdown = 0
		if(istype(usr.r_hand, /obj/item/material/sword/slanarm)) //Not the nicest way to do it, but eh
			qdel(usr.r_hand)
			visible_message("<span class='warning'>  [usr] speedily transforms their arm back to normal!</span>", "<span class='notice'>Your arm changes back to normal!</span>", "<span class='warning>What was that sound?</span>")
			for(var/datum/species/X)
				X.slowdown = 0
		src.icon_state = initial(icon_state)
		to_chat(usr,"You hide your mutated arm!")
		src.is_toggled = 1
	else if(src.slanpain < 20)
		to_chat(src, "<span class='notice'>You don't have enough suffering!</span>")
		return
	else
		visible_message("[src]'s arm rapidly mutates into a terrifying blade!")
		usr.put_in_hands(new /obj/item/material/sword/slanarm(usr))
		src.is_toggled = 2
		src.slanpain -=20
		for(var/datum/species/X) //this is one of those things that absolutely shouldn't work, but does. For some reason, this is the only way I've found to increase move speed.
			X.slowdown = -1