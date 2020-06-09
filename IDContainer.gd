extends HBoxContainer

func _on_Control_id_changed(id):
	$IDLabel/ID.text = str(id)
