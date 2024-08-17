extends BaseEntity

class_name Summoner

@onready var test_smn = preload("res://test_summon.tscn")

var pouch_mixes
var active_summons
var inventory

func summon_monster():
	pass
	
func switch_loadout():
	pass

func heal():
	pass

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			var m = test_smn.instantiate()
			add_child(m)
	if event is InputEventKey:
		if event.is_action("ui_down"):
			position.x += 1
			position.y += 1
		if event.is_action("ui_left"):
			position.x -= 1
			position.y += 1
		if event.is_action("ui_up"):
			position.x -= 1
			position.y -= 1
		if event.is_action("ui_right"):
			position.x += 1
			position.y -= 1
