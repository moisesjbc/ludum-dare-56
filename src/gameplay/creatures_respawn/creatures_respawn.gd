extends Path2D

var creature_scene = preload("res://gameplay/creature/creature.tscn")


func _on_respawn_timer_timeout():
	respawn_creature()
	

func respawn_creature():
	randomize()
	$path_follow.set_unit_offset(randf())
	var creature = creature_scene.instance()
	creature.global_position = $path_follow.global_position
	creature.set_feature_type("damage")
	get_node("/root/main/creatures_respawn").add_child(creature)
