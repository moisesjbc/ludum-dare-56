extends Area2D


func _ready():
	visible = false
	#set_process(false)


func _process(delta):
	global_position = get_global_mouse_position()
	
	if Input.is_action_just_pressed("scan"):
		visible = true
		$collision_shape.disabled = false
	elif Input.is_action_just_released("scan"):
		visible = false
		$collision_shape.disabled = true


func _on_scanner_body_entered(body):
	if body.is_in_group("creatures"):
		body.display_feature()


func _on_scanner_body_exited(body):
	if body.is_in_group("creatures"):
		body.hide_feature()
