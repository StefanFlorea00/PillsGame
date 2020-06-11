extends Control

signal id_changed(id)
signal money_changed(money)
signal x_changed(x)
signal y_changed(y)

func _on_World_selected_changed(id, position, money):
	emit_signal("id_changed", id)
	emit_signal("money_changed", money)
	emit_signal("x_changed", position)
