extends Area2D

class_name MaterialNode
# Connect summoner to material so it can update their inventory
signal pick_material(subject, material, amount)

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
func _process(_delta):
	pass

func interact_obj(from: Node):
	print("interaction, should add to " + from.name)
	pick_material.emit(from, "flower", 1)
	self.name = "!" + self.name
	queue_free()
	
func _on_pick_material(to: Node, material_name: String, amount: float):
	print("sending " + str(amount) + " of " + material_name + " to " + to.name)
	to.add_to_inventory(material_name, amount)
	
