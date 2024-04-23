extends TextureRect

var item_name = null
func _ready():
	if item_name != null:
		$ItemTexture.texture = load(ItemDb.ITEMS[item_name]["icon"])
