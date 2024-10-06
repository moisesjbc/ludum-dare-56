extends KinematicBody2D


export var speed: int = 1000
var velocity


func _process(delta):
	var collision = move_and_collide(velocity * speed * delta)

	if collision and collision.collider.is_in_group("creatures"):
		queue_free()
		collision.collider.die()


func _on_visibility_notifier_viewport_exited(viewport):
	queue_free()
