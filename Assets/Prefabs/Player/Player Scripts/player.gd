extends CharacterBody2D
const SPEED: int = 600
#this is for the startup of the players movement
#acceleration = 0.20 feels nice
const acceleration: float = 0.20
#this is for when the player releases a key
#friction = 0.15 feels nice
const friction: float = 0.15

func get_input() -> void:
	var input_direction: Vector2 = Input.get_vector("PlayerLeft", "PlayerRight", "PlayerUp", "PlayerDown").normalized()
	if input_direction == Vector2.ZERO:
		velocity = lerp(velocity, Vector2.ZERO * SPEED, friction)
	else:	
		velocity = lerp(velocity, input_direction * SPEED, acceleration)

func _physics_process(_delta: float) -> void:
	get_input()
	#move and slide has _delta built in
	move_and_slide()
