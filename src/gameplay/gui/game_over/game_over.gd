extends CenterContainer


func toggle(game_over_on):
	get_tree().paused = game_over_on
	visible = game_over_on


func _on_restart_button_pressed():
	restart()


func _input(event):
	if visible and event is InputEventKey and event.scancode == KEY_SPACE:
		restart()


func restart():
	toggle(false)
	get_tree().change_scene("res://gameplay/main/main.tscn")
