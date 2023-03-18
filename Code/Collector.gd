extends StaticBody2D

export var desired_value : float

func _ready():
	$Label.text = str(desired_value)
	
func _process(delta):
	for body in $Area2D.get_overlapping_bodies():
		if body.is_in_group("ball"):
			if body.current_value == desired_value:
				body.destroy()
				body.get_node("CollisionShape2D").disabled = true
				body.linear_velocity = (global_position - body.global_position) * 5
				get_parent().level_completed()
