extends HBoxContainer

func _on_Control_x_changed(x):
	$PositionXLabel/X.text = str(x)
