extends Area2D

func _ready() -> void:
	# Koble til body_entered-signal i Godot 4
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: PhysicsBody2D) -> void:
	# Sjekk om objeket er en CharacterBody2D (for eksempel Bullet)
	if body is CharacterBody2D:
		# Reduser farten med 40% -> velocity *= 0.6
		body.velocity *= 2
