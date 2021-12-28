#define ATMOSTANK_PHORON_BEAR      101

// medical floor
/turf/simulated/floor/tiled/medical
	name = "steel floor"
	icon_state = "white1"
	initial_flooring = /decl/flooring/tiling/medical

/decl/flooring/tiling/medical
	name = "steel floor"
	desc = "A floor."
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_base = "white1"
	build_type = null

//steel floor
/turf/simulated/floor/tiled/dark/steel
	icon_state = "steel_dirty"
	initial_flooring = /decl/flooring/tiling/dark/steel

/decl/flooring/tiling/dark/steel
	icon_base = "steel_dirty"


/turf/simulated/floor/dirty/sewers //use exclusively for the sewers on warhammer-1.dm
	name = "sewers" //"snowy dirt"
	desc = "Sewer water and...something, at the bottom. Smells revolting. You can barely breathe while near it, let alone submerged in it. Doesn't seem like a good idea to wade through it without a gas mask."
	icon = 'icons/turf/dirt.dmi'
	icon_state = "dirt1"
	movement_delay = 5
	atom_flags = ATOM_FLAG_CLIMBABLE
	has_coldbreath = FALSE // No more freezing to death indoors.
	has_light = FALSE
	can_generate_water = FALSE
	can_be_dug = FALSE
	initial_gas = list("phoron" = ATMOSTANK_PHORON_BEAR)
	color = "green"


/turf/simulated/floor/dirty/lightsewers //use exclusively for the sewers on warhammer-1.dm
	name = "shallow sewers" //"snowy dirt"
	desc = "Sewer water and...something, at the bottom. Smells revolting. Thankfully, shallow enough to wade without too much trouble. Still disgusting, though..."
	icon = 'icons/turf/dirt.dmi'
	icon_state = "dirt1"
	movement_delay = 4
	atom_flags = ATOM_FLAG_CLIMBABLE
	has_coldbreath = FALSE // No more freezing to death indoors.
	has_light = FALSE
	can_generate_water = FALSE
	can_be_dug = FALSE


/*
/turf/simulated/floor/dirty/indestructable/mud/sewers //Unused 'til I can figure out what to do with this.
	name = "deep sewage"
	desc = "Sewer water. Looks deep. Not a good idea to step into this without a suit and oxygen."
	icon_state = "mud"
	movement_delay = 5
	atom_flags = ATOM_FLAG_CLIMBABLE
	has_coldbreath = FALSE // No more freezing to death indoors.
	has_light = FALSE
	can_generate_water = FALSE
	can_be_dug = FALSE
	initial_gas = list("phoron" = ATMOSTANK_PHORON_BEAR)
*/