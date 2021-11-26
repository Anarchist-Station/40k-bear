/spell/targeted/equip_item/witchknife
	name = "Conjure Spirit Blade"
	desc = "Summons a knife made out of your own soul and spirit. Let them taste your wrath, witch."
	feedback = "SD"
	charge_type = Sp_HOLDVAR
	school = "conjuration"
	invocation = "El'seda euite!"
	invocation_type = SpI_SHOUT
	spell_flags = INCLUDEUSER
	range = -1
	level_max = list(Sp_TOTAL = 0, Sp_SPEED = 0, Sp_POWER = 0)
	duration = 300 //30 seconds
	max_targets = 1
	equipped_summons = list("active hand" = /obj/item/material/sword/chaosknife/witch)
	hud_state = "gen_immolate"





/obj/item/material/sword/chaosknife/witch
	name = "spirit knife"
	desc = "A knife made out of a wispy, immaterial substance that tears flesh and bone. Doesn't seem to respond to brute strength that well. Weighs almost nothing, goes through armor, and can be swung like mad."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "chaos_knife"
	item_state = "EB-knife"//"knife"
	attack_verb = list("slashed", "stabbed")
	force = 9
	force = 9 //HUH??
	block_chance = 15
	w_class = ITEM_SIZE_SMALL
	force_divider = 1
	grab_sound_is_loud = TRUE
	grab_sound = 'sound/items/unholster_knife.ogg'
	equipsound = 'sound/items/holster_knife.ogg'
	sharpness = TRUE//No cutting peoples heads off with a knife please.
	weapon_speed_delay = 10
	drop_sound = 'sound/items/knife_drop.ogg'
	swing_sound = "blunt_swing"