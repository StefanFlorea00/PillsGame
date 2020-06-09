extends Node

class_name Building
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var id = 0
var money = 15
var owned = false
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
	
func getMoney():
	return money
	
func setX(x):
	self.x = x

func setY(y):
	self.y = y

func isOwned():
	return owned
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
