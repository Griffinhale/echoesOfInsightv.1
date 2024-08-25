extends CanvasLayer

var flower_icon: Resource = preload("res://flower_icon.tres")
var keyword_icons: Dictionary
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	keyword_icons = {
		"flower": flower_icon
	}
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_inventory(player_inventory: Dictionary):
	print("should update slot to have correct icon for materials keyword (this is where material class comes into play??")
	if !player_inventory.is_empty():
		for i in player_inventory.keys():
			var idx = player_inventory.keys().bsearch(i)
			var slot_for_item = $Background/ItemSlots.get_child(idx)
			print(slot_for_item.name + " " + flower_icon.resource_name)
			if slot_for_item.get_child_count() == 0:
				var img = TextureRect.new()
				img.texture = flower_icon
				print(img.texture)
				slot_for_item.add_child(img)
