extends Node2D

export var emit_time : float
export var emit_direction : Vector2
export var emit_speed : float
export var default_value : float

var ball = preload("res://Scenes/Ball.tscn")

var firing = true

func _ready():
	$Timer.wait_time = emit_time
	$Timer.start()
	var angle = ((get_global_position() - emit_direction) - get_global_position()).angle()
	$Sprite.rotation = angle
	#$Sprite.look_at(emit_direction)
	
func _on_Timer_timeout():
	if firing:
		var instance = ball.instance()
		instance.position = get_global_position()
		instance.linear_velocity = emit_direction * emit_speed
		instance.start_value = default_value
		get_parent().add_child(instance)
		$AnimationPlayer.play("Pulse")
		$Timer.start()


func _on_Button_toggled(button_pressed):
	firing = !button_pressed
	if firing:
		$Sprite.modulate = Color(1, 1, 1, 0.5)
		_on_Timer_timeout()
	else:
		$Sprite.modulate = Color("#d91657")
