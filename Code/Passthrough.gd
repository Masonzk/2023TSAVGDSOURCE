extends StaticBody2D

export var formula : String = ""

func _on_Area2D_body_entered(body):
	if body.is_in_group("ball"):
		var expression = Expression.new()
		expression.parse(str(formula), ['x'])
		body.current_value = expression.execute([body.current_value])
		#PLAY ANIMATION FOR PASSING THROUGH WALL
		#$AnimationPlayer.play("Pulse")
