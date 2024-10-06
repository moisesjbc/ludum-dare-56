extends Button


func _on_play_button_pressed():
	get_node("/root/button_click").play()
