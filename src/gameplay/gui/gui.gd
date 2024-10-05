extends Control


func _ready():
	set_player_life(100)


func _on_player_life_changed(life):
	set_player_life(life)


func set_player_life(life):
	$life_label.text = str(life)


func _on_player_died():
	set_player_life(0)
	$game_over.toggle(true)
