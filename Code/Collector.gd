extends StaticBody2D

export var desired_value : float

func _ready():
	$Label.text = str(desired_value)
	
func _on_Area2D_body_entered(body):
	if body.is_in_group("ball"):
		if body.current_value == desired_value:
			body.destroy()
			get_parent().level_completed()
