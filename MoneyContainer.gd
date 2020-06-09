extends HBoxContainer

func _on_Control_money_changed(money):
	$MoneyLabel/Money.text = str(money)
