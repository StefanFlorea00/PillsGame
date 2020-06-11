extends Label

func _on_Control_x_changed(x):
	self.text = "Position: " + str(x)
