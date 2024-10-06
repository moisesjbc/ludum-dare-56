extends Path2D

var creature_scene = preload("res://gameplay/creature/creature.tscn")
var explosion_scene = preload("res://gameplay/explosion/explosion.tscn")


func _on_respawn_timer_timeout():
	respawn_creature()


func respawn_creature():
	randomize()
	$path_follow.set_unit_offset(randf())
	var creature = creature_scene.instance()
	creature.global_position = $path_follow.global_position
	creature.set_feature_type(randi()%3)
	creature.connect("died", self, "_on_creature_died")
	get_node("/root/main/creatures_respawn").add_child(creature)


func _on_creature_died():
	print("DIED!")
	var explosion = explosion_scene.instance()
	$explosions.add_child(explosion)
