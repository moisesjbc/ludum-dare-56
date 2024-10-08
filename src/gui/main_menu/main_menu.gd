extends Control


func _ready():
	$center_container/panel/magin_container/vbox_container/exit_button.visible = (OS.get_name() != "HTML5")


func _on_play_button_pressed():
	get_tree().change_scene("res://gameplay/main/main.tscn")


func _on_credits_button_pressed():
	get_tree().change_scene("res://gui/credits_menu/credits_menu.tscn")


func _on_exit_button_pressed():
	get_tree().quit()


func _on_tutorial_button_pressed():
	get_tree().change_scene("res://gameplay/tutorial/tutorial.tscn")


func _on_fullscreen_button_pressed():
	OS.window_fullscreen = not OS.window_fullscreen
