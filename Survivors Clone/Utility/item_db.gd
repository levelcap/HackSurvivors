extends Node

const ACCESSORY_PATH = "res://Textures/Items/Upgrades/"
const WEAPON_PATH = "res://Textures/Items/Weapons/"

const ITEMS = {
	"knife": {
		"icon": WEAPON_PATH + "knife_icon.png",
		"displayname": "Stabitha Christie",
		"type": "weapon",
		"levels": [
			{
				"details": "This is your pride and joy. It cuts and it chops, sometimes food and sometimes your own fingers.",
				"init": { "damage": 5, "baseammo": 1 }
			},
			{
				"details": "More knives!",
				"upgrade": { "baseammo": 1 }
			},
			{
				"details": "Sharper knives!",
				"upgrade": { "damage": 0.2, "hp": 1 }
			},
			{
				"details": "Even more sharper knives!",
				"upgrade": { "damage": 0.1, "baseammo": 1, "hp": 1 }
			}
		]
	},		
	"mop": {
		"icon": WEAPON_PATH + "mop_icon.png",
		"displayname": "Slip ‘n Slide",
		"type": "weapon",
		"levels": [
			{
				"details": "Oops, I guess I forgot to put up a “Caution, Wet Floor” Sign. Hope no one slips…",
				"init": { "damage": 10, "time": 2.0 }
			},
			{
				"details": "The puddles just keep growing.",
				"upgrade": { "damage": 0.5, "attack_size": 0.5 }
			},
			{
				"details": "The puddles just keep growing.",
				"upgrade": { "damage": 0.5, "attack_size": 0.5 }
			},
			{
				"details": "The puddles just keep growing.",
				"upgrade": { "damage": 0.5, "attack_size": 0.5 }
			}
		]
	},
	"torch": {
		"icon": WEAPON_PATH + "weapon_blow_torch_icon.png",
		"displayname": "Old Faithful",
		"type": "weapon",
		"levels": [
			{
				"details": "She makes a mean creme brulee, but you shouldn’t get too close.",
			},
			{
				"details": "She makes a mean creme brulee, but you shouldn’t get too close.",
			},
			{
				"details": "She makes a mean creme brulee, but you shouldn’t get too close.",
			},
			{
				"details": "She makes a mean creme brulee, but you shouldn’t get too close.",
			}
		]
	},
	"china": {
		"icon": WEAPON_PATH + "Finechina2_icon.png",
		"displayname": "Grandma’s Finest",
		"type": "weapon",
		"levels": [
			{
				"details": "The will didn't say NOT to break them, right?",
			},
			{
				"details": "Throw two plates at once",
			},
			{
				"details": "Wait 0.5 seconds less before throwing again",
			},
			{
				"details": "Throw yet another plate, and 25% harder",
			}
		]
	},		
	"salt": {
		"icon": WEAPON_PATH + "seasonsgreetings.png",
		"displayname": "Seasoned Greetings",
		"type": "weapon",
		"levels": [
			{
				"details": "Summon a salt and pepper cloud and welcome enemies to Flavortown",
				"init": { "damage": 1, "knockback_amount": 35, "time": 0.5 }
			},
			{
				"details": "Your flavor cloud grows stronger",
				"upgrade": { "damage": 1.0 }
			},
			{
				"details": "Your flavor cloud grows stronger",
				"upgrade": { "damage": 1.0 }
			},
			{
				"details": "Your flavor cloud grows stronger",
				"upgrade": { "damage": 1.0 }
			}
		]
	},		
	"whisk": {
		"icon": WEAPON_PATH + "whisk_icon.png",
		"displayname": "Whisky Business",
		"type": "weapon",
		"levels": [
			{
				"details": "Your trusty whisk spins around you",
			},
			{
				"details": "Your flavor cloud grows stronger",
			},
			{
				"details": "Wait 0.5 seconds less before throwing again",
			},
			{
				"details": "Wait 0.5 seconds less before throwing again",
			}
		]
	},		
	"rolling_pin": {
		"icon": WEAPON_PATH + "rolling_pin_icon.png",
		"displayname": "Roller Derby",
		"type": "weapon",
		"levels": [
			{
				"details": "Rollin rollin rollin",
			},
			{
				"details": "Rollin rollin rollin",
			},
			{
				"details": "Rollin rollin rollin",
			},
			{
				"details": "Rollin rollin rollin",
			}
		]
	},		
	"apron": {
		"icon": ACCESSORY_PATH + "apron.png",
		"displayname": "Apron",
		"type": "upgrade",
		"levels": [
			{
				"details": "Reduces damage by 1 point",
			},
			{
				"details": "Reduces damage by an additional 1 point",
			},
			{
				"details": "Reduces damage by an additional 1 point",
			},
			{
				"details": "Reduces damage by an additional 1 point",
			}
		]
	},		
	"speed": {
		"icon": ACCESSORY_PATH + "boots_4_green.png",
		"displayname": "Speed",
		"type": "upgrade",
		"levels": [
			{
				"details": "Movement speed increased by 50% of base speed",
			},
			{
				"details": "Movement Speed Increased by an additional 50% of base speed",
			},
			{
				"details": "Movement Speed Increased by an additional 50% of base speed",
			},
			{
				"details": "Movement Speed Increased an additional 50% of base speed",
			}
		]
	},
	"tome": {
		"icon": ACCESSORY_PATH + "thick_new.png",
		"displayname": "Costco Membership",
		"type": "upgrade",
		"levels": [
			{
				"details": "Increases the impact of your tools by 10% of their base size",
			},
			{
				"details": "Increases the impact of your tools by an additional 10% of their base size",
			},
			{
				"details": "Increases the impact of your tools by an additional 10% of their base size",
			},
			{
				"details": "Increases the impact of your tools by an additional 10% of their base size",
			}
		]
	},	
	"scroll": {
		"icon": ACCESSORY_PATH + "scroll_old.png",
		"displayname": "Caffeine Boost",
		"type": "upgrade",
		"levels": [
			{
				"details": "Increase attack speed by 5%",
			},
			{
				"details": "Increase attack speed by 5%",
			},
			{
				"details": "Increase attack speed by 5%",
			},
			{
				"details": "Increase attack speed by 5%",
			}
		]
	},	
	"ring": {
		"icon": ACCESSORY_PATH + "urand_mage.png",
		"displayname": "Ambidexterity",
		"type": "upgrade",
		"levels": [
			{
				"details": "Each of your tools now spawns one additional attack",
			},
			{
				"details": "Again? Yes, a third hand.",
			}
		]
	},		
	"caution": {
		"icon": ACCESSORY_PATH + "caution.png",
		"displayname": "Caution Sign",
		"type": "upgrade",
		"levels": [
			{
				"details": "Increase knockback",
			},
			{
				"details": "Increase knockback",
			},
			{
				"details": "Increase knockback",
			},
			{
				"details": "Increase knockback",
			}
		]
	},	
	"food": {
		"icon": ACCESSORY_PATH + "Firstaidkit_icon.png",
		"displayname": "First Aid Kit",
		"type": "item",
		"levels": [
			{
				"details": "Heals you for 20 health",
			}
		]
	},	
}
