extends Control

func _on_Button_pressed():
	Globals.current_level = 1
	get_tree().change_scene("res://Scenes/Levels/1.tscn")

func _on_Button2_pressed():
	Globals.current_level = 2
	get_tree().change_scene("res://Scenes/Levels/2.tscn")
	
func _on_Button3_pressed():
	Globals.current_level = 3
	get_tree().change_scene("res://Scenes/Levels/3.tscn")

func _on_Button4_pressed():
	Globals.current_level = 4
	get_tree().change_scene("res://Scenes/Levels/4.tscn")

func _on_Button5_pressed():
	Globals.current_level = 5
	get_tree().change_scene("res://Scenes/Levels/5.tscn")

func _on_Button6_pressed():
	Globals.current_level = 6
	get_tree().change_scene("res://Scenes/Levels/6.tscn")

func _on_Button7_pressed():
	Globals.current_level = 7
	get_tree().change_scene("res://Scenes/Levels/7.tscn")

func _on_Button8_pressed():
	Globals.current_level = 8
	get_tree().change_scene("res://Scenes/Levels/8.tscn")

func _on_Button9_pressed():
	Globals.current_level = 9
	get_tree().change_scene("res://Scenes/Levels/9.tscn")

func _on_Button10_pressed():
	Globals.current_level = 10
	get_tree().change_scene("res://Scenes/Levels/10.tscn")


func _on_Button11_pressed():
	Globals.current_level = 0
	get_tree().change_scene("res://Scenes/Levels/Tutorial.tscn")
