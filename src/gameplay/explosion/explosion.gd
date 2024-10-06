extends Node2D


func _ready():
	$explosion.play()


func _on_explosion_finished():
	queue_free()
