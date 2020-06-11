extends Control

signal id_changed(id)
signal money_changed(money)
signal x_changed(x)
signal y_changed(y)
signal selected_changed(selected)
signal world_pos_changed(position)
signal building_pos_changed(position)

func _on_ID_changed(id):
	emit_signal("id_changed", id)

func _on_Money_changed(money):
	emit_signal("money_changed", money)

func _on_X_changed(x):
	emit_signal("x_changed", x)

func _on_Y_changed(y):
	emit_signal("y_changed", y)
	
func _on_selected_changed(selected):
	emit_signal("selected_changed", selected)

func _on_building_pos_changed(position):
	emit_signal("building_pos_changed", position)

func _on_world_pos_changed(position):
	emit_signal("world_pos_changed", position)
