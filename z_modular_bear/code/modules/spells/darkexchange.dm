/spell/targeted/dark_heal
	name = "Exchange Wounds"
	desc = "A spell that exchanges the bruises and burns of a target for a healthy heaping of toxin damage. Probably not a great idea to use this on someone who's an alcoholic. Short range."
	feedback = "CL"
	school = "transmutation"
	spell_flags = INCLUDEUSER | SELECTABLE | CONSTRUCT_CHECK
	invocation = "Ester al'ento."
	invocation_type = SpI_SHOUT
	range = 2
	max_targets = 1
	level_max = list(Sp_TOTAL = 2, Sp_SPEED = 1, Sp_POWER = 2)

	cooldown_reduc = 50
	hud_state = "heal_minor"

	amt_dam_brute = -30
	amt_dam_fire = -30
	amt_dam_tox = 20
	//restore_all_organs() figure out how to get this workin?

	message = "You feel a sharp pain in your gut and a wave of weakness as your wounds knit."
