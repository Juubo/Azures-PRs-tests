//PUZZLE BOXES

//easy


obj/item/mundane/puzzlebox/easy
	name = "wooden puzzle-box"
	desc = "A puzzle box."
	icon = 'modular_azurepeak/icons/obj/items/mundanities.dmi'
	icon_state = "wood_box"
	var/fluff_desc = "Wow."
	var/list/finished_ckeys = list()
	var/dice_roll = null
	var/alert = null

obj/item/mundane/puzzlebox/easy/Initialize()
	. = ..()
	dice_roll = rand(6,15)
	fluff_desc = pick("It, frankly, looks rather depressing.","I can see an engraving of Psydon sending the Comet Syon on the side.","It doesn't look so difficult.","It's dusty and boring.","Why do I want to play with this for hours?","I could probably get a vagrant to solve this.","It looks like it was made for fools.")
	desc += " [fluff_desc]"


obj/item/mundane/puzzlebox/easy/attack_self(mob/living/user)
	var/ckey = user.ckey
	if(ckey in finished_ckeys)
		to_chat(user, span_warning("I've already tried my hand at \the [src]."))
	if (alert(user, "My fingers trace the outside of this box. It looks of average difficulty. Do I try to solve it?", "ROGUETOWN", "Yes", "No") != "Yes")
		return
	if(do_after(user,70, target = src))
		if((dice_roll) <= user.STAINT)
			to_chat(user, span_notice("I solve \the [src] fairly easily. I feel rather satisfied."))
			SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "medium_puzzle", /datum/mood_event/puzzle_medium)
			finished_ckeys += ckey
		else
			to_chat(user, span_warning("I can't solve \the [src]. Cack! Frustrated, I leave it alone."))
			finished_ckeys += ckey


//medium

obj/item/mundane/puzzlebox/medium
	name = "ebony puzzle-box"
	icon = 'modular_azurepeak/icons/obj/items/mundanities.dmi'
	icon_state = "ebon_box"
	var/fluff_desc = null
	var/list/finished_ckeys = list()
	var/dice_roll = null
	var/alert = null

obj/item/mundane/puzzlebox/medium/Initialize()
	. = ..()
	dice_roll = rand(6,20)
	fluff_desc = pick("Its surface shines with polished ebony.","I can see an engraving of a Snow-Elf on the side.","It looks like it could challenge an average man.","I wish my personality was like this box's.","Why do I want to play with this for hours?","I could probably sell this to a wizard's apprentice.","It looks...sufficient.")
	desc += " [fluff_desc]"

obj/item/mundane/puzzlebox/medium/attack_self(mob/living/user)
	var/ckey = user.ckey
	if(ckey in finished_ckeys)
		to_chat(user, span_warning("I've already tried my hand at \the [src]."))
	if (alert(user, "My fingers trace the outside of this box. It looks of average difficulty. Do I try to solve it?", "ROGUETOWN", "Yes", "No") != "Yes")
		return
	if(do_after(user,70, target = src))
		if((dice_roll) <= user.STAINT)
			to_chat(user, span_notice("I solve \the [src] fairly easily. I feel rather satisfied."))
			SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "medium_puzzle", /datum/mood_event/puzzle_medium)
			finished_ckeys += ckey
		else
			to_chat(user, span_warning("I can't solve \the [src]. Cack! Frustrated, I leave it alone."))
			finished_ckeys += ckey


//impossible. before you look at this and screech, let's talk about the math. even the highest int bonus jobs in the game start with a 0% chance assuming worst roll from this, and uproll from them, to beat this thing
//the only job that can 'consistently' crack this is archivist, who starts with a 30% chance, assuming worst roll from this. but then ur stuck playing archivist so ???


obj/item/mundane/puzzlebox/impossible //literally nearly impossible to solve - if you do, you get a fairly lengthy buff or a stat boost.
	name = "royal puzzle-box"
	icon = 'modular_azurepeak/icons/obj/items/mundanities.dmi'
	icon_state = "grimace_box"
	var/fluff_desc = null
	var/list/finished_ckeys = list()
	var/dice_roll = null

obj/item/mundane/puzzlebox/impossible/Initialize()
	. = ..()
	dice_roll = rand(10,20)
	fluff_desc = pick("It, frankly, looks nearly impossible.","Its centerpiece is that of Astrata banishing a heretic from this world.","Without doubt, this is rather befuddling.","It looks arcane and nearly-impossible.","Why do I feel like I could try for hours and not succeed at this?","Even a bored archivist would probably have trouble with this one.","It looks nearly impossible.")
	desc += " [fluff_desc]"

obj/item/mundane/puzzlebox/impossible/attack_self(mob/living/user)
	var/ckey = user.ckey
	if(ckey in finished_ckeys)
		to_chat(user, span_warning("I've already tried my hand at \the [src]."))
	if (alert(user, "My fingers trace the outside of this box. It looks nearly impossible. Do I try to solve it?", "ROGUETOWN", "Yes", "No") != "Yes")
		return
	if(do_after(user,100, target = src))
		if((dice_roll) + 5 <= user.STAINT)
			if(prob(66))
				to_chat(user, span_notice("After much deliberation, I solve \the [src]!"))
				SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "medium_puzzle", /datum/mood_event/puzzle_impossible)
				finished_ckeys += ckey
			else
				to_chat(user, span_notice("As I pop open \the [src], I feel a tingling wave run from my head to my feet. A piece of an azure crystal tumbles out. When I grab it, it's gone- and I suddenly feel invigorated."))
				user.STAINT += rand(0,4)
				user.STASTR += rand(0,4)
				user.STASPD += rand(0,4)
				user.STACON += rand(0,4)
				user.STAEND += rand(0,4)
				finished_ckeys += ckey
		else
			to_chat(user, span_warning("I can't solve \the [src]. Cack! Frustrated, I leave it alone."))
			finished_ckeys += ckey

/*
	var/ckey = user.ckey
	if(ckey in finished_ckeys)
		to_chat(user, span_warning("I've already tried my hand at \the [src]."))
	var/alert = alert(user, "My fingers trace the outside of this box. It looks nearly impossible. Do I try to solve it? \n", "wooden puzzle-box", "Yes", "No",)
		if(alert != "Yes")
			return
		if(do_after(user,70, target = src))
			if((dice_roll) + 5 <= user.STAINT)
				prob(66)
					to_chat(user, span_notice("After much deliberation, I solve \the [src]!"))
					SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "impossible_puzzle", /datum/mood_event/puzzle_impossible)
					finished_ckeys += ckey
				else
					to_chat(user, span_notice("As I pop open \the [src], I feel a tingling wave run from my head to my feet. A piece of an azure crystal tumbles out. When I grab it, it's gone- and I suddenly feel invigorated."))
					user.STAINT += rand(0,4)
					user.STASTR += rand(0,4)
					user.STASPD += rand(0,4)
					user.STACON += rand(0,4)
					user.STAEND += rand(0,4)
					user.STALCK -= rand(1,2) //you used up all the luck you had dude
					finished_ckeys += ckey
			else
				to_chat(user, span_warning("I can't even begin to solve \the [src]. I leave it alone."))
				finished_ckeys += ckey
*/