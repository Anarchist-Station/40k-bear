/////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////Begin Tzeentch//////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////
/mob/living/carbon/human/proc/tzeentch()
	set category = "Ruinous Powers"
	set name = "The Path of Eurydale"
	set desc = "Rebirth"
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't choose a path when you're dead.</span>")
		return
	if(!src.canmove || src.stat || src.restrained())
		to_chat(src, "You cannot call upon Tzeentch while restrained!")	//user is tied up
		return
	if(rage > 0)
		to_chat(src, "You are already sworn to Khorne!")	//usr has already selected another path!
		return
	if(lust > 0)
		to_chat(src, "You are already sworn to Slaanesh!")	//usr has already selected another path!
		return
	if(decay > 0)
		to_chat(src, "You are already sworn to Nurgle!")	//usr has already selected another path!
		return
	switch(src.intrigue)
		if(0)
			if(prob(1))
				src.intrigue++
				playsound(usr, 'sound/misc/nymphchirp.ogg', 80, 0, -1)
				to_chat(src, "<font color='#436b47'>...you're so persistent.</font>")
			to_chat(src, "<font color='#0400ff'>Can't worship dead Gods.</font>")
		if(1)
			var/obj/structure/flora/ausbushes/ywflowers/X = locate() in src.loc
			if(X)
				STAT_LEVEL(int) +=1
				src.intrigue++
				to_chat(src, "<font color='#436b47'>...ah-...ahah. This...that brings a smile to my face. Such tiny life. Isn't it so precious?...</font>")
				playsound(usr, 'sound/misc/nymphchirp.ogg', 80, 0, -1)
			else
				to_chat(src, "<font color='#436b47'>...why are you still here? I have no more blessings. Why have you awoken me from death?</font>")
				return
		if(2)
			src.intrigue++
			to_chat(src, "<font color='#436b47'>..here. I do not have much to give, any more. But...I want you to have this.</font>")
		if(3)
			src.intrigue++
			src.add_spell(new /spell/aoe_turf/conjure/grove/sanctuary)
			to_chat(src, "<font color='#436b47'>Flowers are so beautiful in the winter. All life is a gift that should be cherished. Even when the darkest days are here, one can always find beauty.</font>")
		if(4)
			src.intrigue++
			to_chat(src, "<font color='#436b47'>...grief is not a bad feeling. The more you grieve, the more you love what you lost. It is love from beyond the grave. And love...is what holds us together.</font>")
			src.add_spell(new /spell/targeted/equip_item/seed)
		if(5)
			to_chat(src, "<font color='#436b47'>...it was so fun to talk to a mortal again. Maybe, one day, we'll speak again. I'm tired. Good-night, precious little-life.</font>")
			src.intrigue++
		if(6)
			to_chat(src, "...")
			return



/*		if(2)
			src.verbs += /mob/living/carbon/human/proc/tzeentchrune
			to_chat(src, "<font color='#0400ff'>To hear my next riddle memorize this symbol, draw it and stand upon it!</font>")
			src.intrigue++
			GLOB.tzeentch_cult++
			src.mind.special_role = "Tzeentch Cultist"
			AddInfectionImages()
			src.faction = "Tzeentch"
		if(3)
			var/obj/effect/decal/cleanable/tzeentch/T = locate() in src.loc
			if(T)
				src.intrigue++
				to_chat(src, "<font color='#0400ff'>Good... Good! From now on I will only speak to you while you stand upon this rune... Now, for your next riddle.</font>")
			else
				to_chat(src, "I haven't drawn his symbol or I'm not standing directly on it!")
		if(4)
			var/obj/structure/closet/pit/G = locate() in src.loc
			if(G)
				src.intrigue++
				STAT_LEVEL(str)+=1
				playsound(usr, 'sound/effects/updated.ogg', 80, 0, -1)
				to_chat(src, "<font color='#0400ff'>Well done! Maybe you aren't as dim as you appear... Seek me out upon my rune for your next riddle.</font>")
			else
				to_chat(src, "<font color='#0400ff'>You'll find me in a place of stone, Where silence cloaks the ground, Search through all the empty names, And finally I'll be found.</font>")
*/