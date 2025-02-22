extends CharacterBody2D

const BOUNCE_FORCE = 2000

func _ready():
	$BounceArea.body_entered.connect(Callable(self, "_on_BounceArea_body_entered"))

func _on_BounceArea_body_entered(body):
	print("Bounce triggered by: ", body.name)
	if body is CharacterBody2D:
		body.velocity = Vector2(body.velocity.x, -BOUNCE_FORCE)
	elif body is RigidBody2D:
		body.linear_velocity = Vector2(body.linear_velocity.x, -BOUNCE_FORCE)
