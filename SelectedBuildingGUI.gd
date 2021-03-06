extends Control

signal id_changed(id)
signal money_changed(money)
signal x_changed(x)
signal y_changed(y)

func _on_ID_changed(id):
	emit_signal("id_changed", id)

func _on_Money_changed(money):
	emit_signal("money_changed", money)

func _on_X_changed(x):
	emit_signal("x_changed", x)

func _on_Y_changed(y):
	emit_signal("y_changed", y)
