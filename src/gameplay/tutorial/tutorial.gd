extends Node2D


var current_step_index = 0


func _ready():
	start_step(0)
	$player.movement_enabled = false
	$player.shooting_enabled = false


func next_step():
	stop_step(current_step_index)
	if current_step_index < ($steps.get_child_count() - 1):
		start_step(current_step_index + 1)
	else:
		get_tree().change_scene("res://gui/main_menu/main_menu.tscn")


func stop_step(step_index):
	$steps.get_child(step_index).visible = false
	if $steps.get_child(step_index).has_method("stop"):
		$steps.get_child(step_index).stop(self)


func start_step(step_index):
	current_step_index = step_index
	$steps.get_child(step_index).visible = true
	if $steps.get_child(step_index).has_method("start"):
		$steps.get_child(step_index).start(self)
	$instructions_panel/instructions_text.text = $steps.get_child(step_index).text
	if $steps.get_child(step_index).press_space_to_continue:
		if step_index < ($steps.get_child_count() - 1):
			$instructions_panel/instructions_text.text  += "\nPress SPACE to continue"
		else:
			$instructions_panel/instructions_text.text  += "\nPress SPACE to exit the tutorial"


func _input(event):
	if $steps.get_child(current_step_index).press_space_to_continue and event is InputEventKey and event.pressed == false and event.scancode == KEY_SPACE:
		next_step()
