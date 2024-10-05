extends KinematicBody2D


export var speed: int = 500
var bullet_scene = preload("res://gameplay/bullet/bullet.tscn")
export var shooting_cooldown_seconds = 0.5


func _process(delta):
	look_at(get_global_mouse_position())

	var velocity: Vector2 = Vector2.ZERO

	if Input.is_action_pressed("ui_up"):
		velocity.y = -1
	elif Input.is_action_pressed("ui_down"):
		velocity.y = 1

	if Input.is_action_pressed("ui_left"):
		velocity.x = -1
	elif Input.is_action_pressed("ui_right"):
		velocity.x = 1

	move_and_collide(velocity * speed * delta)

	if Input.is_action_pressed("shoot"):
		shoot()


func shoot():
	if $shooting_cooldown.is_stopped():
		$shooting_cooldown.start(shooting_cooldown_seconds)
		var bullet = bullet_scene.instance()
		bullet.velocity = (get_global_mouse_position() - global_position).normalized()
		bullet.rotation_degrees = rotation_degrees
		bullet.global_position = global_position
		get_node("/root/main").add_child(bullet)
