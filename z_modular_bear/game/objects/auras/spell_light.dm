/obj/aura/radiant_aura/light
	name = "radiant aura"
	icon = 'icons/effects/effects.dmi'
	icon_state = "fire_goon"
	plane = OBJ_PLANE
	layer = ABOVE_WINDOW_LAYER
	alpha = 30

/obj/aura/radiant_aura/New()
	..()
	to_chat(user,"<span class='notice'>A faint bubble of light begins orbiting around you.</span>")
	set_light(6,2, "#d6d65c")

/obj/aura/radiant_aura/Destroy()
	to_chat(user, "<span class='warning'>The light around you flickers and abruptly fades, leaving you alone.</span>")
	return ..()

/spell/radiant_aura/light
	name = "Light aura"
	desc = "Form a tiny fog of lighting mist around you."
	school = "transmutation"
	feedback = "ra"
	invocation_type = SpI_EMOTE
	invocation = "begins to softly glow."
	school = "conjuration"
	charge_max = 300
	cooldown_min = 1500
	level_max = list(Sp_TOTAL = 0, Sp_SPEED = 0, Sp_POWER = 0)
	cast_sound = 'sound/effects/snap.ogg'
	duration = 1000
	hud_state = "gen_immolate"

