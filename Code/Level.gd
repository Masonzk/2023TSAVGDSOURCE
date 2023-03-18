extends Node2D

var zoom = Vector2(1, 1)
export var expressions : Array

var bouncer = preload("res://Scenes/Bounce.tscn")
onready var storage = $CanvasLayer/ColorRect

func _ready():
	var x = 0
	for formula in expressions:
		var instance = bouncer.instance()
		instance.position = Vector2(16, 608-x)
		instance.expression = formula
		instance.scale = Vector2(0.75, 0.75)
		storage.add_child(instance)
		x += 92
		
func level_completed():
	print("level completed")
	
func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Menu.tscn")
	
func _process(delta):
	#print($CanvasLayer/ColorRect/Bounce.position)
	$Camera2D.zoom = lerp($Camera2D.zoom, zoom, 0.1)
	zoom.x = clamp(zoom.x, 0.5, 2)
	zoom.y = clamp(zoom.y, 0.5, 2)
	#$ColorRect.rect_position.x = -(1280*(zoom.x-1)) / 2
	
func respawn(expression):
	pass
	
func _on_ZoomInButton_pressed():
	zoom -= Vector2(0.25, 0.25)

func _on_ZoomOutButton_pressed():
	zoom += Vector2(0.25, 0.25)
