
/*
/mob/living/carbon/proc/get_social_class()
	var/socclass = social_class
	if(!socclass)
		return
	switch(socclass)
		if(SOCIAL_CLASS_MIN)
			return "<b>peasantry</b>"
		if(SOCIAL_CLASS_MED)
			return "<b>your average citizen</b>"
		if(SOCIAL_CLASS_HIGH)
			return "<b>an important citizen</b>"
		if(SOCIAL_CLASS_MAX)
			return "<b>the crown jewel of society</b>"
*/



// marks for gods

/obj/effect/decal/cleanable/khorne
	name = "mark of the Allfather"
	icon = 'icons/obj/decals.dmi'
	icon_state = "angry"
	desc = "A horrifying rune drawn in blood."
	gender = PLURAL
	density = 0
	anchored = 1
	layer = 2
	random_icon_states = null
	blood_DNA = list()
	appearance_flags = NO_CLIENT_COLOR


/obj/effect/decal/cleanable/slaanesh
	name = "mark of Asmodeus"
	icon = 'icons/obj/decals.dmi'
	icon_state = "lewd"
	desc = "A horrifying rune drawn in blood."
	gender = PLURAL
	density = 0
	anchored = 1
	layer = 2
	random_icon_states = null
	blood_DNA = list()
	appearance_flags = NO_CLIENT_COLOR


/obj/effect/decal/cleanable/tzeentch
	name = "mark of a dead god"
	icon = 'icons/obj/decals.dmi'
	icon_state = "smart"
	desc = "A horrifying rune drawn in blood."
	gender = PLURAL
	density = 0
	anchored = 1
	layer = 2
	random_icon_states = null
	blood_DNA = list()
	appearance_flags = NO_CLIENT_COLOR


/obj/effect/decal/cleanable/nurgle
	name = "mark of Ester"
	icon = 'icons/obj/decals.dmi'
	icon_state = "nasty"
	desc = "A horrifying rune drawn in blood."
	gender = PLURAL
	density = 0
	anchored = 1
	layer = 2
	random_icon_states = null
	blood_DNA = list()
	appearance_flags = NO_CLIENT_COLOR