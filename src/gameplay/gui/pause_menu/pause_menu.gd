extends CenterContainer


func toggle(game_over_on):
	get_tree().paused = game_over_on
	visible = game_over_on


func _input(event):
	if event is InputEventKey and not event.pressed and event.scancode == KEY_ESCAPE:
		toggle(not visible)


func resume_game():
	toggle(false)


func _on_resume_button_pressed():
	resume_game()


func _on_main_menu_button_pressed():
	toggle(false)
	get_tree().change_scene("res://gui/main_menu/main_menu.tscn")
