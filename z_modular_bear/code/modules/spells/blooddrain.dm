/spell/targeted/projectile/blooddrain //TODO: make this actually succ blood, doesn't seem to be functional
	name = "Foul Missile"
	desc = "Sends out a slow projectile, knocking targets down with a wave of sickness and dealing minor damage."
	invocation = "Keis'ta et-etamo."
	invocation_type = SpI_SHOUT
	range = 7
	level_max = list(Sp_TOTAL = 0, Sp_SPEED = 0, Sp_POWER = 0)
	cooldown_min = 90 //15 deciseconds reduction per rank
	max_targets = 0
	proj_type = /obj/item/projectile/spell_projectile/seeking/blooddrain
	duration = 10
	proj_step_delay = 8
	amt_dam_brute = 3
//	spell_base = "const"

/spell/targeted/projectile/blooddrain/prox_cast(var/list/targets, atom/spell_holder)
	spell_holder.visible_message("<span class='danger'>\The [spell_holder] hisses as it slams into its target!</span>")
	for(var/mob/living/M in targets)
		apply_spell_damage(M)
		to_chat(M, "<span class='warning'>You feel sick and stagger to the floor!</span>")
	return

/obj/item/projectile/spell_projectile/seeking/blooddrain
	name = "blood-orb"
	icon_state = "magicm"
	color = "red"
	alpha = 100
	proj_trail = 1
	proj_trail_lifespan = 5
	proj_trail_icon_state = "magicmd"
	density = 1