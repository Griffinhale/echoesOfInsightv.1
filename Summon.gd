extends BaseEntity

class_name Summon

# movement pattern and attack type should be enum
# that allow quick lookup and combination of patterns
# and attack types depending on mix elements
var movement_pattern
var attack_type

# lifecycle should also be variable, based on the
# input elements
var life_cycle 

var cost

var material_ratio

func _init() -> void:
	life_cycle = Timer.new()
	life_cycle.autostart=true
	life_cycle.one_shot=true
	life_cycle.wait_time=5
	add_child(life_cycle)

func _process(delta) -> void:
	if (life_cycle.is_stopped()):
		die()
	

func attack():
	pass
	
func follow_summoner():
	pass
	
func die():
	queue_free()
	
