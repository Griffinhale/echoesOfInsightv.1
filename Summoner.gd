extends BaseEntity

class_name Summoner

@onready var test_smn = preload("res://test_summon.tscn")
#interact vars
signal interact_obj
var interaction_range = 50

#game vars
var pouch_mixes
var active_summons
var inventory

#movement vars
var velocity = Vector2.ZERO
var max_speed = 200
var base_acceleration = 800
var friction = 400

func summon_monster():
	pass
	
func switch_loadout():
	pass

func heal():
	pass

func _on_interact_obj():
	var closest_interactable = null
	var closest_distance = interaction_range
	print("signal emitted")
	# Iterate through all objects `in the "interactable" group
	for obj in get_tree().get_nodes_in_group("interactable"):
		var distance = position.distance_to(obj.position)
		print(distance)
		if distance < closest_distance:
			print("found one")
			closest_distance = distance
			closest_interactable = obj

	# If there's a nearby interactable object, trigger its interaction method
	if closest_interactable:
		#closest_interactable.pick_material.connect(_on_pick_material)
		closest_interactable.interact_obj()


func _input(event):
	var input_vector = Vector2.ZERO
	if Input.is_action_pressed("ui_accept"):
		print("huh?")
		interact_obj.emit()
	if Input.is_action_pressed("ui_up"):
		input_vector.y -= 1
	if Input.is_action_pressed("ui_down"):
		input_vector.y += 1
	if Input.is_action_pressed("ui_right"):
		input_vector.x += 1
	if Input.is_action_pressed("ui_left"):
		input_vector.x -= 1

	input_vector = input_vector.rotated(PI / 4).normalized()

	if input_vector != Vector2.ZERO:
		var dynamic_acceleration = base_acceleration * (1 - velocity.length() / max_speed)
		velocity += input_vector * dynamic_acceleration

	# Clamp the velocity to the maximum speed
	velocity = velocity.limit_length(max_speed)

func _process(delta):
	# Apply friction to slow down the character when no input is given
	if velocity.length() > 0:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)

	# Update position based on velocity
	position += velocity * delta
