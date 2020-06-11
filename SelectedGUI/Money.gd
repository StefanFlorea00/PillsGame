extends Label

func _on_Control_money_changed(money):
	self.text = "Money: " + str(money)
