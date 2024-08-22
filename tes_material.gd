extends Area2D

signal pick_material(material, amount)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func interact_obj():
	print("interaction, going to remove")
	pick_material.emit("flower", 1)
	queue_free()
	
func _on_pick_material(material_name: String, amount: float):
	print("Should send two signals from here, one to summoner one to parent")
	print(material_name, " at " , amount)
	
