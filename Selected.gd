extends HBoxContainer


func _on_Control_selected_changed(selected):
	$SelectedValue/Selected.text = str(selected)
