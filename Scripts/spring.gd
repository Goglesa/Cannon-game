extends CharacterBody2D

const BOUNCE_FORCE = 1000
var is_jumping = false

func _ready():
	$BounceArea.body_entered.connect(Callable(self, "_on_BounceArea_body_entered"))
	$JumpTimer.one_shot = true
	$JumpTimer.wait_time = 0.5  # Adjust to your jump animation's duration
	$JumpTimer.connect("timeout", Callable(self, "_on_jump_timeout"))

func _on_BounceArea_body_entered(body):
	if body == self:
		return  # Ignore self-collision
	if not is_jumping:
		is_jumping = true
		$AnimatedSprite2D.play("jump")
		$JumpTimer.start()
	print("Bounce triggered by: ", body.name)
	if body is CharacterBody2D:
		body.velocity = Vector2(body.velocity.x, -BOUNCE_FORCE)
	elif body is RigidBody2D:
		body.linear_velocity = Vector2(body.linear_velocity.x, -BOUNCE_FORCE)

func _on_jump_timeout():
	is_jumping = false
	$AnimatedSprite2D.play("idle")
