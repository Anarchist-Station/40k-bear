// first, reflavors up here.

/obj/item/reagent_containers/glass/bucket
	icon = 'z_modular_bear/icons/obj/items/weapons/village.dmi'
	icon_state = "bucket"

/obj/item/material/minihoe
	icon = 'z_modular_bear/icons/obj/items/weapons/village.dmi'
	icon_state = "hoe"

/obj/item/shovel/spade
	icon = 'z_modular_bear/icons/obj/items/weapons/village.dmi'
	icon_state = "spade"

/obj/item/material/hatchet
	icon = 'z_modular_bear/icons/obj/items/weapons/village.dmi'
	icon_state = "axe"
	desc = "An axe made from crude metal and a rotwood grip. Not the best weapon, but it's reliable for cutting trees."


/obj/item/material/sword/cane/seolite/practice
	force = 5
	name = "practice sword"
	desc = "A sword belonging to the Nobility. This blade is weighted perfectly in your hand. A large hilt allows for easy blocking. This one has a blunted edge. Still painful."
	sharp = 0
	edge = 0

/obj/item/material/sword/chaosknife/lament
	name = "blooded knife"
	desc = "A knife made of solid tears and mourning. Just holding it in your hand makes you feel so heavy, but ready to lash out with rage."
	force_divisor = 0.15
	block_chance = 15
	force = 15



// next, new weapons 'proper'

/obj/item/weapon/knuckleduster
	name = "brass knuckles"
	desc = "A pair of brass knuckles, easily concealable in your pocket, and good for knocking someone's jaw loose."
	force = 10
	sharp = 0
	edge = 0
	sharpness = 0
	w_class = ITEM_SIZE_SMALL
	attack_verb = list("punched", "jabbed", "pummeled")
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "knuckleduster"

//custom stuff with extra code

/obj/item/shield/buckler/custom
	name = "custom-made buckler"
	desc = "A buckler with a twist- though it's covered in wood, nearly the entire thing is made out of a surprisingly protective material that's warm to the touch. Has runes on the back-side of it. Also has a razor-sharp edge. For some reason, you feel confident enough to throw it."
	icon = 'z_modular_bear/icons/obj/items/weapons/village.dmi'
	icon_state = "buckler"
	color = "gray"
	slot_flags = SLOT_BACK
	force = 12
	throwforce = 25
	sharp = 1
	edge = 1
	base_block_chance = 60
	throw_speed = 10
	throw_range = 10
	w_class = ITEM_SIZE_HUGE
	origin_tech = list(TECH_MATERIAL = 1)
	matter = list(DEFAULT_WALL_MATERIAL = 1000, "Wood" = 1000)
	attack_verb = list("slashed", "cut")

/obj/item/shield/buckler/handle_shield(mob/living/user)
	. = ..()
	if(.) playsound(user.loc, 'sound/items/buckler_block.ogg', 50, 1)

/obj/item/shield/buckler/get_block_chance(mob/user, var/damage, atom/damage_source = null, mob/attacker = null)
	return base_block_chance
