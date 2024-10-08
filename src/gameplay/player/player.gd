extends KinematicBody2D


export var speed: int = 500
var life: int = 100
var bullet_scene = preload("res://gameplay/bullet/bullet.tscn")
export var shooting_cooldown_seconds = 0.5
var energy: float = 100.0
var energy_charge_per_second = 5
var energy_cost_per_shot = 5


signal life_changed
signal died
signal energy_changed


var movement_enabled = true
var shooting_enabled = true


func _process(delta):
	look_at(get_global_mouse_position())

	if movement_enabled:
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

	if Input.is_action_pressed("shoot") and shooting_enabled:
		shoot()

	recharge_energy(energy_charge_per_second * delta)


func shoot():
	if $shooting_cooldown.is_stopped() and consume_energy(energy_cost_per_shot):
		$shooting_cooldown.start(shooting_cooldown_seconds)
		$audios/shot.play()
		var bullet = bullet_scene.instance()
		bullet.velocity = (get_global_mouse_position() - $shooting_respawn_position.global_position).normalized()
		bullet.rotation_degrees = rotation_degrees
		bullet.global_position = $shooting_respawn_position.global_position
		get_parent().add_child(bullet)


func damage(damage_delta):
	life -= damage_delta
	$audios/hit.play()
	if life <= 0:
		life = 0
		emit_signal("died")
	emit_signal("life_changed", life)
	

func heal(life_delta):
	$audios/life_powerup.play()
	life += life_delta
	if life > 0:
		life = 100
	emit_signal("life_changed", life)


func consume_energy(energy_cost):
	if energy > energy_cost:
		energy -= energy_cost
		emit_signal("energy_changed", energy)
		return true
	else:
		return false


func recharge_energy(energy_delta, powerup=false):
	if powerup:
		$audios/energy_powerup.play()
	energy += energy_delta
	if energy > 100:
		energy = 100.0
	emit_signal("energy_changed", energy)
