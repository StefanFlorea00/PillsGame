extends HBoxContainer

func _on_Control_y_changed(y):
	$PositionYLabel/Y.text = str(y)
