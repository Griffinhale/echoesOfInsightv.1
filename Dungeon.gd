extends Node2D

class_name Dungeon
# Add a switch to map generators based off string in element
# This will allow for different tiles and materials from the tileset for each dungeon
var element: String
var boss: PackedScene
var enemy_types: Array
var resources_available: Array
var tilemap_base: TileMapLayer
var tilemap_materials: TileMapLayer
var tilemap_cover: TileMapLayer
var room_size: Vector2 = Vector2(25,25)
var layout: Array = []

@onready var tileset = load("res://isoset.tres")
@onready var mat_script = load("res://tes_material.gd")


func _ready():
	generate_layout()
	generate_materials()
	generate_cover()
	
	
func generate_layout():
	layout = []
	for x in range(room_size.x):
		var row = []
		for y in range(room_size.y):
			var tile_type = choose_tile_type(x,y)
			row.append(tile_type)
		layout.append(row)
	apply_layout_to_tilemap()

func choose_tile_type(x: int, y: int) -> int:
	if x == 0 or y == 0 or x == room_size.x - 1 or y == room_size.y - 1:
		return 1 # wall
	return 0 # floor
	
func apply_layout_to_tilemap():
	if not tilemap_base:
		tilemap_base = TileMapLayer.new()
		tilemap_base.set_tile_set(tileset)
		add_child(tilemap_base)
	
	tilemap_base.clear()
	for x in range(room_size.x):
		for y in range(room_size.y):
			var tile_type = layout[x][y]
			if tile_type == 0:
				tilemap_base.set_cell(Vector2(x, y), 0, Vector2(randi_range(0,5), 0))
			else:
				tilemap_base.set_cell(Vector2(x, y), 0, Vector2(randi_range(0,5), 7))

func generate_materials():
	if not tilemap_materials:
		tilemap_materials = TileMapLayer.new()
		tilemap_materials.set_tile_set(tileset)
		add_child(tilemap_materials)
		
	for x in range(room_size.x):
		for y in range(room_size.y):
			if layout[x][y] == 0 and randf() < 0.03:
				tilemap_materials.set_cell(Vector2(x,y), 0, Vector2(0,4))
				print("test")
				var material_node = MaterialNode.new(x,y)
				material_node.name = "Mat(" + str(x) + "," + str(y) + ")"
				var tile_world_pos = tilemap_materials.map_to_local(Vector2(x,y))
				material_node.global_position = to_global(tile_world_pos)
				var collision_shape = CollisionShape2D.new()
				collision_shape.shape = CircleShape2D.new()
				collision_shape.debug_color = Color(255,255,255,1)
				collision_shape.shape.radius = 10
				material_node.add_child(collision_shape)
				material_node.add_to_group("interactable")
				print(material_node.position, material_node.global_position)
				add_child(material_node)

func generate_cover():
	pass

func spawn_enemies():
	pass

func handleBossFight():
	pass


func _on_child_exiting_tree(node: Node) -> void:
	var coord: Array
	if node.name.begins_with("!Mat"):
		coord = Array(node.name.substr(4).erase(0).split(","))
		coord[1] = coord[1].split(")")[0];
		print(coord[0], coord[1])
		tilemap_materials.erase_cell(Vector2(int(coord[0]), int(coord[1])))
	
