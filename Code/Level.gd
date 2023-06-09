extends Node2D

var zoom = Vector2(1, 1)
export var expressions : Array

var bouncer = preload("res://Scenes/Bounce.tscn")
onready var storage = $CanvasLayer/ColorRect

export var hint_value : String = ""

func _ready():
	var x = 0
	for formula in expressions:
		var instance = bouncer.instance()
		instance.position = Vector2(16, 608-x)
		instance.expression = formula
		instance.scale = Vector2(0.75, 0.75)
		storage.add_child(instance)
		x += 92
	$CanvasLayer/HintLabel.text = hint_value
	$CanvasLayer/CanvasLayer/Panel.visible = false
	
func level_completed():
	print("level completed")
	$CanvasLayer/CPUParticles2D.emitting = true
	$CanvasLayer/CanvasLayer/Panel.visible = true

func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Menu.tscn")
	
func respawn(expression):
	var pos = expressions.find(expression, 0)
	var instance = bouncer.instance()
	instance.position = Vector2(16, 608-pos*92)
	instance.expression = expression
	instance.scale = Vector2(0.75, 0.75)
	storage.add_child(instance)
	
func _process(delta):
	#print($CanvasLayer/ColorRect/Bounce.position)
	$Camera2D.zoom = lerp($Camera2D.zoom, zoom, 0.1)
	zoom.x = clamp(zoom.x, 0.5, 2)
	zoom.y = clamp(zoom.y, 0.5, 2)
	#$ColorRect.rect_position.x = -(1280*(zoom.x-1)) / 2
	
func _on_ZoomInButton_pressed():
	zoom -= Vector2(0.25, 0.25)

func _on_ZoomOutButton_pressed():
	zoom += Vector2(0.25, 0.25)


func _on_HintButton_pressed():
	$CanvasLayer/HintLabel.visible = true
	
func _on_Button2_pressed():
	Globals.current_level += 1
	get_tree().change_scene("res://Scenes/Levels/" + str(Globals.levels[Globals.current_level]) + ".tscn")
