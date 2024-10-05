extends Control


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
	$energy_label.text = str("%0.2f" % energy)
