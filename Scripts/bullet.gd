extends CharacterBody2D

const SPEED = 1000
const GRAVITY = 2000
const RANGE = 1200
var travelled_distance = 0

func _ready():
	velocity = Vector2.RIGHT.rotated(rotation) * SPEED

func _physics_process(delta):
	velocity.y += GRAVITY * delta
	var initial_velocity = velocity  # Store pre-collision velocity
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		travelled_distance += collision.get_travel().length()
		# Bounce with energy loss (0.8 = 80% speed retained)
		velocity = initial_velocity.bounce(collision.get_normal()) * 0.8
		
		# Calculate remaining movement using REMAINDER LENGTH
		var remaining_distance = collision.get_remainder().length()
		var remaining_movement = velocity.normalized() * remaining_distance
		move_and_collide(remaining_movement)
		
		if travelled_distance > RANGE:
			queue_free()
	else:
		travelled_distance += velocity.length() * delta
		if travelled_distance > RANGE:
			queue_free()
