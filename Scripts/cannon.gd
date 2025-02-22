extends CharacterBody2D

@export var rotation_speed: float = 1.0

var rotating_right = false
var rotating_left = false

func _input(event):
	if event.is_action_pressed("right"):
		rotating_right = true
	elif event.is_action_released("right"):
		rotating_right = false

	if event.is_action_pressed("left"):
		rotating_left = true
	elif event.is_action_released("left"):
		rotating_left = false

	if event.is_action_pressed("Shoot"):
		shoot()

func _process(delta):
	if rotating_right:
		rotation += rotation_speed * delta
	if rotating_left:
		rotation -= rotation_speed * delta

func shoot():
	const BULLET = preload("res://Scenes/bullet.tscn")
	var new_bullet = BULLET.instantiate()
	var shooting_point = %"Shooting point"
	new_bullet.global_position = shooting_point.global_position
	new_bullet.global_rotation = shooting_point.global_rotation
	get_tree().current_scene.add_child(new_bullet)
