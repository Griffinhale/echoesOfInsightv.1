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


func attack():
	pass
	
func follow_summoner():
	pass
	
func die():
	pass
	
