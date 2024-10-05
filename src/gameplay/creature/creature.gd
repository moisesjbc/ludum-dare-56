extends KinematicBody2D


onready var player = get_node("/root/main/player")
export var speed: int = 200
var current_feature_index

# Value of the current feature. For example, if current featuer is damage, feature_value
# specifies the damage caused to the player.
var feature_value = 30


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
	$feature_panel.visible = true
	$features.visible = true


func hide_feature():
	$feature_panel.visible = false
	$features.visible = false


func set_feature_type(new_feature_index):
	current_feature_index = new_feature_index
	for feature_index in $features.get_child_count():
		$features.get_child(feature_index).visible = (feature_index == current_feature_index)


func apply_feature(player):
	if current_feature_index == 0:
		player.damage(feature_value)
	elif current_feature_index == 1:
		player.heal(feature_value)
	elif current_feature_index == 2:
		player.recharge_energy(feature_value)
