extends Area2D

class_name MaterialNode
# Connect summoner to material so it can update their inventory
signal pick_material(material, amount)

var shorthand
var fullname
var element
var genre
var tileOrigin: Vector2

func _init(x: int, y: int):
	tileOrigin = Vector2(x, y)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func interact_obj():
	print("interaction, going to remove")
	pick_material.emit("flower", 1)
	queue_free()
	
func _on_pick_material(material: String, amount: float):
	print("Should send two signals from here, one to summoner one to parent")
	print(material, " at " , amount)
	
