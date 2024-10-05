extends KinematicBody2D


onready var player = get_node("/root/main/player")
export var speed: int = 200
var feature_index

var player_damage = 30


func _ready():
	hide_feature()


func _process(delta):
	$sprite.look_at(player.global_position)
	
	var velocity: Vector2 = (player.global_position - global_position).normalized()
	var collision = move_and_collide(velocity * speed * delta)
	if collision and collision.collider.name == "player":
		apply_feature(player)
		queue_free()


func display_feature():
	$features.visible = true


func hide_feature():
	$features.visible = false


func set_feature_type(feature_type):
	for feature in $features.get_children():
		if feature.name == feature_type:
			feature.visible = true
			feature_index = 0
		else:
			feature.visible = false


func apply_feature(player):
	player.damage(player_damage)
