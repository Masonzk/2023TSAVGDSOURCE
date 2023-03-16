extends StaticBody2D

var mouse_in = false
var held = false

var stored = true

#export var formula_change : Dictionary
#export var visible_formula_change : String
var expression : String = ""

var color_red = Color("#d91657")
var color_blue = Color("#30b0ff")
var color_purple = Color("#9a2abf")
var color_white = Color("#fff7f8")
var color_green = Color("#5fb874")
var color_yellow = Color("#ffcd75")
var color_orange = Color("#eda95a")
var color_brown = Color("#593b2a")

func _ready():
	$Label.text = expression
	$CollisionShape2D.disabled = true
	$Sprite.modulate = get_color()
	#$Sprite.modulate = Color(1, 1, rand_range(0, 1), 1)
	
func get_color():
	var operators = []
	for num in range(expression.length()):
		var character = expression[num]
		if character == "*" or character == "+" or character == "-":
			operators.append(character)
	print(operators)
	if operators.size() > 1:
		#Multiple operaters
		return color_brown
	else:
		if operators[0] == "+":
			#Plus
			return color_red
		if operators[0] == "-":
			#Minus
			return color_blue
		if operators[0] == "*":
			#Times
			return color_purple
	
func _process(delta):
	drag()

func drag():
	#Pickup
	if Input.is_action_just_pressed("mouse_left") and mouse_in and !Globals.holding:
		held = true
		Globals.holding = true
		$CollisionShape2D.disabled = true
		if get_parent().is_in_group("storage"):
			var root = get_parent().get_parent().get_parent()
			get_parent().remove_child(self)
			root.add_child(self)
			scale = Vector2(1, 1)
			global_position = get_global_mouse_position()
			self.set_owner(root)
	#Setdown
	if Input.is_action_just_released("mouse_left") and held:
		held = false
		Globals.holding = false
	
	#Track mouse position
	if held:
		#print(position)
		#print(get_global_mouse_position())
		global_position = lerp(global_position, get_global_mouse_position(), 0.25)
		#global_position = get_global_mouse_position()
	#Enable/disable collision based on overlapping.
	else:
		if $Area2D.get_overlapping_bodies() == []:
			$CollisionShape2D.disabled = false
		else:
			for body in $Area2D.get_overlapping_bodies():
				if body is RigidBody2D:
					$CollisionShape2D.disabled = true
					
func _on_Area2D_mouse_entered():
	mouse_in = true
	
func _on_Area2D_mouse_exited():
	mouse_in = false
