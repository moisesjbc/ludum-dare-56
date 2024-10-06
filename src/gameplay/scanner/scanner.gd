extends Area2D


onready var player = get_node("/root/main/player")

var energy_cost_per_second = 10


func _ready():
	if player == null:
		player = get_node("/root/tutorial/player")
	visible = false
	toggle_scanner(false)


func _process(delta):
	global_position = get_global_mouse_position()
	
	if Input.is_action_just_pressed("scan"):
		toggle_scanner(true)
	elif Input.is_action_just_released("scan"):
		toggle_scanner(false)
		
	if visible == true:
		if not player.consume_energy(energy_cost_per_second * delta):
			toggle_scanner(false)


func _on_scanner_body_entered(body):
	if body.is_in_group("creatures"):
		body.display_feature()


func _on_scanner_body_exited(body):
	if body.is_in_group("creatures"):
		body.hide_feature()


func toggle_scanner(scanner_on):
	visible = scanner_on
	$collision_shape.disabled = not scanner_on
