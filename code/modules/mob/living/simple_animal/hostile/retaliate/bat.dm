/mob/living/simple_animal/hostile/retaliate/bat
	name = "bat"
	desc = ""
	icon_state = "bat"
	icon_living = "bat"
	icon_dead = "bat_dead"
	icon_gib = "bat_dead"
	turns_per_move = 1
	response_help_continuous = "brushes aside"
	response_help_simple = "brush aside"
	response_disarm_continuous = "flails at"
	response_disarm_simple = "flail at"
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	speak_chance = 0
	maxHealth = 50
	health = 50
	spacewalk = TRUE
	see_in_dark = 10
	harm_intent_damage = 6
	melee_damage_lower = 6
	melee_damage_upper = 5
	attack_verb_continuous = "bites"
	attack_verb_simple = "bite"
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab = 1)
	pass_flags = PASSTABLE
	faction = list("hostile")
	attack_sound = 'sound/blank.ogg'
	obj_damage = 0
	environment_smash = ENVIRONMENT_SMASH_NONE
	ventcrawler = VENTCRAWLER_ALWAYS
	mob_size = MOB_SIZE_TINY
	movement_type = FLYING
	speak_emote = list("squeaks")
	base_intents = list(/datum/intent/bite)
	rot_type = null
	var/fly_time = 3 SECONDS

	var/max_co2 = 0 //to be removed once metastation map no longer use those for Sgt Araneus
	var/min_oxy = 0
	var/max_tox = 0


	//Space bats need no air to fly in.
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0

/mob/living/simple_animal/hostile/retaliate/bat/Initialize()
	. = ..()
	verbs += list(/mob/living/simple_animal/hostile/retaliate/bat/proc/bat_up,
	/mob/living/simple_animal/hostile/retaliate/bat/proc/bat_down) 

/mob/living/simple_animal/hostile/retaliate/bat/proc/bat_up(mob/living/user)
	set category = "Bat Form"
	set name = "Move Up"

	user.visible_message(span_notice("[user] begins to ascend!"), span_notice("You take flight..."))
	if(do_after(user, fly_time, target))
		user.zMove(UP, TRUE)
		to_chat(src, span_notice("I fly up."))

/mob/living/simple_animal/hostile/retaliate/bat/proc/bat_down(mob/living/user)
	set category = "Bat Form"
	set name = "Move Down"

	user.visible_message(span_notice("[user] begins to descend!"), span_notice("You take flight..."))
	if(do_after(user, fly_time, target))
		user.zMove(DOWN, TRUE)
		to_chat(src, span_notice("I fly down."))

/mob/living/simple_animal/hostile/retaliate/bat/crow
	name = "zad"
	desc = ""
	icon = 'icons/roguetown/mob/monster/crow.dmi'
	icon_state = "crow_flying"
	icon_living = "crow_flying"
	icon_dead = "crow1"
	icon_gib = "crow1"
	speak_emote = list("caws")
	base_intents = list(/datum/intent/unarmed/help)
	harm_intent_damage = 0
	melee_damage_lower = 0
	melee_damage_upper = 0
	remains_type = /obj/effect/decal/remains/crow

/obj/effect/decal/remains/crow
	name = "zad remains"
	gender = PLURAL
	icon_state = "crow1"
	icon = 'icons/roguetown/mob/monster/crow.dmi'
