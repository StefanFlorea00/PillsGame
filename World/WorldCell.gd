extends Node

class_name WorldCell
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var id = 0
var x = 0
var y = 0
var selected = false
var position = Vector2(x,y)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func getX():
	return x
	
func getY():
	return y
	
func setX(xx):
	self.x = xx

func setY(yy):
	self.y = yy
		
func getPosition():
	return position
	
func getSelected():
	return selected

func setSelected(select):
	self.selected = select
