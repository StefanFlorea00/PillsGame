extends Label

func _on_Control_id_changed(id):
	self.text="Selected building: " + str(id)
