/datum/spell/acid_spray
	name = "Acid Spray"
	desc = "A common spell used to destroy basically anything in front of the wizard."
	school = "conjuration"
	feedback = "as"
	spell_flags = 0
	charge_max  = 600

	invocation = "Tagopar lethodar!"
	invocation_type = INVOKE_SHOUT
	var/reagent_type = /datum/reagent/acid/hydrochloric
	hud_state = "wiz_acid"
	cast_sound = 'sounds/magic/disintegrate.ogg'

/datum/spell/acid_spray/choose_targets(mob/user = usr)
	perform(user, list(holder))

/datum/spell/acid_spray/cast(list/targets, mob/user)
	var/atom/target = targets[1]
	var/angle = dir2angle(target.dir)
	for(var/mod in list(315, 0, 45))
		var/obj/effect/effect/water/chempuff/chem = new(get_turf(target))
		chem.create_reagents(10)
		chem.reagents.add_reagent(reagent_type,10)
		chem.set_color()
		spawn(0)
			chem.set_up(get_ranged_target_turf(target, angle2dir(angle+mod), 3))

/datum/spell/acid_spray/tower
	charge_max = 2
