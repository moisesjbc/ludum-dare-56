extends Control


var elapsed_minutes = 0
var elapsed_seconds = 0


func _ready():
	set_player_life(100)


func _on_player_life_changed(life):
	set_player_life(life)


func set_player_life(life):
	$life_panel/life_label.text = str(life)


func _on_player_died():
	set_player_life(0)
	$game_over.toggle(true)


func _on_player_energy_changed(energy):
	set_player_energy(energy)


func set_player_energy(energy):
	$energy_panel/energy_label.text = str("%0.0f" % energy)


func _on_game_timer_timeout():
	if elapsed_seconds < 59:
		elapsed_seconds += 1
	else:
		elapsed_seconds = 0
		elapsed_minutes += 1
	$time_panel/time_label.text = "%02d:%02d" % [elapsed_minutes, elapsed_seconds]
