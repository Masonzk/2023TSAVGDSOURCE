extends RigidBody2D

var start_value = 5
var current_value = 0

func _ready():
	current_value = start_value
	
func _process(delta):
	$Label.text = str(current_value)
	
func destroy():
	$AnimationPlayer.play("destroy")
	
func _on_Ball_body_entered(body):
	if body.is_in_group("bounce"):
		var formula = body.expression
		var expression = Expression.new()
		expression.parse(str(formula), ['x'])
		print(formula)
		print(current_value)
		current_value = expression.execute([current_value])
		$AnimationPlayer.play("Pulse")
