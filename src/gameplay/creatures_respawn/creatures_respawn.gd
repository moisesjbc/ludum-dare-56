extends Path2D

var creature_scene = preload("res://gameplay/creature/creature.tscn")
var explosion_scene = preload("res://gameplay/explosion/explosion.tscn")
export var creature_min_speed: int = 200
export var creature_max_speed: int = 250
export var respawn_time: float = 1.5
export var good_feature_probability: float = 0.2


func _ready():
	$respawn_timer.start(respawn_time)


func _on_respawn_timer_timeout():
	respawn_creature()


func respawn_creature():
	randomize()
	$path_follow.set_unit_offset(randf())
	var creature = creature_scene.instance()
	creature.global_position = $path_follow.global_position
	
	var BAD_FEATURES = [
		FeatureType.DAMAGE
	]
	var GOOD_FEATURES = [
		FeatureType.LIFE_POWERUP,
		FeatureType.ENERGY_POWERUP
	]

	if randf() < good_feature_probability:
		var index = randi() % len(GOOD_FEATURES)
		creature.set_feature_type(GOOD_FEATURES[index])
	else:
		var index = randi() % len(BAD_FEATURES)
		creature.set_feature_type(BAD_FEATURES[index])
	creature.connect("died", self, "_on_creature_died")
	creature.speed = randi() % (creature_max_speed - creature_min_speed) + creature_min_speed
	$creatures.add_child(creature)


func _on_creature_died():
	var explosion = explosion_scene.instance()
	$explosions.add_child(explosion)
