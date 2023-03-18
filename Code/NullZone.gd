extends StaticBody2D

func _on_Area2D_body_entered(body):
	if body.is_in_group("ball"):
		#body.get_node("CollisionShape2D").disabled = true
		body.get_node("AnimationPlayer").play("null")
