extends CharacterBody2D

const ROTATE = 0.2

func _input(event):
	if event.is_action_pressed("right"):
		rotation += ROTATE
	if event.is_action_pressed("left"):
		rotation -= ROTATE
	if event.is_action_pressed("Shoot"):
		shoot()

func shoot():
	const BULLET = preload("res://Scenes/bullet.tscn")
	var new_bullet = BULLET.instantiate()
	var shooting_point = %"Shooting point"
	new_bullet.global_position = shooting_point.global_position
	new_bullet.global_rotation = shooting_point.global_rotation
	get_tree().current_scene.add_child(new_bullet)
