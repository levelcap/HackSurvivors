extends Node

const ICON_PATH = "res://Textures/Items/Upgrades/"
const WEAPON_PATH = "res://Textures/Items/Weapons/"
const UPGRADES = {
	"mop1": {
		"icon": WEAPON_PATH + "mop_icon.png",
		"displayname": "Slip ‘n Slide",
		"details": " Oops, I guess I forgot to put up a “Caution, Wet Floor” Sign. Hope no one slips…",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "weapon"
	},
	"mop2": {
		"icon": WEAPON_PATH + "mop_icon.png",
		"displayname": "Slip ‘n Slide",
		"details": "The puddles just keep growing.  ",
		"level": "Level: 2",
		"prerequisite": ["mop1"],
		"type": "weapon"
	},
	"mop3": {
		"icon": WEAPON_PATH + "mop_icon.png",
		"displayname": "Slip ‘n Slide",
		"details": "The puddles just keep growing.  ",
		"level": "Level: 3",
		"prerequisite": ["mop2"],
		"type": "weapon"
	},
	"mop4": {
		"icon": WEAPON_PATH + "mop_icon.png",
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
		"icon": WEAPON_PATH + "knife_icon.png",
		"displayname": "Stabitha Christie",
		"details": "This is your pride and joy. It cuts and it chops, sometimes food and sometimes your own fingers.",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "weapon"
	},
	"knife2": {
		"icon": WEAPON_PATH + "knife_icon.png",
		"displayname": "Stabitha Christie",
		"details": "More knives!",
		"level": "Level: 2",
		"prerequisite": ["knife1"],
		"type": "weapon"
	},
	"knife3": {
		"icon": WEAPON_PATH + "knife_icon.png",
		"displayname": "Stabitha Christie",
		"details": "Sharper knives!",
		"level": "Level: 3",
		"prerequisite": ["knife2"],
		"type": "weapon"
	},
	"knife4": {
		"icon": WEAPON_PATH + "knife_icon.png",
		"displayname": "Stabitha Christie",
		"details": "Even more knives!",
		"level": "Level: 4",
		"prerequisite": ["knife3"],
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
	"whisk1": {
		"icon": WEAPON_PATH + "whisk_icon.png",
		"displayname": "Whisky Business",
		"details": "Your trusty whisk spins around you",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "weapon"		
	},
	"whisk2": {
		"icon": WEAPON_PATH + "whisk_icon.png",
		"displayname": "Whisky Business",
		"details": "Your trusty whisk spins around you",
		"level": "Level: 2",
		"prerequisite": ["whisk1"],
		"type": "weapon"		
	},
	"whisk3": {
		"icon": WEAPON_PATH + "seasonsgreetings.png",
		"displayname": "Whisky Business",
		"details": "Your trusty whisk spins around you",
		"level": "Level: 3",
		"prerequisite": ["whisk2"],
		"type": "weapon"		
	},		
	"whisk4": {
		"icon": WEAPON_PATH + "seasonsgreetings.png",
		"displayname": "Whisky Business",
		"details": "Your trusty whisk spins around you",
		"level": "Level: 4",
		"prerequisite": ["whisk4"],
		"type": "weapon"		
	},	
	"rolling_pin1": {
		"icon": WEAPON_PATH + "rolling_pin_icon.png",
		"displayname": "Roller Derby",
		"details": "Rollin rollin rollin",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "weapon"		
	},
	"rolling_pin2": {
		"icon": WEAPON_PATH + "rolling_pin_icon.png",
		"displayname": "Roller Derby",
		"details": "Rollin rollin rollin",
		"level": "Level: 2",
		"prerequisite": ["rolling_pin1"],
		"type": "weapon"		
	},
	"rolling_pin3": {
		"icon": WEAPON_PATH + "rolling_pin_icon.png",
		"displayname": "Roller Derby",
		"details": "Rollin rollin rollin",
		"level": "Level: 3",
		"prerequisite": ["rolling_pin2"],
		"type": "weapon"		
	},		
	"rolling_pin4": {
		"icon": WEAPON_PATH + "rolling_pin_icon.png",
		"displayname": "Roller Derby",
		"details": "Rollin rollin rollin",
		"level": "Level: 3",
		"prerequisite": ["rolling_pin3"],
		"type": "weapon"		
	},		
	"apron1": {
		"icon": ICON_PATH + "apron.png",
		"displayname": "Apron",
		"details": "Reduces damage by 1 point",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "upgrade"
	},
	"apron2": {
		"icon": ICON_PATH + "apron.png",
		"displayname": "Apron",
		"details": "Reduces damage by an additional 1 point",
		"level": "Level: 2",
		"prerequisite": ["apron1"],
		"type": "upgrade"
	},
	"apron3": {
		"icon": ICON_PATH + "apron.png",
		"displayname": "Apron",
		"details": "Reduces damage by an additional 1 point",
		"level": "Level: 3",
		"prerequisite": ["apron2"],
		"type": "upgrade"
	},
	"apron4": {
		"icon": ICON_PATH + "apron.png",
		"displayname": "Apron",
		"details": "Reduces damage by an additional 1 point",
		"level": "Level: 4",
		"prerequisite": ["apron3"],
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
		"displayname": "Ambidexterity",
		"details": "Again? Yes, a third hand.",
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
