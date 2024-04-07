extends Node


const ICON_PATH = "res://Textures/Items/Upgrades/"
const WEAPON_PATH = "res://Textures/Items/Weapons/"
const UPGRADES = {
	"mop1": {
		"icon": WEAPON_PATH + "mop_main.png",
		"displayname": "Slip ‘n Slide",
		"details": " Oops, I guess I forgot to put up a “Caution, Wet Floor” Sign. Hope no one slips…",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "weapon"
	},
	"mop2": {
		"icon": WEAPON_PATH + "mop_main.png",
		"displayname": "Slip ‘n Slide",
		"details": "The puddles just keep growing.  ",
		"level": "Level: 2",
		"prerequisite": ["mop1"],
		"type": "weapon"
	},
	"mop3": {
		"icon": WEAPON_PATH + "mop_main.png",
		"displayname": "Slip ‘n Slide",
		"details": "The puddles just keep growing.  ",
		"level": "Level: 3",
		"prerequisite": ["mop2"],
		"type": "weapon"
	},
	"mop4": {
		"icon": WEAPON_PATH + "mop_main.png",
		"displayname": "Slip ‘n Slide",
		"details": "The puddles just keep growing.  ",
		"level": "Level: 4",
		"prerequisite": ["mop3"],
		"type": "weapon"
	},
	"torch1": {
		"icon": WEAPON_PATH + "weapon_blow_torch_icon.png",
		"displayname": "Old Faithful",
		"details": "She makes a mean creme brulee, but you shouldn’t get too close.",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "weapon"
	},
	"torch2": {
		"icon": WEAPON_PATH + "weapon_blow_torch_icon.png",
		"displayname": "Old Faithful",
		"details": "She makes a mean creme brulee, but you shouldn’t get too close. ",
		"level": "Level: 2",
		"prerequisite": ["torch1"],
		"type": "weapon"
	},
	"torch3": {
		"icon": WEAPON_PATH + "weapon_blow_torch_icon.png",
		"displayname": "Old Faithful",
		"details": "She makes a mean creme brulee, but you shouldn’t get too close. ",
		"level": "Level: 3",
		"prerequisite": ["torch2"],
		"type": "weapon"
	},
	"torch4": {
		"icon": WEAPON_PATH + "weapon_blow_torch_icon.png",
		"displayname": "Old Faithful",
		"details": "A butane refill grows the fire.",
		"level": "Level: 4",
		"prerequisite": ["torch3"],
		"type": "weapon"
	},
	"knife1": {
		"icon": WEAPON_PATH + "starting_weapon_icon.png",
		"displayname": "Stabitha Christie",
		"details": "This is your pride and joy. It cuts and it chops, sometimes food and sometimes your own fingers.",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "weapon"
	},
	"knife2": {
		"icon": WEAPON_PATH + "starting_weapon_icon.png",
		"displayname": "Stabitha Christie",
		"details": "More knives!",
		"level": "Level: 2",
		"prerequisite": ["knife1"],
		"type": "weapon"
	},
	"knife3": {
		"icon": WEAPON_PATH + "starting_weapon_icon.png",
		"displayname": "Stabitha Christie",
		"details": "Sharper knives!",
		"level": "Level: 3",
		"prerequisite": ["knife2"],
		"type": "weapon"
	},
	"knife4": {
		"icon": WEAPON_PATH + "starting_weapon_icon.png",
		"displayname": "Stabitha Christie",
		"details": "Even more knives!",
		"level": "Level: 4",
		"prerequisite": ["knife3"],
		"type": "weapon"
	},
	"javelin1": {
		"icon": WEAPON_PATH + "javelin_3_new_attack.png",
		"displayname": "Javelin",
		"details": "A magical javelin will follow you attacking enemies in a straight line",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "weapon"
	},
	"javelin2": {
		"icon": WEAPON_PATH + "javelin_3_new_attack.png",
		"displayname": "Javelin",
		"details": "The javelin will now attack an additional enemy per attack",
		"level": "Level: 2",
		"prerequisite": ["javelin1"],
		"type": "weapon"
	},
	"javelin3": {
		"icon": WEAPON_PATH + "javelin_3_new_attack.png",
		"displayname": "Javelin",
		"details": "The javelin will attack another additional enemy per attack",
		"level": "Level: 3",
		"prerequisite": ["javelin2"],
		"type": "weapon"
	},
	"javelin4": {
		"icon": WEAPON_PATH + "javelin_3_new_attack.png",
		"displayname": "Javelin",
		"details": "The javelin now does + 5 damage per attack and causes 20% additional knockback",
		"level": "Level: 4",
		"prerequisite": ["javelin3"],
		"type": "weapon"
	},
	"china1": {
		"icon": WEAPON_PATH + "Finechina2_icon.png",
		"displayname": "Grandma’s Finest",
		"details": "The will didn't say NOT to break them, right?",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "weapon"
	},
	"china2": {
		"icon": WEAPON_PATH + "Finechina2_icon.png",
		"displayname": "Grandma’s Finest",
		"details": "Throw two plates at once",
		"level": "Level: 2",
		"prerequisite": ["china1"],
		"type": "weapon"
	},
	"china3": {
		"icon": WEAPON_PATH + "Finechina2_icon.png",
		"displayname": "Grandma’s Finest",
		"details": "Wait 0.5 seconds less before throwing again",
		"level": "Level: 3",
		"prerequisite": ["china2"],
		"type": "weapon"
	},
	"china4": {
		"icon": WEAPON_PATH + "Finechina2_icon.png",
		"displayname": "Grandma’s Finest",
		"details": "Throw yet another plate, and 25% harder",
		"level": "Level: 4",
		"prerequisite": ["china3"],
		"type": "weapon"
	},
	"salt1": {
		"icon": WEAPON_PATH + "seasonsgreetings.png",
		"displayname": "Seasoned Greetings",
		"details": "Summon a salt and pepper cloud and welcome enemies to Flavortown",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "weapon"		
	},
	"salt2": {
		"icon": WEAPON_PATH + "seasonsgreetings.png",
		"displayname": "Seasoned Greetings",
		"details": "Your flavor cloud grows stronger",
		"level": "Level: 2",
		"prerequisite": ["salt1"],
		"type": "weapon"		
	},
	"salt3": {
		"icon": WEAPON_PATH + "seasonsgreetings.png",
		"displayname": "Seasoned Greetings",
		"details": "Your flavor cloud grows stronger",
		"level": "Level: 3",
		"prerequisite": ["salt2"],
		"type": "weapon"		
	},		
	"salt4": {
		"icon": WEAPON_PATH + "seasonsgreetings.png",
		"displayname": "Seasoned Greetings",
		"details": "Your flavor cloud grows stronger",
		"level": "Level: 4",
		"prerequisite": ["salt3"],
		"type": "weapon"		
	},	
	"armor1": {
		"icon": ICON_PATH + "apron.png",
		"displayname": "Apron",
		"details": "Reduces damage by 1 point",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "upgrade"
	},
	"armor2": {
		"icon": ICON_PATH + "apron.png",
		"displayname": "Apron",
		"details": "Reduces damage by an additional 1 point",
		"level": "Level: 2",
		"prerequisite": ["armor1"],
		"type": "upgrade"
	},
	"armor3": {
		"icon": ICON_PATH + "apron.png",
		"displayname": "Apron",
		"details": "Reduces damage by an additional 1 point",
		"level": "Level: 3",
		"prerequisite": ["armor2"],
		"type": "upgrade"
	},
	"armor4": {
		"icon": ICON_PATH + "apron.png",
		"displayname": "Apron",
		"details": "Reduces damage by an additional 1 point",
		"level": "Level: 4",
		"prerequisite": ["armor3"],
		"type": "upgrade"
	},
	"speed1": {
		"icon": ICON_PATH + "boots_4_green.png",
		"displayname": "Speed",
		"details": "Movement speed increased by 50% of base speed",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "upgrade"
	},
	"speed2": {
		"icon": ICON_PATH + "boots_4_green.png",
		"displayname": "Speed",
		"details": "Movement Speed Increased by an additional 50% of base speed",
		"level": "Level: 2",
		"prerequisite": ["speed1"],
		"type": "upgrade"
	},
	"speed3": {
		"icon": ICON_PATH + "boots_4_green.png",
		"displayname": "Speed",
		"details": "Movement Speed Increased by an additional 50% of base speed",
		"level": "Level: 3",
		"prerequisite": ["speed2"],
		"type": "upgrade"
	},
	"speed4": {
		"icon": ICON_PATH + "boots_4_green.png",
		"displayname": "Speed",
		"details": "Movement Speed Increased an additional 50% of base speed",
		"level": "Level: 4",
		"prerequisite": ["speed3"],
		"type": "upgrade"
	},
	"tome1": {
		"icon": ICON_PATH + "thick_new.png",
		"displayname": "Costco Membership",
		"details": "Increases the impact of your tools by 10% of their base size",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "upgrade"
	},
	"tome2": {
		"icon": ICON_PATH + "thick_new.png",
		"displayname": "Costco Membership",
		"details": "Increases the impact of your tools by an additional 10% of their base size",
		"level": "Level: 2",
		"prerequisite": ["tome1"],
		"type": "upgrade"
	},
	"tome3": {
		"icon": ICON_PATH + "thick_new.png",
		"displayname": "Costco Membership",
		"details": "Increases the impact of your tools by an additional 10% of their base size",
		"level": "Level: 3",
		"prerequisite": ["tome2"],
		"type": "upgrade"
	},
	"tome4": {
		"icon": ICON_PATH + "thick_new.png",
		"displayname": "Costco Membership",
		"details": "Increases the impact of your tools by an additional 10% of their base size",
		"level": "Level: 4",
		"prerequisite": ["tome3"],
		"type": "upgrade"
	},
	"scroll1": {
		"icon": ICON_PATH + "scroll_old.png",
		"displayname": "Caffeine Boost",
		"details": "Increase attack speed by 5%",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "upgrade"
	},
	"scroll2": {
		"icon": ICON_PATH + "scroll_old.png",
		"displayname": "Caffeine Boost",
		"details": "Increase attack speed by 5%",
		"level": "Level: 2",
		"prerequisite": ["scroll1"],
		"type": "upgrade"
	},
	"scroll3": {
		"icon": ICON_PATH + "scroll_old.png",
		"displayname": "Caffeine Boost",
		"details": "Increase attack speed by 5%",
		"level": "Level: 3",
		"prerequisite": ["scroll2"],
		"type": "upgrade"
	},
	"scroll4": {
		"icon": ICON_PATH + "scroll_old.png",
		"displayname": "Caffeine Boost",
		"details": "Increase attack speed by 5%",
		"level": "Level: 4",
		"prerequisite": ["scroll3"],
		"type": "upgrade"
	},
	"ring1": {
		"icon": ICON_PATH + "urand_mage.png",
		"displayname": "Ambidexterity",
		"details": "Each of your tools now spawns one additional attack",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "upgrade"
	},
	"ring2": {
		"icon": ICON_PATH + "urand_mage.png",
		"displayname": "Tripledexterity",
		"details": "Yes, a third hand.",
		"level": "Level: 2",
		"prerequisite": ["ring1"],
		"type": "upgrade"
	},
	"food": {
		"icon": ICON_PATH + "Firstaidkit_icon.png",
		"displayname": "First Aid Kit",
		"details": "Heals you for 20 health",
		"level": "N/A",
		"prerequisite": [],
		"type": "item"
	}
}

