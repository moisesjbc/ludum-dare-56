extends KinematicBody2D


export var speed: int = 500


func _ready():
	pass # Replace with function body.


func _process(delta):
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
