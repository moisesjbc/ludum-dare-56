extends KinematicBody2D


onready var player = get_node("/root/main/player")
export var speed: int = 400


func _ready():
	hide_feature()


func _process(delta):
	$sprite.look_at(player.global_position)
	
	var velocity: Vector2 = (player.global_position - global_position).normalized()
	var collision = move_and_collide(velocity * speed * delta)
	if collision and collision.collider.name == "player":
		queue_free()


func display_feature():
	$features.visible = true


func hide_feature():
	$features.visible = false
