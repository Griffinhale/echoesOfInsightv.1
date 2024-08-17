extends BaseEntity

class_name Enemy

# should contain data relevant to the observation and 
# "understanding" of the enemy for later summoning
# should also contain a sort of bookmarked progression
# system with specific beats to provide understanding
#
# if possible it might be cool to use this opportunity to
# explore the different animal archetypes in the context
# of each spiritual element

func _init():
	health = 3


func _on_area_2d_area_entered(area):
	health-=1
	print(health)

func _process(delta):
	if health == 0:
		#Should play death animation then
		queue_free()
