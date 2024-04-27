extends Button

@onready var lblName = $lbl_name
@onready var lblDescription = $lbl_description
@onready var lblLevel = $lbl_level
@onready var itemIcon = $ColorRect/ItemIcon

var mouse_over = false
var item_name = null
var level_idx = null
@onready var player = get_tree().get_first_node_in_group("player")

signal selected_upgrade(upgrade)

func _ready():
	connect("selected_upgrade", Callable(player, "upgrade_character"))
	if item_name == null:
		item_name = "food"
	lblName.text = ItemDb.ITEMS[item_name]["displayname"]
	lblDescription.text = ItemDb.ITEMS[item_name]["levels"][level_idx]["details"]
	lblLevel.text = str("Level ", level_idx + 1)
	itemIcon.texture = load(ItemDb.ITEMS[item_name]["icon"])
	
func _input(event):
	if event.is_action("click"):
		if mouse_over:
			emit_signal("selected_upgrade", item_name)

func _on_mouse_entered():
	mouse_over = true

func _on_mouse_exited():
	mouse_over = false
